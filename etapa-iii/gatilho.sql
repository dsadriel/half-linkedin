-- Criação da função que insere um perfil pessoal na base de dados
CREATE OR REPLACE FUNCTION inserir_perfil_pessoal()
RETURNS TRIGGER AS $$
BEGIN
    -- Inserção na tabela PERFIL
    INSERT INTO PERFIL (id_perfil, nome, descricao_longa, localizacao, foto_perfil, foto_capa, email)
    VALUES (NEW.id_perfil, NEW.nome, NEW.descricao_longa, NEW.localizacao, NEW.foto_perfil, NEW.foto_capa, NEW.email);

    -- Inserção na tabela PERFIL_PESSOAL
    INSERT INTO PERFIL_PESSOAL (id_perfil, descricao_curta)
    VALUES (NEW.id_perfil, NEW.descricao_curta);

    RETURN NEW; 
END;
$$ LANGUAGE plpgsql;

-- Criação da função que insere um perfil de companhia na base de dados
CREATE OR REPLACE FUNCTION inserir_perfil_compahnia()
RETURNS TRIGGER AS $$
BEGIN
    -- Inserção na tabela PERFIL
    INSERT INTO PERFIL (id_perfil, nome, descricao_longa,
                     localizacao, foto_perfil, foto_capa, email)
    VALUES (NEW.id_perfil, NEW.nome, NEW.descricao_longa, NEW.localizacao, 
                    NEW.foto_perfil, NEW.foto_capa, NEW.email);


    -- Inserção na tabela PERFIL_COMPANHIA
    INSERT INTO PERFIL_COMPANHIA (id_perfil, link)
    VALUES (NEW.id_perfil, NEW.link);

    RETURN NEW; 
END;
$$ LANGUAGE plpgsql;


-- Inserção do gatilho que insere um perfil pessoal na base de dados quando 
--- uma nova pessoa é cadastrada na visão PESSOAS
CREATE TRIGGER instead_of_insert_perfil_pessoal
INSTEAD OF INSERT 
ON PESSOAS
FOR EACH ROW
EXECUTE FUNCTION inserir_perfil_pessoal();

-- Inserção do gatilho que insere um perfil de companhia na base de dados quando 
--- uma nova companhia é cadastrada na visão COMPANHIAS
CREATE TRIGGER instead_of_insert_perfil_compahnia7
INSTEAD OF INSERT
ON COMPANHIAS
FOR EACH ROW
EXECUTE FUNCTION inserir_perfil_compahnia();

------------------------------------------------------------

-- Adiciona uma nova coluna na tabela APLICACAO_VAGA para armazenar 
--- a data de atualização da aplicação
ALTER TABLE APLICACAO_VAGA
ADD COLUMN data_atualizacao DATE;


-- Criação da função que atualiza a data de atualização da aplicação de vaga quando 
-- o estado é alterado e impede a alteração da data de inscrição
CREATE OR REPLACE FUNCTION atualizar_aplicacao_vaga()
RETURNS TRIGGER AS $$
BEGIN
    
    IF OLD.data_inscricao <> NEW.data_inscricao THEN
        RAISE EXCEPTION 'A data de aplicação não pode ser alterada';
    END IF;

    IF OLD.estado <> NEW.estado THEN
        NEW.data_atualizacao = CURRENT_DATE;
    END IF;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Inserção do gatilho que atualiza a data de atualização da aplicação de vaga 
-- quando a mesma é alterada
CREATE TRIGGER atualizar_aplicacao_vaga
BEFORE UPDATE
ON APLICACAO_VAGA
FOR EACH ROW
EXECUTE FUNCTION atualizar_aplicacao_vaga();

--- Criação da função que impede que um usuário siga a si mesmo
CREATE OR REPLACE FUNCTION impedir_autoseguimento()
RETURNS TRIGGER AS $$
BEGIN
    IF NEW.id_seguidor = NEW.id_seguido THEN
        RAISE EXCEPTION 'Não é possível seguir a si mesmo';
    END IF;

    RETURN NEW;
END;

$$ LANGUAGE plpgsql;

-- Inserção do gatilho que impede que um usuário siga a si mesmo
CREATE TRIGGER impedir_autoseguimento
BEFORE INSERT
ON SEGUIMENTO
FOR EACH ROW
EXECUTE FUNCTION impedir_autoseguimento();