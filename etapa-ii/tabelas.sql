-- Criação das tabelas do banco de dados

-- ENTIDADES PRINCIPAIS --
CREATE TABLE PERFIL (
    id PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    descricao_longa VARCHAR(3000),
    localizacao VARCHAR(100) NOT NULL,
    foto_perfil VARCHAR(255) CHECK (foto_perfil LIKE 'https://%.jpg'),
    foto_capa VARCHAR(255) CHECK (foto_capa LIKE 'https://%.jpg'),
    email VARCHAR(100) UNIQUE
);

CREATE TABLE PERFIL_PESSOAL (
    id INT PRIMARY KEY,
    descricao_curta VARCHAR(100),
    FOREIGN KEY (id) REFERENCES PERFIL(id)
);

CREATE TABLE PERFIL_COMPANHIA (
    id INT PRIMARY KEY,
    botar link aqui
    FOREIGN KEY (id) REFERENCES PERFIL(id)
);


CREATE TABLE PUBLICACAO (
    id_publicacao INT PRIMARY KEY,
    data_publicacao DATE NOT NULL,
    texto VARCHAR(3000) NOT NULL
);

CREATE TABLE PUBLICACAO_FEED (
    id_publi_feed INT PRIMARY KEY,
    id_publi_feed INT REFERENCES PUBLICACAO(id_publicacao)
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
    id_competencia VARCHAR(50) PRIMARY KEY,
    competencia VARCHAR(100) NOT NULL,
    FOREIGN KEY (id_competencia) REFERENCES VAGA
);

CREATE TABLE FOTOS_PUBLICACAO (
    id_foto_feed INT PRIMARY KEY,
    foto_publi VARCHAR(255) CHECK (foto_publi LIKE 'https://%.jpg'),
    FOREIGN KEY (id_foto_feed) REFERENCES PUBLICACAO_FEED
);

CREATE TABLE LINKS (
    id_links INT PRIMARY KEY,
    links VARCHAR(255) CHECK (links LIKE 'https://%.com.br'),
    FOREIGN KEY (id_links) REFERENCES EVENTO
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
    id_setor VARCHAR (50),
    id_perfil INT,
    PRIMARY KEY (id_setor, id_perfil_companhia),
    FOREIGN KEY (id_setor) REFERENCES LISTA_SETOR(id_setor),
    FOREIGN KEY (id_perfil) REFERENCES PERFIL_COMPANHIA(id),
);


CREATE TABLE APLICACAO_EM_VAGA (
    id_perfil INT ,
    id_vaga VARCHAR (50),
    estado VARCHAR (30) NOT NULL,
    data_inscricao DATE NOT NULL,
    PRIMARY KEY (id_perfil, id_vaga),
    FOREIGN KEY (id_perfil) REFERENCES PERFIL_PESSOAL(id),
    FOREIGN KEY (id_vaga) REFERENCES VAGA(id_vaga),
);

CREATE TABLE INSCRICAO_EM_EVENTO (
    id_perfil VARCHAR(50),
    id_evento VARCHAR(50),
    PRIMARY KEY (id_perfil, id_evento),
    FOREIGN KEY (id_perfil) REFERENCES PERFIL_PESSOAL(id),
    FOREIGN KEY (id_evento) REFERENCES EVENTO(id_evento)
);

CREATE TABLE POSSUI_IDIOMA (
    id_perfil INT,
    nome VARCHAR(50),
    proficiencia VARCHAR(50) NOT NULL,
    PRIMARY KEY (id_perfil, nome, proficiencia),
    FOREIGN KEY (id_perfil) REFERENCES PERFIL_PESSOAL(id),
    FOREIGN KEY (nome, proficiencia) REFERENCES LISTA_IDIOMA(nome, proficiencia)
);

CREATE TABLE EXPERIENCIA (
    id_perfil INT,
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
    id_perfil INT,
    id_perfil_pessoal INT,
    data_seguimento DATE NOT NULL,
    PRIMARY KEY (id_perfil, id_perfil_pessoal),
    FOREIGN KEY (id_perfil) REFERENCES PERFIL(id),
    FOREIGN KEY (id_perfil_pessoal) REFERENCES PERFIL_PESSOAL(id)
);
