import psycopg2
from colorama import init as colorama_init, Fore, Style
from datetime import datetime

colorama_init(autoreset=True)  # Inicializa o Colorama para cores no terminal

# Cria um perfil pessoal no banco de dados
def criar_perfil_pessoal(cursor: 'psycopg2.cursor') -> None:
    id_perfil = input('Digite o id do perfil: ')
    nome = input('Digite o nome: ')
    descricao_longa = input('Digite a descrição longa: ')
    localizacao = input('Digite a localização: ')
    foto_perfil = input('Digite a URL da foto de perfil: ')
    foto_capa = input('Digite a URL da foto de capa: ')
    email = input('Digite o email: ')
    descricao_curta = input('Digite a descrição curta: ')
    
    cursor.execute('''
        INSERT INTO PESSOAS (id_perfil, nome, descricao_longa, localizacao, foto_perfil, foto_capa, email, descricao_curta)
        VALUES (%s, %s, %s, %s, %s, %s, %s, %s)
    ''', (id_perfil, nome, descricao_longa, localizacao, foto_perfil, foto_capa, email, descricao_curta))
    
    print(Fore.GREEN + 'Perfil pessoal criado com sucesso!')

# Cria uma publicação no feed de publicações no banco de dados
def criar_publicacao_feed(cursor: 'psycopg2.cursor') -> None:
    id_publicacao = input('Digite o id da publicação: ')
    id_perfil = input('Digite o id do perfil: ')
    texto = input('Digite o texto: ')

    cursor.execute('''
        INSERT INTO PUBLICACAO (id_publicacao, id_perfil, data_publicacao, texto)
        VALUES (%s, %s, %s, %s);
    ''', (id_publicacao, id_perfil, datetime.now(), texto))

    cursor.execute('''
        INSERT INTO PUBLICACAO_FEED (id_publicacao)
        VALUES (%s);
    ''', (id_publicacao,))
    
    print(Fore.GREEN + 'Publicação criada com sucesso!')

# Exclui uma publicação do feed de publicações
def excluir_publicacao_feed(cursor: 'psycopg2.cursor') -> None:
    id_publicacao = input('Digite o id da publicação: ')
    
    cursor.execute('''
        DELETE FROM PUBLICACAO_FEED
        WHERE id_publicacao = %s;
    ''', (id_publicacao,))
    
    # Apaga a publicação em PUBLICACAO após PUBLICACAO_FEED
    cursor.execute('''
        DELETE FROM PUBLICACAO
        WHERE id_publicacao = %s;
    ''', (id_publicacao,))
    
    if cursor.rowcount == 0:  # Verifica se alguma linha foi afetada
        print(Fore.RED + 'Publicação não encontrada!')
    else:
        print(Fore.GREEN + 'Publicação excluída com sucesso!')