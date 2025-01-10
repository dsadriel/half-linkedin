import psycopg2
import questionary

import consultas as cons
import inserscoes as ins

if __name__ == '__main__':
    # Conecta ao banco de dados
    conn = psycopg2.connect(
        host='localhost',
        database='halflinkedin',
        user='postgres',
        password='postgres'
    )
    cursor = conn.cursor()  # Cria um cursor para executar comandos SQL
    
    print('Conexão com o banco de dados estabelecida! \n')
        
    while True:
        print('\n' + '-=' * 40 + '\n')
        # Menu principal
        opcao = questionary.select(
            'O que deseja fazer?',
            choices=[
                'Listar perfis',
                'Ver o feed de publicações',
                'Ver um perfil pessoal',
                'Ver um perfil de companhia',
                'Criar um perfil pessoal',
                'Criar uma publicação no feed',
                'Excluir uma publicação do feed',
                'Sair'
            ]
        ).ask()
        
        if opcao == 'Ver o feed de publicações':
            cons.ver_feed(cursor)
        elif opcao == 'Listar perfis':
            cursor.execute('SELECT id_perfil, nome FROM PERFIL;')
            for perfil in cursor.fetchall():
                print(f'{perfil[0]} - {perfil[1]}')
        elif opcao == 'Ver um perfil pessoal':
            id_perfil = input('Digite o id do perfil: ')
            cons.ver_perfil_pessoal(cursor, id_perfil)
        elif opcao == 'Ver um perfil de companhia':
            id_perfil = input('Digite o id do perfil: ')
            cons.ver_perfil_companhia(cursor, id_perfil)
        elif opcao == 'Criar um perfil pessoal':
            ins.criar_perfil_pessoal(cursor)
            conn.commit()  # Salva as alterações
        elif opcao == 'Criar uma publicação no feed':
            ins.criar_publicacao_feed(cursor)
            conn.commit()
        elif opcao == 'Excluir uma publicação do feed':
            ins.excluir_publicacao_feed(cursor)
            conn.commit()
        elif opcao == 'Sair':
            print('Até mais!')
            break
            
    cursor.close()
    conn.close()  # Encerra a conexão com o banco de dados
    print('Conexão com o banco de dados encerrada')