import psycopg2
from colorama import init as colorama_init, Fore, Style, Back
colorama_init(autoreset=True)  # Configuração do Colorama para formatar saídas de texto

# Imprime os comentários de uma publicação
def imprimir_comentarios_de(cursor: 'psycopg2.cursor', id_publicacao: int, offset: int = 1) -> None:
    cursor.execute('''
                       SELECT PUBLICACAO.id_publicacao, PUBLICACAO.id_perfil, data_publicacao, texto, COUNT(CURTIDA.data_curtida) AS curtidas
                        FROM COMENTARIO
                        JOIN PUBLICACAO ON COMENTARIO.id_comentario = PUBLICACAO.id_publicacao -- para obter o conteúdo
                        LEFT JOIN CURTIDA ON COMENTARIO.id_comentario = CURTIDA.id_publicacao -- para obter as curtidas
                        WHERE COMENTARIO.comentado_em = %s -- argumento
                        GROUP BY  PUBLICACAO.id_publicacao, PUBLICACAO.id_perfil, PUBLICACAO.data_publicacao, PUBLICACAO.texto;
                        ''', (id_publicacao,))
    registros = cursor.fetchall()
    
    # Imprime os comentários
    for registro_comentario in registros:
        _, id_perfil, data_publicacao, texto, curtidas = registro_comentario
        print(f'{'\t'*offset}> {Fore.CYAN}{id_perfil}{Style.RESET_ALL} em {Fore.BLUE}{data_publicacao}{Style.RESET_ALL}: {Fore.LIGHTBLACK_EX}{texto} {Style.RESET_ALL}({curtidas} curtidas)')  
    
    return [registro_comentario[0] for registro_comentario in registros]

#  Imprime os comentários recursivamente, ou seja, imprime os comentários de um comentário
def imprimir_comentarios_rec(cursor: 'psycopg2.cursor', id_publicacao: int, offset: int = 1) -> None:
    comentarios = imprimir_comentarios_de(cursor, id_publicacao, offset)
    for id_comentario in comentarios:
        imprimir_comentarios_rec(cursor, id_comentario, offset+1)
    
# Imprime o feed de publicações
def ver_feed(cursor: 'psycopg2.cursor', quantiade: int = 5, aleatorio:bool=False) -> None:
    cursor.execute('''
                    SELECT PERFIL.nome, PUBLICACAO.data_publicacao, PUBLICACAO.id_publicacao, PUBLICACAO.texto, 
                                COUNT(DISTINCT CURTIDA.id_perfil), COUNT(DISTINCT COMENTARIO.id_comentario)
                        FROM PUBLICACAO
                        JOIN PUBLICACAO_FEED USING (id_publicacao)
                        JOIN PERFIL ON PUBLICACAO.id_perfil = PERFIL.id_perfil
                        LEFT JOIN CURTIDA USING (id_publicacao) 
                        -- para obter a contagem de curtidas
                        LEFT JOIN COMENTARIO ON PUBLICACAO.id_publicacao = COMENTARIO.comentado_em 
                        -- para obter a contagem de comentários
                        GROUP BY PUBLICACAO.id_publicacao, PUBLICACAO.texto, PERFIL.nome, PUBLICACAO.data_publicacao
                        LIMIT %s;
                    ''', (quantiade,))
    for registro in cursor.fetchall():    
        nome_perfil, data, id_publicacao, texto, curtidas, comentarios = registro
        
        # Imprime a publicação
        print(f'\n\n{Fore.CYAN}{nome_perfil}{Style.RESET_ALL} em {Fore.BLUE}{data}{Style.RESET_ALL}')
        print(f'{texto}')
        print(f'{Fore.YELLOW}{curtidas} curtidas{Style.RESET_ALL} e {Fore.YELLOW}{comentarios} comentários{Style.RESET_ALL}')
        
        # Imprime os comentários da publicação incluindo os comentários dos comentários
        imprimir_comentarios_rec(cursor, id_publicacao)

# Imprime o perfil pessoal
def ver_perfil_pessoal(cursor: 'psycopg2.cursor', id_perfil: str) -> None:
    cursor.execute('''
                    SELECT id_perfil, nome, descricao_longa, 
                    localizacao, descricao_curta
                    FROM PESSOAS
                    WHERE id_perfil = %s;''', (id_perfil,))
    
    registro = cursor.fetchone()
    if registro is None:
        print('Perfil não encontrado')
        return
    
    id_perfil, nome, descricao_longa, localizacao, descricao_curta = registro
    print(f'{Fore.CYAN}{nome}\n{Fore.YELLOW}{localizacao}\n{Style.RESET_ALL}{descricao_curta}\n\n\t{Fore.LIGHTBLACK_EX}{descricao_longa}\n{Style.RESET_ALL}')
    
    # Experiências
    cursor.execute('''
                   SELECT COMPANHIAS.nome, titulo, data_inicio, data_fim, descricao
                    FROM EXPERIENCIA 
                    JOIN COMPANHIAS ON (id_perfil_companhia = COMPANHIAS.id_perfil) 
                    JOIN PERFIL ON (id_perfil_pessoal = PERFIL.id_perfil)
                    WHERE PERFIL.id_perfil = %s
                    ORDER BY data_inicio DESC;''', (id_perfil,))
    
    experiencias = cursor.fetchall()
    if(len(experiencias) > 0):
        print(f'{Fore.YELLOW}Experiências{Style.RESET_ALL}')
        for experiencia in experiencias:
            nome_empresa, titulo, data_inicio, data_fim, descricao = experiencia
            print(f'{Fore.BLUE}{titulo}{Style.RESET_ALL} em {Fore.CYAN}{nome_empresa} {Style.RESET_ALL}({data_inicio} - {data_fim if data_fim is not None else "Atual"})\n\t{Fore.LIGHTBLACK_EX}{descricao}')

    # Eventos inscritos
    cursor.execute('''
                   SELECT EVENTO.nome, EVENTO.data_evento, EVENTO.localizacao
                    FROM EVENTO
                    JOIN INSCRICAO_EVENTO USING (id_evento)
                    WHERE INSCRICAO_EVENTO.id_perfil = %s;''', (id_perfil,))
    
    eventos = cursor.fetchall()
    if(len(eventos) > 0):
        print(f'\n\n{Fore.YELLOW}Eventos inscritos{Style.RESET_ALL}')
        for evento in eventos:
            nome_evento, data_evento, localizacao = evento
            print(f'{Fore.BLUE}{nome_evento}{Style.RESET_ALL} em {Fore.CYAN}{localizacao}{Style.RESET_ALL} ({data_evento})')
    
    # Vagas aplicadas
    cursor.execute('''
                   SELECT VAGA.nome, APLICACAO_VAGA.data_inscricao, APLICACAO_VAGA.estado,
                    PERFIL.id_perfil as id_companhia, PERFIL.nome as nome_companhia
                    FROM PESSOAS 
                    JOIN APLICACAO_VAGA ON (PESSOAS.id_perfil = APLICACAO_VAGA.id_perfil)
                    JOIN VAGA USING (id_vaga)
                    JOIN PERFIL ON (VAGA.id_perfil = PERFIL.id_perfil)
                    WHERE APLICACAO_VAGA.id_perfil = %s;''', (id_perfil,))
    
    aplicacoes = cursor.fetchall()
    if(len(aplicacoes) > 0):
        print(f'\n\n{Fore.YELLOW}Aplicações{Style.RESET_ALL}')
        for aplicacao in aplicacoes:
            nome_vaga, data_inscricao, estado, id_companhia, nome_companhia = aplicacao
            print(f'{Fore.BLUE}{nome_vaga}{Style.RESET_ALL} em {Fore.CYAN}{nome_companhia}{Style.RESET_ALL} ({estado}) ({data_inscricao})')
            
    cursor.execute('''
                   SELECT PERFIL.id_perfil, nome, data_seguimento
                    FROM SEGUIMENTO
                    JOIN PERFIL ON (SEGUIMENTO.id_perfil_seguido = PERFIL.id_perfil)
                    WHERE SEGUIMENTO.id_perfil = %s;''', (id_perfil,))
    
    # Seguindo
    seguidos = cursor.fetchall()
    if(len(seguidos) > 0):
        print(f'\n\n{Fore.YELLOW}Seguindo{Style.RESET_ALL}')
        for seguido in seguidos:
            id_seguido, nome_seguido, data_seguimento = seguido
            print(f'{Fore.CYAN}{nome_seguido}{Style.RESET_ALL} ({id_seguido}) desde {Fore.BLUE}{data_seguimento}{Style.RESET_ALL}')
            
    cursor.execute('''
                   SELECT PERFIL.id_perfil, nome, data_seguimento
                    FROM SEGUIMENTO
                    JOIN PERFIL ON (SEGUIMENTO.id_perfil = PERFIL.id_perfil)
                    WHERE SEGUIMENTO.id_perfil_seguido = %s;''', (id_perfil,))
    
    # Seguidores
    seguidores = cursor.fetchall()
    if(len(seguidores) > 0):
        print(f'\n\n{Fore.YELLOW}Seguidores{Style.RESET_ALL}')
        for seguidor in seguidores:
            id_seguidor, nome_seguidor, data_seguimento = seguidor
            print(f'{Fore.CYAN}{nome_seguidor}{Style.RESET_ALL} ({id_seguidor}) desde {Fore.BLUE}{data_seguimento}{Style.RESET_ALL}')
            

# Imprime o perfil de companhia
def ver_perfil_companhia(cursor: 'psycopg2.cursor', id_perfil: str) -> None:
    cursor.execute('''
                    SELECT id_perfil, nome, descricao_longa, 
                    localizacao
                    FROM COMPANHIAS
                    WHERE id_perfil = %s;''', (id_perfil,))

    registro = cursor.fetchone()
    if registro is None:
        print('Perfil não encontrado')
        return
    
    id_perfil, nome, descricao_longa, localizacao = registro    
    print(f'{Fore.CYAN}{nome}\n{Fore.YELLOW}{localizacao}\n{Fore.LIGHTBLACK_EX}{descricao_longa}\n{Style.RESET_ALL}')
    
    # Vagas publicadas pela companhia
    cursor.execute('''
                   SELECT VAGA.id_vaga, VAGA.nome nome_vaga, COMPANHIAS.nome nome_empresa, 
		            VAGA.data_publicacao, VAGA.localizacao, VAGA.modalidade
                    FROM COMPANHIAS
                    JOIN VAGA on (COMPANHIAS.id_perfil = VAGA.id_perfil)
                    WHERE COMPANHIAS.id_perfil = %s
                    ORDER BY VAGA.data_publicacao DESC;''', (id_perfil,))
    
    vagas = cursor.fetchall()
    if(len(vagas) > 0):
        print(f'{Fore.YELLOW}Vagas{Style.RESET_ALL}')
        for vaga in vagas:
            id_vaga, nome_vaga, nome_empresa, data_publicacao, localizacao, modalidade = vaga
            print(f'{Fore.BLUE}{nome_vaga}{Style.RESET_ALL} em {Fore.CYAN}{nome_empresa}{Style.RESET_ALL} ({modalidade}) ({data_publicacao})')
            
            # Aplicações para a vaga
            cursor.execute('''
                           SELECT  PERFIL.id_perfil as id_candidato, PERFIL.nome as nome_candidato, APLICACAO_VAGA.data_inscricao, APLICACAO_VAGA.estado
                            FROM VAGA
                            LEFT JOIN APLICACAO_VAGA ON (VAGA.id_vaga = APLICACAO_VAGA.id_vaga)
                            JOIN PERFIL ON (APLICACAO_VAGA.id_perfil = PERFIL.id_perfil)
                            WHERE VAGA.id_vaga = %s
                            ORDER BY APLICACAO_VAGA.data_inscricao DESC;''', (id_vaga,))
            
            aplicacoes = cursor.fetchall()
            if(len(aplicacoes) > 0):
                print(f'\t{Fore.YELLOW}Aplicações{Style.RESET_ALL}')
                for aplicacao in aplicacoes:
                    id_candidato, nome_candidato, data_inscricao, estado = aplicacao
                    print(f'\t{Fore.CYAN}{nome_candidato}{Style.RESET_ALL} ({id_candidato}) ({estado}) ({data_inscricao})')
            else: 
                print('\tSem aplicações');
    
    # Eventos da companhia 
    cursor.execute('''
                   SELECT EVENTO.id_evento, EVENTO.nome, EVENTO.data_evento, EVENTO.localizacao
                    FROM EVENTO
                    WHERE EVENTO.id_perfil = %s
                    ORDER BY EVENTO.data_evento DESC;''', (id_perfil,))
    
    eventos = cursor.fetchall()
    
    if(len(eventos) > 0):
        print(f'\n\n{Fore.YELLOW}Eventos{Style.RESET_ALL}')
        for evento in eventos:
            id_evento, nome_evento, data_evento, localizacao = evento
            print(f'{Fore.BLUE}{nome_evento}{Style.RESET_ALL} em {Fore.CYAN}{localizacao}{Style.RESET_ALL} ({data_evento})')
            
            # Participantes do evento
            cursor.execute('''
                           SELECT PERFIL.id_perfil as id_participante, PERFIL.nome as nome_participante
                            FROM EVENTO
                            JOIN INSCRICAO_EVENTO ON (EVENTO.id_evento = INSCRICAO_EVENTO.id_evento)
                            JOIN PERFIL ON (INSCRICAO_EVENTO.id_perfil = PERFIL.id_perfil)
                            WHERE EVENTO.id_evento = %s
                            ORDER BY PERFIL.nome''', (id_evento,))
            
            participantes = cursor.fetchall()
            if(len(participantes) > 0):
                print(f'\t{Fore.YELLOW}Participantes{Style.RESET_ALL}')
                mensagem = ', '.join([f'\t{Fore.CYAN}{nome_participante}{Style.RESET_ALL} ({id_participante})' for id_participante, nome_participante in participantes])
                print(mensagem)
            else: 
                print('\tSem participantes');
                
    # Funcionários da companhia
    cursor.execute('''SELECT id_perfil, nome, localizacao, foto_perfil, titulo, data_inicio, descricao
                    FROM PERFIL 
                    JOIN EXPERIENCIA ON (EXPERIENCIA.id_perfil_pessoal = PERFIL.id_perfil)
                    WHERE id_perfil_companhia = %s
                    AND data_fim IS NULL;''' , (id_perfil,))
    
    funcionarios = cursor.fetchall()
    if(len(funcionarios) > 0):
        print(f'\n\n{Fore.YELLOW}Funcionários{Style.RESET_ALL}')
        for funcionario in funcionarios:
            id_funcionario, nome_funcionario, localizacao, foto_perfil, titulo, data_inicio, descricao = funcionario
            print(f'{Fore.CYAN}{nome_funcionario}{Style.RESET_ALL} ({id_funcionario})\n\t{Fore.BLUE}{titulo}{Style.RESET_ALL} em {Fore.CYAN}{localizacao}{Style.RESET_ALL} desde {data_inicio}\n\t{Fore.LIGHTBLACK_EX}{descricao}{Style.RESET_ALL}')