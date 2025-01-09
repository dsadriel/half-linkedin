import psycopg2
from colorama import init as colorama_init, Fore, Style, Back

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
        print(f'{'\t'*offset}> {Fore.GREEN}{id_perfil}{Style.RESET_ALL} em {Fore.BLUE}{data_publicacao}{Style.RESET_ALL}: {Fore.LIGHTBLACK_EX}{texto} {Style.RESET_ALL}({curtidas} curtidas)')  
    
    return [registro_comentario[0] for registro_comentario in registros]

def imprimir_comentarios_rec(cursor: 'psycopg2.cursor', id_publicacao: int, offset: int = 1) -> None:
    comentarios = imprimir_comentarios_de(cursor, id_publicacao, offset)
    for id_comentario in comentarios:
        imprimir_comentarios_rec(cursor, id_comentario, offset+1)
    

def imprimir_feed_inicial(cursor: 'psycopg2.cursor', quantiade: int = 5, aleatorio:bool=False) -> None:
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
                        ORDER BY RANDOM() DESC
                        LIMIT %s;
                    ''', (quantiade,))
    for registro in cursor.fetchall():
        
        
        nome_perfil, data, id_publicacao, texto, curtidas, comentarios = registro
        # Imprime a publicação
        print(f'\n\n{Fore.GREEN}{nome_perfil}{Style.RESET_ALL} em {Fore.BLUE}{data}{Style.RESET_ALL}')
        print(f'{texto}')
        print(f'{Fore.YELLOW}{curtidas} curtidas{Style.RESET_ALL} e {Fore.YELLOW}{comentarios} comentários{Style.RESET_ALL}')
        
        # Imprime os comentários da publicação incluindo os comentários dos comentários
        imprimir_comentarios_rec(cursor, id_publicacao)
        
def imprimir_perfil(cursor: 'psycopg2.cursor', id_perfil: str) -> None:
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
    
    print(f'{Fore.GREEN}{nome}\n{Fore.YELLOW}{localizacao}\n{Style.RESET_ALL}{descricao_curta}\n\n\t{Fore.LIGHTBLACK_EX}{descricao_longa}\n{Style.RESET_ALL}')
    
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
            print(f'{Fore.BLUE}{titulo}{Style.RESET_ALL} em {Fore.GREEN}{nome_empresa} {Style.RESET_ALL}({data_inicio} - {data_fim if data_fim is not None else "Atual"})\n\t{Fore.LIGHTBLACK_EX}{descricao}')
    
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
            print(f'{Fore.BLUE}{nome_evento}{Style.RESET_ALL} em {Fore.GREEN}{localizacao}{Style.RESET_ALL} ({data_evento})')
            
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
            print(f'{Fore.BLUE}{nome_vaga}{Style.RESET_ALL} em {Fore.GREEN}{nome_companhia}{Style.RESET_ALL} ({estado}) ({data_inscricao})')
            
    # Colocar seguidores e seguidos