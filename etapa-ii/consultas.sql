-- Cria as visualizações (views)

CREATE VIEW COMPANHIAS
AS SELECT * FROM PERFIL NATURAL JOIN PERFIL_COMPANHIA;

CREATE VIEW PESSOAS
AS SELECT * FROM PERFIL NATURAL JOIN PERFIL_PESSOAL;

------------------------------------------------------------------------------------------

-- Consultas

-- 1. As experiências de um perfil pessoal, incluindo o nome da empresa e
--      e a foto de perfil da empresa.
SELECT COMPANHIAS.nome, COMPANHIAS.foto_perfil, titulo, data_inicio, data_fim, descricao
FROM EXPERIENCIA 
JOIN COMPANHIAS ON (id_perfil_companhia = COMPANHIAS.id_perfil) 
JOIN PERFIL ON (id_perfil_pessoal = PERFIL.id_perfil)
WHERE PERFIL.id_perfil = 'john_doe';

-- 2. Todos os eventos em que o perfil pessoal está cadastrado, com nome, data 
--      e localização.
SELECT EVENTO.nome, EVENTO.data_evento, EVENTO.localizacao
FROM EVENTO
JOIN INSCRICAO_EVENTO USING (id_evento)
WHERE INSCRICAO_EVENTO.id_perfil = 'john_doe';

-- 3. Todas as vagas às quais o perfil pessoal se candidatou, incluindo o título da vaga 
--      e a empresa responsável.
SELECT VAGA.nome, APLICACAO_VAGA.data_inscricao, APLICACAO_VAGA.estado,
        PERFIL.id_perfil as id_companhia, PERFIL.nome as nome_companhia
FROM PESSOAS 
NATURAL JOIN APLICACAO_VAGA 
JOIN VAGA USING (id_vaga)
JOIN PERFIL ON (VAGA.id_perfil = PERFIL.id_perfil)
WHERE APLICACAO_VAGA.id_perfil = 'john_doe';

-- 4. Todas as vagas disponibilizadas por uma determinada empresa, 
--		incluindo seu nome, data de publicacao, localizacao e modalidade
SELECT VAGA.nome NomeVaga, COMPANHIAS.nome NomeEmpresa, 
		VAGA.data_publicacao, VAGA.localizacao, VAGA.modalidade
FROM COMPANHIAS
JOIN VAGA on (COMPANHIAS.id_perfil = VAGA.id_perfil)
WHERE COMPANHIAS.nome = 'Green Solutions';
	
-- 5. Todos os funcionários atuais de uma empresa, i.e., com experêincia em andamento,
--		com informações básicas de cada funcionário.
SELECT id_perfil, nome, localizacao, foto_perfil, titulo, data_inicio, descricao
FROM PERFIL 
JOIN EXPERIENCIA ON (EXPERIENCIA.id_perfil_pessoal = PERFIL.id_perfil)
WHERE id_perfil_companhia = 'edu_future' -- argumento
		AND data_fim IS NULL;

-- 6. Todos os eventos organizados pela empresa, com a quantidade de inscritos em cada evento.
SELECT EVENTO.id_evento, COUNT(INSCRICAO_EVENTO.id_perfil) as NUM_INSCRITOS
FROM EVENTO
JOIN INSCRICAO_EVENTO ON (EVENTO.id_evento = INSCRICAO_EVENTO.id_evento)
JOIN PERFIL ON (PERFIL.id_perfil = EVENTO.id_perfil)
WHERE PERFIL.id_perfil = 'edu_future' -- argumento
GROUP BY EVENTO.id_evento;

-- 7. Os nomes dos inscritos em um evento específico organizado por uma empresa.
SELECT nome
FROM PESSOAS pess
WHERE id_perfil IN (SELECT DISTINCT id_perfil
FROM INSCRICAO_EVENTO
WHERE id_evento = 'green_solutions_sustainability_day');


-- 8. As vagas publicadas pela empresas e seus respectivos candaidatos
SELECT APLICACAO_VAGA.*, VAGA.nome as nome_vaga, PERFIL.nome as nome_candidato
FROM VAGA
LEFT JOIN APLICACAO_VAGA ON (VAGA.id_vaga = APLICACAO_VAGA.id_vaga)
JOIN PERFIL ON (APLICACAO_VAGA.id_perfil = PERFIL.id_perfil)
WHERE VAGA.id_perfil = 'edu_future';

-- 9. Todas as postagens realizadas por um perfil de empresa, com a quantidade de curtidas e comentários recebidos.
SELECT PUBLICACAO.id_publicacao, PUBLICACAO.texto, 
		COUNT(CURTIDA.id_perfil), COUNT(COMENTARIO.id_comentario)
FROM PUBLICACAO
LEFT JOIN CURTIDA USING (id_publicacao) -- para obter a contagem de curtidas
LEFT JOIN COMENTARIO ON PUBLICACAO.id_publicacao = COMENTARIO.comentado_em -- para obter a contagem de comentários
WHERE PUBLICACAO.id_publicacao IN (SELECT id_publicacao FROM PUBLICACAO_FEED) -- somente publicações de feed
AND PUBLICACAO.id_perfil = 'edu_future' -- argumento
GROUP BY PUBLICACAO.id_publicacao, PUBLICACAO.texto;

	
-- 10. Todos os perfis que o perfil da empresa segue, com informações básicas de cada perfil.
SELECT *
FROM SEGUIMENTO
NATURAL JOIN PERFIL
WHERE id_perfil_seguido = 'edu_future';

-- 11. Todos os seguidores de um perfil de empresa, com nome e e-mail dos seguidores.
SELECT PERFIL.id_perfil, PERFIL.nome, PERFIL.email
FROM SEGUIMENTO
JOIN PERFIL ON (SEGUIMENTO.id_perfil = PERFIL.id_perfil)
WHERE SEGUIMENTO.id_perfil_seguido = 'build_smart';

-- 12. Os comentários feitos em uma publicação específica da empresa, com a quantidade 
--		de curtidas recebidas por cada comentário.
SELECT PUBLICACAO.id_perfil, data_publicacao, texto, COUNT(CURTIDA.data_curtida) AS curtidas
FROM COMENTARIO
JOIN PUBLICACAO ON COMENTARIO.id_comentario = PUBLICACAO.id_publicacao -- para obter o conteúdo
LEFT JOIN CURTIDA ON COMENTARIO.id_comentario = CURTIDA.id_publicacao -- para obter as curtidas
WHERE COMENTARIO.comentado_em = 1
GROUP BY PUBLICACAO.id_perfil, PUBLICACAO.data_publicacao, PUBLICACAO.texto;

-- 13. Perfis que não aplicaram a nenhuma das vagas na qual o perfil 'Carla Mendes' aplicou
SELECT nome
FROM PESSOAS pess
WHERE NOT EXISTS (SELECT id_perfil
		FROM APLICACAO_VAGA
		WHERE id_perfil = 'carla_mendes' AND
			id_vaga IN 
			(SELECT DISTINCT id_vaga
			FROM APLICACAO_VAGA
			WHERE id_perfil = pess.id_perfil));

-- 14. Vagas com poucas candidaturas (< 4)
SELECT VAGA.id_vaga, VAGA.nome, COUNT(*) AS NUM_CANDIDATURAS
FROM VAGA LEFT JOIN APLICACAO_VAGA ON (VAGA.id_vaga = APLICACAO_VAGA.id_vaga)
GROUP BY VAGA.id_vaga
HAVING COUNT(*) < 4;

-- 15. Número de funcionários das empresas
SELECT id_perfil_companhia, COUNT(id_perfil_pessoal) as NUM_FUNC
FROM PERFIL 
JOIN EXPERIENCIA ON (EXPERIENCIA.id_perfil_pessoal = PERFIL.id_perfil)
WHERE data_fim IS NULL
GROUP BY id_perfil_companhia;

-- 16. Seguidores mutuos entre dois perfis
SELECT id_perfil_seguido AS perfil_seguido_mutuo
FROM SEGUIMENTO
WHERE id_perfil = 'john_doe' -- john_doe segue
AND SEGUIMENTO.id_perfil_seguido 
	IN (SELECT id_perfil_seguido
		FROM SEGUIMENTO
		WHERE id_perfil = 'jane_smith'); -- jane_smith segue também

-- 19. Perfis que seguem um perfil específico, mas não são seguidos de volta.
SELECT id_perfil 
FROM SEGUIMENTO 
WHERE id_perfil_seguido = 'john_doe'
AND id_perfil NOT IN (
    SELECT id_perfil_seguido 
    FROM SEGUIMENTO 
    WHERE id_perfil = 'john_doe'
);