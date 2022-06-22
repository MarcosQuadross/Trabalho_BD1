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
DROP TABLE IF EXISTS ENDERECO;
DROP TABLE IF EXISTS PESSOA;



create table PESSOA(
	cpf CHAR(14),
    rg CHAR(12),
    nome VARCHAR(50),
    PRIMARY KEY(cpf)
);


create table ENDERECO(
	numeracao INTEGER,
    rua	VARCHAR(100),
    bairro VARCHAR(100),
    cidade VARCHAR(100),
    cpf_pessoa CHAR(14),
    PRIMARY KEY(numeracao, cpf_pessoa),
    foreign key(cpf_pessoa) references PESSOA(cpf)

);

create table ESPECTADOR(
	cpf CHAR(14),
	idade INTEGER,
    sexo ENUM('F','M'),
    celular VARCHAR(12),
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
    email VARCHAR(100),
    cref_uf VARCHAR(20),
    primary key(cpf),
    foreign key(cpf) references PESSOA(cpf) on delete cascade

);
CREATE TABLE CLUBE(
	codigo INTEGER auto_increment,
    cidade VARCHAR(20),
	qtde_atletas INTEGER,
    telefone VARCHAR(12),
    PRIMARY KEY(codigo)
);

CREATE TABLE CATEGORIA(
	cod_Categoria INTEGER AUTO_INCREMENT,
	idade_max VARCHAR(20),
	peso DECIMAL(5,3) ,
    sexo ENUM('F','M'),
    PRIMARY KEY(cod_Categoria)

); 

CREATE TABLE QUADRA(
	numero INTEGER,
    cat_disputada VARCHAR(30),
    responsavel VARCHAR(30),
    PRIMARY KEY(numero)

);

CREATE TABLE LUTA(
	id INTEGER auto_increment,
    duracao VARCHAR(10),
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

CREATE TABLE ASSISTE_LUTA(
	cpf_espectador CHAR(14),
    id_luta INTEGER,
    PRIMARY KEY(cpf_espectador, id_luta),
    FOREIGN KEY(cpf_espectador) REFERENCES ESPECTADOR(cpf),
    FOREIGN KEY(id_luta) REFERENCES LUTA(id)

);

INSERT INTO PESSOA(cpf, rg, nome) VALUES('676.532.177-29','50.916.210-1','Paulo Lima'),('820.661.011-17','18.419.214-6','Lucas Fernandes'), ('251.926.090-46','18.778.256-8','Diego Martins'),('224.090.453-40','11.078.555-1','Guilherme Goncalves'), ('176.317.203-12','29.865.923-2','Ryan Almeida'),('278.195.757-78','32.284.178-1','Brenda Santos'), ('906.349.225-13','14.970.765-4','Amanda Martins'),('787.518.749-46','41.714.221-3','Vitória Sara Ferreira'),('037.807.299-46','50.376.533-8','Erick Thales Leonardo Brito'),('389.595.319-95','12.797.471-4','Pedro Manuel das Neves'),('350.601.428-50','24.676.355-3','Leila Rocha'),('529.256.693-44','12.142.089-9','Tomás Melo'),('642.403.864-70','35.565.322-9','Daniel Almeida'), ('985.829.940-01','43.793.389-1','Renan Dias'),('905.387.122-52','24.465.778-6','Lara Ferreira'), ('486.999.452-64','10.061.155-2','Luan Silva'),('488.734.614-09','40.698.953-9','Brenda Alves'), ('286.338.307-87','44.269.821-5','Letícia Rodrigues'),('614.792.745-00','34.924.202-1','Luan Gomes'), ('125.860.398-58','17.197.709-9','Marina Dias'), ('105.023.129-55','36.327.829-1','Emily Mirella Sônia Pires'), ('236.052.809-27', '32.203.665-3','Pietra Tatiane Luzia Fernandes'),('350.711.779-78','36.182.316-2','Silvana Cláudia Corte Real'),('111.623.759-81','13.600.052-6','Eduardo André Rodrigues'),('231.216.519-86','39.640.903-9','Nicolas Luiz Souza' ), ('816.621.659-00','47.356.554-7','Julio Renan Pereira'),('867.814.139-53','13.718.892-4','Luan Daniel Almeida'), ('537.662.269-08','21.937.103-9','Stefany Milena Castro'),('986.256.580-24','10.811.480-6','Nicole Cunha'), ('584.358.977-37','44.465.979-1','Gabriela Dias'),('111.336.912-70','98.173.672-7', 'Maryann Theunissen'), ('864.051.926-80', '35.821.479-1', 'Ronna Hankey'), ('738.353.008-05','17.827.213-1', 'Tabby Polden'), ('269.562.471-37','99.795.081-7', 'Robyn Robus'),('965.364.806-75','18.250.590-3', 'Hulda Bernath'), ('541.741.304-18','20.882.293-7', 'Monti Edmondson'),('171.093.724-45','37.437.119-8', 'Kristin Cescot'), ('410.263.007-89','27.521.525-3', 'Franny Kays'),('702.116.541-69','82.897.294-6', 'Teodoro Etty'), ('928.817.573-31','28.413.306-9', 'Tommie Kayzer'),
('950.806.365-30','12.251.615-1','Gustavo Lima'), -- gustavoferreiralima@rhyta.com
('745.966.512-64','47.520.306-9','Fernanda Pinto'), -- fernandaalvespinto@einrot.com
('105.915.628-80','17.643.588-8','Manuela Carvalho'), -- manuelaalmeidacarvalho@rhyta.com
('274.561.839-37','31.059.962-3','Igor Martins'), -- igorazevedomartins@einrot.com
('588.974.610-34','43.126.009-6','Vinícius Melo'), -- viniciuscunhamelo@jourrapide.com
('813.506.303-22','37.207.328-1','Sofia Almeida'), -- sofiarodriguesalmeida@einrot.com
('577.777.399-05','39.558.561-2','Kauê Dias'), -- kauecostadias@jourrapide.com
('704.803.604-48','29.665.282-9','Carlos Martins'), -- carlosaraujomartins@superrito.com
('543.287.787-22','43.317.454-7','Melissa Santos'), -- melissapereirasantos@rhyta.com
('958.708.100-51','33.299.676-1','Yasmin Cavalcanti'), -- yasminsouzacavalcanti@armyspy.com

('366.404.624-27','45.283.283-4','Gabriela Alves'), -- gabrielasantosalves@rhyta.com
('548.624.310-38','28.624.019-1','Vitoria Rodrigues'), -- vitoriabarrosrodrigues@armyspy.com
('367.340.860-70','21.943.788-9','Raissa Almeida'), -- raissacardosoalmeida@superrito.com
('797.260.533-58','16.498.292-9','Alice Gomes'), -- alicecostagomes@dayrep.com
('726.107.663-51','20.011.468-2','Maria Rodrigues'), -- mariabarbosarodrigues@dayrep.com

('451.365.187-31','18.341.074-9','Leonardo Correia'), -- leonardocostacorreia@einrot.com
('916.516.571-30','34.709.942-7','José Alves'), -- josemeloalves@superrito.com
('855.026.889-50','28.776.564-7','Breno Ferreira'), -- brenogoncalvesferreira@superrito.com
('735.117.657-49','19.213.835-2','Estevan Melo'), -- estevansouzamelo@dayrep.com
('866.372.787-93','49.839.118-8','Antônio Azevedo') -- antoniocunhaazevedo@armyspy.com
;

INSERT INTO ENDERECO(numeracao, rua, bairro, cidade,cpf_pessoa) VALUES (520,'Rua Antônio Duarte Velloso','Bom Retiro','Curitiba','676.532.177-29'),(640,'Rua Polônia', 'Igapó', 'Londrina','820.661.011-17'),(286, 'Rua Adelino Alexandrino Marquezini','Atuba','Curitiba','251.926.090-46'), (701,'Rua Osmar Sossai','Zona 06','Maringá','224.090.453-40'),(586,'Rua Gaspar','Jardim Petropólis','Foz do Iguaçu','176.317.203-12'), (112,'Rua Quebec', 'Jardim Califórnia','Sarandi','906.349.225-13'), (74,'Rua Coronel Adherbal Fortes de Sá','Seminário','Curitiba','986.256.580-24'),(607,'Rua Pinheiro', 'Leonor', 'Londrina','584.358.977-37'),(585,'Rua Seringueira','Jardim Tropical','Foz do Iguaçu','350.601.428-50'),(155,'Rua Mãe do Catira','Uberaba','Curitiba','278.195.757-78'), (350,'Rua Jequetiba','Tanguá','Almirante Tamandaré','125.860.398-58'),(711,'Rua José Martins Mochi','Parque Industrial IV','Sarandi','614.792.745-00'), (771,'Rua Alcindo Alves de Lima','Jardim São Jorge','Paranavaí','286.338.307-87'),(581,'Rua Pedro Gurgacz','Interlagos','Cascavel','488.734.614-09'), (671,'Rua Picapauzinho Verde','Jardim Interlagos','Arapongas','486.999.452-64'),(590,'Rua Tomaz Gonzaga','Vila Pioneiro','Toledo','905.387.122-52'), (360,'Rua dos Girassóis','Jardim Busmayer','Campo Largo','985.829.940-01'), (681,'Travessa Ismael Silva','Núcleo Habitacional Castelo Branco','Apucarana','642.403.864-70'), (730,'Rua Cruzeiro do Oeste','Centro','Campo Mourão','529.256.693-44'),(322,'Avenida Portuária','Dom Pedro II','Paranaguá','787.518.749-46'), (618,'Rua Sílvio Dalmas','Novo Bandeirantes','Cambé','037.807.299-46'),(187,'Rua Tiradentes','Centro', 'Telêmaco Borba','105.023.129-55'),(188,'Rua Domingos Smaniotto','Jardim Gisela','Toledo','236.052.809-27'),(919,'Rua Caldas Júnior','Vila Pioneiro','Toledo','350.711.779-78'),(723,'Rua Santa Cristina','Carlota','Londrina','111.623.759-81'),(578,'Rua Cambucá','Cataratas','Cascavel','231.216.519-86'),(758,'Rua Joaquim Alves Fontes','Colônia Murici','São José dos Pinhais','816.621.659-00'),(656,'Rua Mangueira','Vila Esperança','Telêmaco Borba','867.814.139-53'),(664, 'Avenida Brasil','Centro','Santo Antônio do Sudoeste','537.662.269-08'),(368,'Rua Miguel Felício Raccanelli','Jardim Imperial I','Umuarama','389.595.319-95'),(629,'Rua Geraldo da Silva', 'Conjunto Habitacional Santiago II', 'Londrina','111.336.912-70'),(321,'Rua Waldomiro Batista de Araújo','Jardim das Palmeiras','Londrina','864.051.926-80'),(127,'Travessa Tucunaré','Jardim Nossa Senhora Aparecida','Campo Mourão','738.353.008-05'),(298,'Rua Pioneira Amélia Vieira da Silva César','Conjunto Habitacional Lea Leal','Maringá','269.562.471-37'),(306,'Rua Xingu','Zona IV','Umuarama','965.364.806-75'),(052,'Praça Henry Ford','Industrial','Londrina','541.741.304-18'),(72,'Rua Brigadeiro Franco','Rebouças','Curitiba','171.093.724-45'),(333,'Rua Tuiuiú','Jardim Olímpico','Maringá','702.116.541-69'),(240,'Travessa Palmas','Pacaembu','Cascavel','928.817.573-31');

INSERT INTO ESPECTADOR(cpf, idade, sexo, celular) Values ('105.023.129-55','36','F','42 979512837'), ('236.052.809-27', '23','F','45 980504108'),('350.711.779-78','40','F','45 982594829'),('111.623.759-81','13','M','43 981784312'),('231.216.519-86','20','M','45 982077548'),('816.621.659-00','47','M','41 980246732'),('867.814.139-53','13','M','42 983854366'), ('537.662.269-08','21','F','46 983773245'),('986.256.580-24','10','F','41 981414015'), ('584.358.977-37','44','F','980458523');

INSERT INTO ARBITRO(cpf,categoria,lutas_arbitradas,horas_trabalhadas) VALUES('676.532.177-29','A',20, 4), ('820.661.011-17','B',15,3),('251.926.090-46','B', 12, 3), ('224.090.453-40','C',13,3),('176.317.203-12','C', 9, 2), ('278.195.757-78','C', 10, 2), ('906.349.225-13','B', 15, 3), ('787.518.749-46','C', 8, 1),('037.807.299-46','A',25, 4), ('389.595.319-95','A',22, 4);

INSERT INTO TECNICO(cpf,cod_Tecn,email,cref_uf) VALUES('350.601.428-50',20568,'leilamelorocha@superrito.com','878732-G/PR'), ('529.256.693-44',20846,'tomaslimamelo@jourrapide.com', '824674-G/PR'), ('642.403.864-70',22260,'danielpintoalmeida@superrito.com','433175-G/PR'),('985.829.940-01',22577,'renancastrodias@superrito.com','426155-G/PR'), ('905.387.122-52',25589,'larasantosferreira@einrot.com','304897-G/PR'),('486.999.452-64',25725,'luansantossilva@jourrapide.com','249569-G/PR'), ('488.734.614-09',25976,'brendaaraujoalves@rhyta.com','192256-G/PR'),('286.338.307-87',26383,'leticiasantosrodrigues@jourrapide.com','189588-G/PR'), ('614.792.745-00',26772,'luansilvagomes@armyspy.com','073816-G/PR'),('125.860.398-58',27970,'marinamelodias@gustr.com', '038653-G/PR');

INSERT INTO CLUBE (cidade, qtde_atletas, telefone) VALUES ('Curitiba',40 ,'41 3433-3259'), ('Paranaguá', 18, '41 2478-8876'), ('Londrina', 20, '43 3252-3403'), ('Maringá', 36, '44 3313-7054'), ('Foz do Iguaçu', 15, '45 3889-3614'), ('Almirante Tamandaré', 10, '41 3697-5067'),('Cascavel', 13, '45 3024-2133'), ('Campo Largo', 25, '41 2707-1521'), ('Apucarana', 8, '43 3542-9393'), ('Campo Mourão', 23, '44 2031-7138');

INSERT INTO CATEGORIA (idade_max, peso, sexo) VALUES ('11 anos',35.00, 'F'), ('11 anos',40.00, 'F'), ('11 anos', 45.00, 'F'), ('11 anos', 50.00, 'F'),('11 anos', 35.00, 'M'), ('11 anos', 40.00, 'M'), ('11 anos', 45.00, 'M'), ('11 anos', 50.00, 'M'),('13 anos', 35.00, 'F'), ('13 anos', 40.00, 'F'), ('13 anos', 42.00, 'F'), ('13 anos', 47.00, 'F'), ('13 anos', 47.00, 'F'),('13 anos', 40.00, 'M'), ('13 anos', 45.00, 'M'), ('13 anos', 50.00, 'M'), ('13 anos', 55.00, 'M'), ('13 anos', 55.00, 'M'),('15 anos', 42.00, 'F'), ('15 anos', 47.00, 'F'), ('15 anos', 51.00, 'F'), ('15 anos', 54.00, 'F'), ('15 anos', 54.00, 'F'),('15 anos', 52.00, 'M'), ('15 anos', 57.00, 'M'), ('15 anos', 63.00, 'M'), ('15 anos', 70.00, 'M'), ('15 anos', 70.00, 'M'),('17 anos', 48.00, 'F'), ('17 anos', 53.00, 'F'), ('17 anos', 59.00, 'F'), ('17 anos', 59.00, 'F'),('17 anos', 55.00, 'M'), ('17 anos', 61.00, 'M'), ('17 anos', 68.00, 'M'), ('17 anos', 76.00, 'M'), ('17 anos', 76.00, 'M'),('20 anos', 50.00, 'F'), ('20 anos', 55.00, 'F'), ('20 anos', 61.00, 'F'), ('20 anos', 68.00, 'F'), ('20 anos', 68.00, 'F'),('20 anos', 60.00, 'M'), ('20 anos', 67.00, 'M'), ('20 anos', 75.00, 'M'), ('20 anos', 84.00, 'M'), ('20 anos', 84.00, 'M'),('18 anos e acima', 50.00, 'F'), ('18 anos e acima', 55.00, 'F'), ('18 anos e acima', 61.00, 'F'), ('18 anos e acima', 68.00, 'F'), ('18 anos e acima', 68.00, 'F'),('18 anos e acima', 60.00, 'M'), ('18 anos e acima', 67.00, 'M'), ('18 anos e acima', 75.00, 'M'), ('18 anos e acima', 84.00, 'M'),('18 anos e acima', 84.00, 'M');

INSERT INTO QUADRA (numero, cat_disputada, responsavel) VALUES (1, 1, 'Paulo Lima'), (2, 2, 'Diego Martins'),(3, 4, 'Lucas Fernandes'), (4, 5, 'Guilherme Goncalves'),(5, 6, 'Ryan Almeida'), (6, 7, 'Brenda Santos'),(7, 8, 'Amanda Martins'), (8, 9,'Vitória Sara Ferreira'),(9, 10, 'Erick Thales Leonardo Brito'), (10, 25, 'Pedro Manuel das Neves');

INSERT INTO LUTA (duracao, resultado, num_quadra, cpf_arbitro) VALUES ('1:30','1x0',1,'676.532.177-29'),('2:00','3x2',2,'251.926.090-46'),('1:15','0x8',3,'820.661.011-17'),('3:00','2x5',4,'224.090.453-40'),('2:00','0x2',5,'176.317.203-12'),('1:30','0x0',6,'278.195.757-78'),('2:17','9x1',7,'906.349.225-13'),('2:00','3x1',8,'787.518.749-46'),('3:00','1x2',9,'037.807.299-46'),('2:43','10x2',10,'389.595.319-95');
 
INSERT INTO ATLETA (cpf, cod_atleta, data_filiacao, graduacao, cod_clube, cpf_tecnico, cod_categoria) VALUES('111.336.912-70',191830,'2008-10-03','2 kyu',3,'350.601.428-50' ,41),('864.051.926-80',113961,'2010-05-21','6 kyu',3,'350.601.428-50' ,52),('738.353.008-05',618693,'2012-07-11','3 kyu',10,'529.256.693-44' ,47),('269.562.471-37',796108,'2011-01-20','6 kyu',4,'642.403.864-70',28),('965.364.806-75',788905,'2006-08-02','4 kyu',10,'529.256.693-44' ,31),('541.741.304-18',978060,'2015-11-14','5 kyu',3,'350.601.428-50' ,57),('171.093.724-45',310020,'2016-04-02','6 kyu',1,'985.829.940-01',38),('410.263.007-89',234675,'2014-06-10','2 kyu',9,'905.387.122-52',45),('702.116.541-69',615973,'2012-02-25','7 kyu',4,'642.403.864-70',37),('928.817.573-31',856471,'2010-06-17','4 kyu',7,'486.999.452-64',54);

INSERT INTO DISPUTA(cpf_atleta, id_luta)  VALUES('111.336.912-70',1),('864.051.926-80', 3),('738.353.008-05', 7),('269.562.471-37', 4),('965.364.806-75', 9),('541.741.304-18', 2),('171.093.724-45', 5),('410.263.007-89', 10),('702.116.541-69', 8),('928.817.573-31', 6);

INSERT INTO ASSISTE_LUTA (cpf_espectador, id_luta) VALUES ('105.023.129-55', 1), ('236.052.809-27',8),('350.711.779-78',6),('111.623.759-81',2),('231.216.519-86',1),('816.621.659-00',7),('867.814.139-53',4), ('537.662.269-08',3),('986.256.580-24',9), ('584.358.977-37',3);

select distinct(nome) from PESSOA;