import psycopg2

def obterComentarios(id, depth = 2):
    if(depth < 1):
        return None

    sql = f"""
    SELECT PUBLICACAO.id_perfil, data_publicacao, texto, COUNT(CURTIDA.data_curtida) AS curtidas
    FROM COMENTARIO
    JOIN PUBLICACAO ON COMENTARIO.id_comentario = PUBLICACAO.id_publicacao -- para obter o conteúdo
    LEFT JOIN CURTIDA ON COMENTARIO.id_comentario = CURTIDA.id_publicacao -- para obter as curtidas
    WHERE COMENTARIO.comentado_em = {id}
    GROUP BY PUBLICACAO.id_perfil, PUBLICACAO.data_publicacao, PUBLICACAO.texto;"""
    
    comentarios = []
    
    for c in comentarios:
        c.respostas = obterComentarios(c.id, depth-1)
        
    return comentarios
 


def imprmirPublicacao(id):
   
   comentarios = obterComentarios(id);
   
   for c in comentarios:
      print(f'{c.id_perfil}: ')