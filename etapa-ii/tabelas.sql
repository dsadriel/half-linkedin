-- Criação das tabelas do banco de dados

-- ENTIDADE AUXILIAR --
CREATE TABLE TIPO_MODALIDADE (
    modalidade VARCHAR(100) PRIMARY KEY
);

-- ENTIDADES PRINCIPAIS --
CREATE TABLE PERFIL (
    id_perfil VARCHAR(50) PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    descricao_longa VARCHAR(3000),
    localizacao VARCHAR(100) NOT NULL,
    foto_perfil VARCHAR(255) CHECK (foto_perfil LIKE 'https://%.jpg'),
    foto_capa VARCHAR(255) CHECK (foto_capa LIKE 'https://%.jpg'),
    email VARCHAR(100) UNIQUE
);

CREATE TABLE PERFIL_COMPANHIA (
    id_perfil VARCHAR(50) PRIMARY KEY,
    FOREIGN KEY (id_perfil) REFERENCES PERFIL(id_perfil) ON UPDATE CASCADE
);

CREATE TABLE PERFIL_PESSOAL (
    id_perfil VARCHAR(50) PRIMARY KEY,
    descricao_curta VARCHAR(100),
    FOREIGN KEY (id_perfil) REFERENCES PERFIL(id_perfil) ON UPDATE CASCADE
);

CREATE TABLE PUBLICACAO (
    id_publicacao INT PRIMARY KEY,
    id_perfil VARCHAR(50) NOT NULL,
    data_publicacao DATE NOT NULL,
    texto VARCHAR(3000) NOT NULL,
    FOREIGN KEY (id_perfil) REFERENCES PERFIL(id_perfil) ON UPDATE CASCADE
);

CREATE TABLE PUBLICACAO_FEED (
    id_publicacao INT PRIMARY KEY,
    FOREIGN KEY (id_publicacao) REFERENCES PUBLICACAO(id_publicacao)
);

CREATE TABLE COMENTARIO (
    id_comentario INT PRIMARY KEY,
    comentado_em INT NOT NULL,
    FOREIGN KEY (comentado_em) REFERENCES PUBLICACAO(id_publicacao),
    FOREIGN KEY (id_comentario) REFERENCES PUBLICACAO(id_publicacao)
);

CREATE TABLE VAGA (
    id_vaga INT PRIMARY KEY,
    id_perfil VARCHAR(50) NOT NULL,
    data_publicacao DATE NOT NULL,
    nome VARCHAR(255) NOT NULL,
    descricao VARCHAR(3000),
    localizacao VARCHAR(255),
    modalidade VARCHAR(100),
    FOREIGN KEY (modalidade) REFERENCES TIPO_MODALIDADE(modalidade),
    FOREIGN KEY (id_perfil) REFERENCES PERFIL_COMPANHIA(id_perfil) ON UPDATE CASCADE
);

CREATE TABLE EVENTO (
    id_evento VARCHAR(50) PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    data_evento DATE NOT NULL,
    foto_capa VARCHAR(255) CHECK (foto_capa LIKE 'https://%.jpg'),
    descricao VARCHAR(3000),
    localizacao VARCHAR(255),
    id_perfil VARCHAR(50) NOT NULL,
    modalidade VARCHAR(100),
    FOREIGN KEY (modalidade) REFERENCES TIPO_MODALIDADE(modalidade),
    FOREIGN KEY (id_perfil) REFERENCES PERFIL_COMPANHIA(id_perfil) ON UPDATE CASCADE
);

-- ENTIDADES AUXILIARES --

CREATE TABLE LISTA_IDIOMA (
    nome VARCHAR(50),
    proficiencia VARCHAR(50),
    PRIMARY KEY (nome, proficiencia)
);

CREATE TABLE LISTA_SETOR (
    id_setor INT PRIMARY KEY,
    nome_setor VARCHAR(100)
);

CREATE TABLE TIPO_EMPREGO (
    nome VARCHAR(10) PRIMARY KEY CHECK (nome IN ('Remoto', 'Presencial', 'Híbrido'))
);

-- ATRIBUTOS MULTI-VALORADOS --

CREATE TABLE COMPETENCIA (
    id_competencia INT NOT NULL,
    id_vaga INT NOT NULL,
    competencia VARCHAR(100) NOT NULL,
    PRIMARY KEY (id_competencia, id_vaga),
    FOREIGN KEY (id_vaga) REFERENCES VAGA(id_vaga)
);

CREATE TABLE FOTOS_PUBLICACAO (
    id_foto_feed INT PRIMARY KEY,
    id_publicacao INT NOT NULL,
    foto_publi VARCHAR(255) CHECK (foto_publi LIKE 'https://%.jpg'),
    FOREIGN KEY (id_publicacao) REFERENCES PUBLICACAO_FEED(id_publicacao)
);

CREATE TABLE LINKS (
    id_links INT,
    id_evento VARCHAR(50) NOT NULL,
    link VARCHAR(255) CHECK (link LIKE 'https://%'),
    PRIMARY KEY (id_links, id_evento),
    FOREIGN KEY (id_evento) REFERENCES EVENTO(id_evento)
);

-- RELACIONAMENTOS --

CREATE TABLE INSCRICAO_EVENTO (
    id_perfil VARCHAR(50),
    id_evento VARCHAR(50),
    PRIMARY KEY (id_perfil, id_evento),
    FOREIGN KEY (id_perfil) REFERENCES PERFIL_PESSOAL(id_perfil) ON UPDATE CASCADE,
    FOREIGN KEY (id_evento) REFERENCES EVENTO(id_evento)
);

CREATE TABLE CURTIDA (
    id_perfil VARCHAR(50),
    id_publicacao INT,
    data_curtida DATE NOT NULL,
    PRIMARY KEY (id_perfil, id_publicacao),
    FOREIGN KEY (id_perfil) REFERENCES PERFIL(id_perfil) ON UPDATE CASCADE,
    FOREIGN KEY (id_publicacao) REFERENCES PUBLICACAO(id_publicacao)
);

CREATE TABLE APLICACAO_VAGA (
    id_perfil VARCHAR(50) NOT NULL,
    id_vaga INT,
    estado VARCHAR(30) NOT NULL,
    data_inscricao DATE NOT NULL,
    PRIMARY KEY (id_perfil, id_vaga),
    FOREIGN KEY (id_perfil) REFERENCES PERFIL_PESSOAL(id_perfil) ON UPDATE CASCADE,
    FOREIGN KEY (id_vaga) REFERENCES VAGA(id_vaga)
);

CREATE TABLE EXPERIENCIA (
    id_perfil_pessoal VARCHAR(50),
    id_perfil_companhia VARCHAR(50),
    titulo VARCHAR(255) NOT NULL,
    data_inicio DATE NOT NULL,
    data_fim DATE,
    descricao VARCHAR(3000),
    PRIMARY KEY (id_perfil_pessoal, data_inicio, titulo),
    FOREIGN KEY (id_perfil_pessoal) REFERENCES PERFIL_PESSOAL(id_perfil) ON UPDATE CASCADE,
    FOREIGN KEY (id_perfil_companhia) REFERENCES PERFIL_COMPANHIA(id_perfil) ON UPDATE CASCADE
);

CREATE TABLE POSSUI_IDIOMA (
    id_perfil VARCHAR(50),
    nome VARCHAR(50),
    proficiencia VARCHAR(50) NOT NULL,
    PRIMARY KEY (id_perfil, nome, proficiencia),
    FOREIGN KEY (id_perfil) REFERENCES PERFIL_PESSOAL(id_perfil) ON UPDATE CASCADE, 
    FOREIGN KEY (nome, proficiencia) REFERENCES LISTA_IDIOMA(nome, proficiencia)
);

CREATE TABLE SEGUIMENTO (
    id_perfil VARCHAR(50),
    id_perfil_seguido VARCHAR(50),
    data_seguimento DATE NOT NULL,
    PRIMARY KEY (id_perfil, id_perfil_seguido),
    FOREIGN KEY (id_perfil) REFERENCES PERFIL(id_perfil) ON UPDATE CASCADE,
    FOREIGN KEY (id_perfil_seguido) REFERENCES PERFIL(id_perfil)
);

CREATE TABLE SETOR_COMPANHIA (
    id_setor INT,
    id_perfil VARCHAR(50),
    PRIMARY KEY (id_setor, id_perfil),
    FOREIGN KEY (id_setor) REFERENCES LISTA_SETOR(id_setor),
    FOREIGN KEY (id_perfil) REFERENCES PERFIL_COMPANHIA(id_perfil) ON UPDATE CASCADE
);