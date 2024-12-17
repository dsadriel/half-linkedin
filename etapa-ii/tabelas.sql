-- Criação das tabelas do banco de dados

-- ENTIDADES PRINCIPAIS --
CREATE TABLE PERFIL (
-- @carlos

);

CREATE TABLE PERFIL_PESSOAL (
    id INT PRIMARY KEY,
    descricao_curta VARCHAR(100),
    FOREIGN KEY (id) REFERENCES PERFIL(id)
);

CREATE TABLE PERFIL_COMPANHIA (
-- @carlos
);


CREATE TABLE PUBLICACAO (
    id_publicacao INT PRIMARY KEY,
    data_publicacao DATE NOT NULL,
    texto VARCHAR(3000) NOT NULL
);

CREATE TABLE PUBLICACAO_FEED (
-- @carlos
);


CREATE TABLE COMENTARIO (
    id_comentario INT PRIMARY KEY,
    FOREIGN KEY (id_comentario) REFERENCES PUBLICACAO(id_publicacao)
);


CREATE TABLE EVENTO (
    id_evento VARCHAR(50) PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    data_evento DATE NOT NULL,
    foto_capa VARCHAR(255) CHECK (foto_capa LIKE 'https://%.jpg'),
    descricao VARCHAR(3000),
    localizacao VARCHAR(255)
);


CREATE TABLE VAGA (
    id_vaga VARCHAR(50) PRIMARY KEY,
    data_publicacao DATE NOT NULL,
    nome VARCHAR(255) NOT NULL,
    descricao VARCHAR(3000),
    localizacao VARCHAR(255),
    modalidade VARCHAR(100),
    FOREIGN KEY (modalidade) REFERENCES TIPO_MODALIDADE(modalidade)
);

-- ENTIDADES AUXILIARES --

CREATE TABLE LISTA_IDIOMA (
    nome VARCHAR(50),
    proficiencia VARCHAR(50),
    PRIMARY KEY (nome, proficiencia)
);

CREATE TABLE LISTA_SETOR (
    id_setor VARCHAR(50) PRIMARY KEY,
    nome_setor VARCHAR(100)
);


CREATE TABLE TIPO_MODALIDADE (
    modalidade VARCHAR(100) PRIMARY KEY
);


CREATE TABLE TIPO_EMPREGO (
    nome VARCHAR(10) PRIMARY KEY CHECK (nome IN ('remoto', 'presencial', 'híbrido'))
);

-- ATRIBUTOS MULTI-VALORADOS --
CREATE TABLE COMPETENCIA (
-- @carlos
);


-- RELACIONAMENTOS --
CREATE TABLE CURTIDA (
    id_perfil VARCHAR(50),
    id_publicacao INT,
    data_curtida DATE NOT NULL,
    PRIMARY KEY (id_perfil, id_publicacao),
    FOREIGN KEY (id_perfil) REFERENCES PERFIL(id),
    FOREIGN KEY (id_publicacao) REFERENCES PUBLICACAO(id_publicacao)
);

CREATE TABLE SETOR_COMPANHIA (
-- @carlos
);


CREATE TABLE APLICACAO_EM_VAGA (
-- @carlos
);

CREATE TABLE INSCRICAO_EM_EVENTO (
    id_perfil VARCHAR(50),
    id_evento VARCHAR(50),
    PRIMARY KEY (id_perfil, id_evento),
    FOREIGN KEY (id_perfil) REFERENCES PERFIL(id),
    FOREIGN KEY (id_evento) REFERENCES EVENTO(id_evento)
);

CREATE TABLE POSSUI_IDIOMA (
-- @carlos
);

CREATE TABLE EXPERIENCIA (
    id_perfil VARCHAR(50),
    id_companhia VARCHAR(50),
    titulo VARCHAR(255) NOT NULL,
    data_inicio DATE NOT NULL,
    data_fim DATE,
    descricao VARCHAR(3000),
    PRIMARY KEY (id_perfil, data_inicio, titulo),
    FOREIGN KEY (id_perfil) REFERENCES PERFIL_PESSOAL(id),
    FOREIGN KEY (id_companhia) REFERENCES PERFIL_COMPANHIA(id)
);

CREATE TABLE SEGUIMENTO (
-- @carlos
);