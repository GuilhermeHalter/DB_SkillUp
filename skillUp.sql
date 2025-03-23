CREATE DATABASE SkillUp;
USE SkillUp;

CREATE TABLE Usuarios (
    id_usuario INT PRIMARY KEY AUTO_INCREMENT,
    usu_nome VARCHAR(255) NOT NULL,
    usu_email VARCHAR(255) UNIQUE NOT NULL,
    usu_senha VARCHAR(255) NOT NULL,
    usu_foto VARCHAR(255)
);

CREATE TABLE Videos (
    id_video INT PRIMARY KEY AUTO_INCREMENT,
    vid_titulo VARCHAR(255) NOT NULL,
    vid_sinopse TEXT,
    vid_nota DECIMAL(3,2),
    vid_bloqueado BOOLEAN DEFAULT FALSE,
    vid_miniatura VARCHAR(255),
    vid_dataIni DATETIME,
    vid_dataFim DATETIME
);

CREATE TABLE Temas (
    id_tema INT PRIMARY KEY AUTO_INCREMENT,
    cat_nome VARCHAR(255) NOT NULL
);

CREATE TABLE Historico (
    id_historico INT PRIMARY KEY AUTO_INCREMENT,
    his_dataHora DATETIME NOT NULL,
    his_concluido BOOLEAN DEFAULT FALSE,
    his_posicao INT,
    id_usuario INT,
    id_video INT,
    FOREIGN KEY (id_usuario) REFERENCES Usuarios(id_usuario),
    FOREIGN KEY (id_video) REFERENCES Videos(id_video)
);

CREATE TABLE Avaliacao (
    id_avaliacao INT PRIMARY KEY AUTO_INCREMENT,
    ava_dataHora DATETIME NOT NULL,
    ava_nota DECIMAL(3,2) NOT NULL,
    id_historico INT,
    id_usuario INT,
    id_video INT,
    FOREIGN KEY (id_historico) REFERENCES Historico(id_historico),
    FOREIGN KEY (id_usuario) REFERENCES Usuarios(id_usuario),
    FOREIGN KEY (id_video) REFERENCES Videos(id_video)
);

CREATE TABLE Preferencias (
    id_usuario INT,
    id_tema INT,
    PRIMARY KEY (id_usuario, id_tema),
    FOREIGN KEY (id_usuario) REFERENCES Usuarios(id_usuario),
    FOREIGN KEY (id_tema) REFERENCES Temas(id_tema)
);

CREATE TABLE Categorizacao (
    id_tema INT,
    id_video INT,
    PRIMARY KEY (id_tema, id_video),
    FOREIGN KEY (id_tema) REFERENCES Temas(id_tema),
    FOREIGN KEY (id_video) REFERENCES Videos(id_video)
);

CREATE TABLE Cursos (
    id_curso INT PRIMARY KEY AUTO_INCREMENT,
    cur_titulo VARCHAR(255) NOT NULL,
    cur_descricao TEXT,
    cur_nota DECIMAL(3,2),
    cur_categoria VARCHAR(255)
);

CREATE TABLE Curso_Video (
    id_curso INT,
    id_video INT,
    ordem INT NOT NULL,
    PRIMARY KEY (id_curso, id_video),
    FOREIGN KEY (id_curso) REFERENCES Cursos(id_curso),
    FOREIGN KEY (id_video) REFERENCES Videos(id_video)
);

CREATE TABLE Progresso (
    id_progresso INT PRIMARY KEY AUTO_INCREMENT,
    pro_percentual DECIMAL(5,2) NOT NULL,
    id_usuario INT,
    id_curso INT,
    FOREIGN KEY (id_usuario) REFERENCES Usuarios(id_usuario),
    FOREIGN KEY (id_curso) REFERENCES Cursos(id_curso)
);

CREATE TABLE Comentario (
    id_comentario INT PRIMARY KEY AUTO_INCREMENT,
    com_texto TEXT NOT NULL,
    com_dataHora DATETIME NOT NULL,
    id_usuario INT,
    id_video INT,
    FOREIGN KEY (id_usuario) REFERENCES Usuarios(id_usuario),
    FOREIGN KEY (id_video) REFERENCES Videos(id_video)
);
