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
JOIN INSCRICAO_EVENTO ON (EVENTO.id_evento = INSCRICAO_EVENTO.id_evento)
WHERE INSCRICAO_EVENTO.id_perfil = 'john_doe'

-- 3. Todas as vagas às quais o perfil pessoal se candidatou, incluindo o título da vaga 
--      e a empresa responsável.
SELECT VAGA.nome, APLICACAO_VAGA.data_inscricao, APLICACAO_VAGA.estado,
        PERFIL.id_perfil as id_companhia, PERFIL.nome as nome_companhia
FROM PESSOAS 
NATURAL JOIN APLICACAO_VAGA 
JOIN VAGA ON (APLICACAO_VAGA.id_vaga = VAGA.id_vaga)
JOIN PERFIL ON (VAGA.id_perfil = PERFIL.id_perfil)
WHERE APLICACAO_VAGA.id_perfil = 'john_doe';

-- b. Perfil de empresa - Todas as vagas disponibilizadas por uma determinada empresa, incluindo seu nome, data de publicacao, localizacao e modalidade
SELECT VAGA.nome NomeVaga, COMPANHIAS.nome NomeEmpresa, VAGA.data_publicacao, VAGA.localizacao, VAGA.modalidade
FROM COMPANHIAS
JOIN VAGA on (COMPANHIAS.id_perfil = VAGA.id_perfil)
WHERE COMPANHIAS.nome = 'Green Solutions'
	
-- 4. Todos os funcionários vinculados a uma empresa, com nome e status do vínculo ativo.

 -- nao tenho certeza como fazer esse daqui (acho q n tem um vinculo entre funcionarios e empresas, tu quis dizer experiencias?)
	
-- 5. Todos os eventos organizados pela empresa, com a quantidade de inscritos em cada evento.
SELECT EVENTO.id_evento, COUNT(INSCRICAO_EVENTO.id_perfil) as NUM_INSCRITOS
FROM EVENTO
JOIN INSCRICAO_EVENTO ON (EVENTO.id_evento = INSCRICAO_EVENTO.id_evento)
JOIN PERFIL ON (PERFIL.id_perfil = EVENTO.id_perfil)
WHERE PERFIL.id_perfil = 'edu_future' -- argumento
GROUP BY EVENTO.id_evento;


-- 6. Os nomes dos inscritos em um evento específico organizado por uma empresa.
SELECT nome
FROM PESSOAS pess
WHERE id_perfil IN (SELECT DISTINCT id_perfil
		    FROM INSCRICAO_EVENTO
		    WHERE id_evento = 'green_solutions_sustainability_day')


-- 7. As vagas publicadas pela empresas e seus respectivos candaidatos
SELECT APLICACAO_VAGA.*, VAGA.nome as nome_vaga, PERFIL.nome as nome_candidato
FROM VAGA
LEFT JOIN APLICACAO_VAGA ON (VAGA.id_vaga = APLICACAO_VAGA.id_vaga)
JOIN PERFIL ON (APLICACAO_VAGA.id_perfil = PERFIL.id_perfil)
WHERE VAGA.id_perfil = 'edu_future'

-- 8. Todas as postagens realizadas por um perfil de empresa, com a quantidade de curtidas e comentários recebidos.


	
-- 9. Todos os perfis que o perfil da empresa segue, com informações básicas de cada perfil.
SELECT *
FROM SEGUIMENTO
NATURAL JOIN PERFIL
WHERE id_perfil_seguido = 'edu_future';

-- 10. Todos os seguidores de um perfil de empresa, com nome e e-mail dos seguidores.
SELECT PERFIL.id_perfil, PERFIL.nome, PERFIL.email
FROM SEGUIMENTO
JOIN PERFIL ON (SEGUIMENTO.id_perfil = PERFIL.id_perfil)
WHERE SEGUIMENTO.id_perfil_seguido = 'build_smart';

-- 11. Os comentários feitos em uma publicação específica da empresa, com a quantidade 
--		de curtidas recebidas por cada comentário.
SELECT PUBLICACAO.id_perfil, data_publicacao, texto, COUNT(CURTIDA.data_curtida) AS curtidas
FROM COMENTARIO
JOIN PUBLICACAO ON COMENTARIO.id_comentario = PUBLICACAO.id_publicacao -- para obter o conteúdo
LEFT JOIN CURTIDA ON COMENTARIO.id_comentario = CURTIDA.id_publicacao -- para obter as curtidas
WHERE COMENTARIO.comentado_em = 1
GROUP BY PUBLICACAO.id_perfil, PUBLICACAO.data_publicacao, PUBLICACAO.texto;

-- 12. Perfis que não aplicaram a nenhuma das vagas na qual o perfil 'Carla Mendes' aplicou
SELECT nome
FROM PESSOAS pess
WHERE NOT EXISTS (SELECT id_perfil
		FROM APLICACAO_VAGA
		WHERE id_perfil = 'carla_mendes' AND
			id_vaga IN 
			(SELECT DISTINCT id_vaga
			FROM APLICACAO_VAGA
			WHERE id_perfil = pess.id_perfil))

---- OUTROS

-- Vagas com poucas candidaturas (< 4)
SELECT VAGA.id_vaga, VAGA.nome, COUNT(*) AS NUM_CANDIDATURAS
FROM VAGA LEFT JOIN APLICACAO_VAGA ON (VAGA.id_vaga = APLICACAO_VAGA.id_vaga)
GROUP BY VAGA.id_vaga
HAVING COUNT(*) < 4;


-- Número de funcionários das empresas
SELECT id_perfil_companhia, COUNT(id_perfil_pessoal) as NUM_FUNC
FROM PERFIL 
JOIN EXPERIENCIA ON (EXPERIENCIA.id_perfil_pessoal = PERFIL.id_perfil)
WHERE data_fim IS NULL
GROUP BY id_perfil_companhia;

-- Seguidores mutos entre dois perfis
SELECT id_perfil_seguido AS perfil_seguido_mutuo
FROM SEGUIMENTO
WHERE id_perfil = 'john_doe' -- john_doe segue
AND SEGUIMENTO.id_perfil_seguido 
	IN (SELECT id_perfil_seguido
		FROM SEGUIMENTO
		WHERE id_perfil = 'jane_smith'); -- jane_smith segue também
