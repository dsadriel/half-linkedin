import psycopg2
from functions import *

colorama_init()

if __name__ == '__main__':
    
    # conecta ao banco de dados halflinkedin
    conn = psycopg2.connect(
        host='localhost',
        database='halflinkedin',
        user='postgres',
        password='postgres')
    
    # cria um cursor para manipular o banco de dados
    cursor = conn.cursor()
    
    imprimir_feed_inicial(cursor, 999)
    
    print('-'*80)
    
    # Imprime os dados de um perfil
    print('Insira o id do perfil para ver seus dados:')
    #id_perfil = input()
    imprimir_perfil(cursor, 'john_doe')
    
    cursor.close()
    conn.close()
    print('Conexão com o banco de dados encerrada')
     
     
     