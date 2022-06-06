-- Aluno: Marcos Vinicius de Quadros

-- GitHub : https://github.com/MarcosdQuadros/Trabalho_BD1 

DROP TABLE IF EXISTS DISPUTA;
DROP TABLE IF EXISTS ATLETA;
DROP TABLE IF EXISTS LUTA;
DROP TABLE IF EXISTS QUADRA;
DROP TABLE IF EXISTS CATEGORIA;
DROP TABLE IF EXISTS CLUBE;
DROP TABLE IF EXISTS TECNICO;
DROP TABLE IF EXISTS ARBITRO;
DROP TABLE IF EXISTS ESPECTADOR;
DROP TABLE IF EXISTS PESSOA;
DROP TABLE IF EXISTS ENDERECO;

create table ENDERECO(
	numeracao INTEGER,
    rua	VARCHAR(30),
    bairro VARCHAR(30),
    cidade VARCHAR(30),
    cpf CHAR(14),
    PRIMARY KEY(numeracao)
    -- FOREIGN KEY (cpf) REFERENCES PESSOA(cpf) ON DELETE CASCADE,
--     UNIQUE(cpf)
);

create table PESSOA(
	cpf CHAR(14),
    rg CHAR(10),
    nome VARCHAR(30),
    num_endereco INTEGER,
    PRIMARY KEY(cpf),
    foreign key(num_endereco) references ENDERECO(numeracao)

);

create table ESPECTADOR(
	cpf CHAR(14),
	idade INTEGER,
    sexo ENUM('F','M'),
    telefone VARCHAR(12),
    primary key(cpf),
    foreign key(cpf) references PESSOA(cpf) on delete cascade

);

CREATE TABLE ARBITRO(
	cpf CHAR(14),
	categoria enum('A','B','C'),
    lutas_arbitradas INTEGER,
    horas_trabalhadas INTEGER,
    primary key(cpf),
    foreign key(cpf) references PESSOA(cpf) on delete cascade

);

CREATE TABLE TECNICO(
	cpf CHAR(14),
	cod_Tecn INTEGER,
    email VARCHAR(20),
    cref_uf VARCHAR(20),
    primary key(cpf),
    foreign key(cpf) references PESSOA(cpf) on delete cascade

);
CREATE TABLE CLUBE(
	codigo INTEGER,
    cidade VARCHAR(20),
	qtde_atletas INTEGER,
    telefone VARCHAR(12),
    PRIMARY KEY(codigo)
);

CREATE TABLE CATEGORIA(
	cod_Categoria INTEGER,
	idade_max DATE,
	peso DECIMAL(3,2),
    sexo ENUM('F','M'),
    PRIMARY KEY(cod_Categoria)

); 
CREATE TABLE QUADRA(
	numero INTEGER,
    cat_disputada VARCHAR(30),
    responsável VARCHAR(30),
    PRIMARY KEY(numero)

);

CREATE TABLE LUTA(
	id INTEGER,
    duracao TIME,
    resultado VARCHAR(10),
    num_quadra INTEGER,
    cpf_arbitro CHAR(14),
    PRIMARY KEY(id),
	foreign key(num_quadra) references QUADRA(numero),
    foreign key(cpf_arbitro) references ARBITRO(cpf)

);


CREATE TABLE ATLETA(
    cpf CHAR(14),
	cod_atleta INTEGER,
    data_filiacao DATE,
    graduacao VARCHAR(30),
    cod_clube INTEGER,
    cpf_tecnico char(14),
    cod_categoria INTEGER,
    primary key(cpf),
    foreign key(cod_clube) references CLUBE(codigo),
	foreign key(cod_categoria) references CATEGORIA(cod_Categoria),
    foreign key(cpf_tecnico) references TECNICO(cpf),
    foreign key(cpf) references PESSOA(cpf) on delete cascade
);

CREATE TABLE DISPUTA(
    cpf_atleta CHAR(14),
    id_luta INTEGER,
    PRIMARY KEY(cpf_atleta, id_luta),
    FOREIGN KEY(cpf_atleta) REFERENCES ATLETA(cpf),
    FOREIGN KEY(id_luta) REFERENCES LUTA(id)
    
);


