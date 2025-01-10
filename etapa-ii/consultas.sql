-- Cria as visualizações (views)

-- Visualização dos perfis de empresa, com todas as informações de perfil e de empresa.
CREATE VIEW COMPANHIAS
AS SELECT * FROM PERFIL NATURAL JOIN PERFIL_COMPANHIA;

-- Visualização dos perfis pessoais, com todas as informações de perfil e de pessoa.
CREATE VIEW PESSOAS
AS SELECT * FROM PERFIL NATURAL JOIN PERFIL_PESSOAL;

------------------------------------------------------------------------------------------

-- Consultas

-- 1. As experiências de um perfil pessoal, nome da companhia, título, data de início, data de fim e descrição.
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

-- 3. Todas as vagas às quais o perfil pessoal se candidatou, com nome da vaga, 
--		data de inscrição, estado da aplicação, nome da companhia e id da companhia.
SELECT VAGA.nome, APLICACAO_VAGA.data_inscricao, APLICACAO_VAGA.estado,
        PERFIL.id_perfil as id_companhia, PERFIL.nome as nome_companhia
FROM PESSOAS 
JOIN APLICACAO_VAGA ON (PESSOAS.id_perfil = APLICACAO_VAGA.id_perfil)
JOIN VAGA USING (id_vaga)
JOIN PERFIL ON (VAGA.id_perfil = PERFIL.id_perfil)
WHERE APLICACAO_VAGA.id_perfil = 'john_doe';

-- 4. Todas as vagas disponibilizadas por uma determinada empresa, 
--		incluindo seu nome, data de publicacao, localizacao e modalidade
SELECT VAGA.nome nome_vaga, COMPANHIAS.nome nome_empresa, 
		VAGA.data_publicacao, VAGA.localizacao, VAGA.modalidade
FROM COMPANHIAS
JOIN VAGA on (COMPANHIAS.id_perfil = VAGA.id_perfil)
WHERE COMPANHIAS.nome = 'Green Solutions';
	
-- 5. Todos os funcionários atuais de uma empresa, i.e., com experiências em andamento,
--		 com nome, localização, foto de perfil, título, data de início e descrição.
SELECT id_perfil, nome, localizacao, foto_perfil, titulo, data_inicio, descricao
FROM PERFIL 
JOIN EXPERIENCIA ON (EXPERIENCIA.id_perfil_pessoal = PERFIL.id_perfil)
WHERE id_perfil_companhia = 'edu_future' -- argumento
		AND data_fim IS NULL;

-- 6. O identificador e o número de inscritos de todos os eventos de uma empresa.
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

-- 9. Todas as postagens realizadas por um perfil de empresa, 
--		com texto, quantidade total de curtidas e quantidade total de comentários.
SELECT PUBLICACAO.id_publicacao, PUBLICACAO.texto, 
		COUNT(CURTIDA.id_perfil), COUNT(COMENTARIO.id_comentario)
FROM PUBLICACAO
LEFT JOIN CURTIDA USING (id_publicacao) 
-- para obter a contagem de curtidas
LEFT JOIN COMENTARIO ON PUBLICACAO.id_publicacao = COMENTARIO.comentado_em 
-- para obter a contagem de comentários
WHERE PUBLICACAO.id_publicacao IN (SELECT id_publicacao FROM PUBLICACAO_FEED)
-- somente publicações de feed
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

-- 12. Os comentários feitos em uma publicação específica da empresa, 
--		com texto, data de publicação, quantidade de curtidas de cada comentário.
SELECT PUBLICACAO.id_perfil, data_publicacao, texto, COUNT(CURTIDA.data_curtida) AS curtidas
FROM COMENTARIO
JOIN PUBLICACAO ON COMENTARIO.id_comentario = PUBLICACAO.id_publicacao -- para obter o conteúdo
LEFT JOIN CURTIDA ON COMENTARIO.id_comentario = CURTIDA.id_publicacao -- para obter as curtidas
WHERE COMENTARIO.comentado_em = 1 -- argumento
GROUP BY PUBLICACAO.id_perfil, PUBLICACAO.data_publicacao, PUBLICACAO.texto;

-- 13. Perfis que não aplicaram a nenhuma vaga que outro perfil aplicou
SELECT PESSOAS.id_perfil, PESSOAS.nome
FROM PESSOAS
WHERE NOT EXISTS (SELECT id_perfil
		FROM APLICACAO_VAGA
		WHERE id_perfil = 'carla_mendes' AND
			id_vaga IN 
			(SELECT DISTINCT id_vaga
			FROM APLICACAO_VAGA
			WHERE id_perfil = PESSOAS.id_perfil));

-- 14. Vagas com poucas candidaturas (< 4), com id, nome e número de candidaturas.
SELECT VAGA.id_vaga, VAGA.nome, COUNT(*) AS NUM_CANDIDATURAS
FROM VAGA LEFT JOIN APLICACAO_VAGA ON (VAGA.id_vaga = APLICACAO_VAGA.id_vaga)
GROUP BY VAGA.id_vaga
HAVING COUNT(*) < 4;

-- 15. Número de funcionários das empresas, com id do perfil da empresa e número de funcionários.
SELECT id_perfil_companhia, COUNT(id_perfil_pessoal) as NUM_FUNC
FROM PERFIL 
JOIN EXPERIENCIA ON (EXPERIENCIA.id_perfil_pessoal = PERFIL.id_perfil)
WHERE data_fim IS NULL
GROUP BY id_perfil_companhia;

-- 16. Seguidores mutuos entre dois perfis, com id dos perfis.
SELECT id_perfil_seguido AS perfil_seguido_mutuo
FROM SEGUIMENTO
WHERE id_perfil = 'john_doe' -- john_doe segue
AND SEGUIMENTO.id_perfil_seguido 
	IN (SELECT id_perfil_seguido
		FROM SEGUIMENTO
		WHERE id_perfil = 'jane_smith'); -- jane_smith segue também