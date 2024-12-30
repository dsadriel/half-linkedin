-- Consultas

-- a. Perfil pessoal

-- 1. As experiências de um perfil pessoal, incluindo o nome da empresa e a foto de perfil da empresa.
SELECT COMPANHIAS.nome, COMPANHIAS.foto_perfil, titulo, data_inicio, data_fim, descricao
FROM EXPERIENCIA JOIN COMPANHIAS ON (id_perfil_companhia = COMPANHIAS.id_perfil) JOIN PESSOAS ON (id_perfil_pessoal = PESSOAS.id_perfil_pessoal)

-- 2. Todos os eventos em que o perfil pessoal está cadastrado, com nome, data e localização.

-- 3. Todas as vagas às quais o perfil pessoal se candidatou, incluindo o título da vaga e a empresa responsável.

-- b. Perfil de empresa

-- 4. Todos os funcionários vinculados a uma empresa, com nome e status do vínculo ativo.

-- 5. Todos os eventos organizados pela empresa, com a quantidade de inscritos em cada evento.

-- 6. Os nomes dos inscritos em um evento específico organizado por uma empresa.

-- 7. Os candidatos de uma vaga publicada pela empresa, com possibilidade de filtrar por estado ou outras condições específicas.

-- 8. Todas as postagens realizadas por um perfil de empresa, com a quantidade de curtidas e comentários recebidos.

-- 9. Todos os perfis que o perfil da empresa segue, com informações básicas de cada perfil seguido.

-- 10. Todos os seguidores de um perfil de empresa, com nome e e-mail dos seguidores.

-- 11. Os comentários feitos em uma publicação específica da empresa, com a quantidade de curtidas recebidas por cada comentário.