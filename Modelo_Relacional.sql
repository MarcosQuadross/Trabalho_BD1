-- Aluno: Marcos Vinicius de Quadros

-- GitHub : https://github.com/MarcosdQuadros/Trabalho_BD1 

DROP TABLE IF EXISTS ASSISTE_LUTA;
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

CREATE TABLE ENDERECO(
	numeracao INTEGER,
    rua	VARCHAR(30),
    bairro VARCHAR(30),
    cidade VARCHAR(30),
    PRIMARY KEY(numeracao)

);

CREATE TABLE PESSOA(
	cpf CHAR(14),
    rg CHAR(10),
    nome VARCHAR(30),
    num_endereco INTEGER,
    PRIMARY KEY(cpf),
    FOREIGN KEY(num_endereco) REFERENCES ENDERECO(numeracao)

);

CREATE TABLE ESPECTADOR(
	cpf CHAR(14),
    idade INTEGER,
    sexo ENUM('F','M'),
    telefone VARCHAR(12),
    PRIMARY KEY(cpf),
    FOREIGN KEY(cpf) REFERENCES PESSOA(cpf) ON DELETE CASCADE

);

CREATE TABLE ARBITRO(
	cpf CHAR(14),
    categoria enum('A','B','C'),
    lutas_arbitradas INTEGER,
    horas_trabalhadas INTEGER,
    PRIMARY KEY(cpf),
    FOREIGN KEY(cpf) REFERENCES PESSOA(cpf) ON DELETE CASCADE

);

CREATE TABLE TECNICO(
	cpf CHAR(14),
    cod_Tecn INTEGER,
    email VARCHAR(20),
    cref_uf VARCHAR(20),
    PRIMARY KEY(cpf),
    FOREIGN KEY(cpf) REFERENCES PESSOA(cpf) ON DELETE CASCADE

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
    FOREIGN KEY(num_quadra) REFERENCES QUADRA(numero),
    FOREIGN KEY(cpf_arbitro) REFERENCES ARBITRO(cpf)

);


CREATE TABLE ATLETA(
    	cpf CHAR(14),
    cod_atleta INTEGER,
    data_filiacao DATE,
    graduacao VARCHAR(30),
    cod_clube INTEGER,
    cpf_tecnico char(14),
    cod_categoria INTEGER,
    PRIMARY KEY(cpf),
    FOREIGN KEY(cod_clube) REFERENCES CLUBE(codigo),
    FOREIGN KEY(cod_categoria) REFERENCES CATEGORIA(cod_Categoria),
    FOREIGN KEY(cpf_tecnico) REFERENCES TECNICO(cpf),
    FOREIGN KEY(cpf) REFERENCES PESSOA(cpf) ON DELETE CASCADE
);

CREATE TABLE DISPUTA(
    	cpf_atleta CHAR(14),
    id_luta INTEGER,
    PRIMARY KEY(cpf_atleta, id_luta),
    FOREIGN KEY(cpf_atleta) REFERENCES ATLETA(cpf),
    FOREIGN KEY(id_luta) REFERENCES LUTA(id)
    
);

CREATE TABLE ASSISTE_LUTA(
	cpf_espectador CHAR(14),
    id_luta INTEGER,
    PRIMARY KEY(cpf_espectador, id_luta),
    FOREIGN KEY(cpf_espectador) REFERENCES ESPECTADOR(cpf),
    FOREIGN KEY(id_luta) REFERENCES LUTA(id)

);

