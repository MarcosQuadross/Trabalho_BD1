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
    foreign key(cpf_pessoa) references PESSOA(cpf) on delete cascade,
    PRIMARY KEY(numeracao, cpf_pessoa)

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
	codigo INTEGER,
    cidade VARCHAR(80),
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
    id INTEGER auto_increment,
	numero INTEGER,
    cat_disputada VARCHAR(30),
    responsavel VARCHAR(30),
    PRIMARY KEY(id)

);

CREATE TABLE LUTA(
	id INTEGER auto_increment,
    duracao VARCHAR(10),
    resultado VARCHAR(10),
    id_quadra INTEGER,
    cpf_arbitro CHAR(14),
    PRIMARY KEY(id),
	foreign key(id_quadra) references QUADRA(id),
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

INSERT INTO PESSOA(cpf, rg, nome) VALUES ('875.727.234-46','50.916.210-1','Paulo Lima'),('820.661.011-17','18.419.214-6','Lucas Fernandes'), ('251.926.090-46','18.778.256-8','Diego Martins'), ('224.090.453-40','11.078.555-1','Guilherme Goncalves'), ('176.317.203-12','29.865.923-2','Ryan Almeida'), ('278.195.757-78','32.284.178-1','Brenda Santos'),  ('906.349.225-13','14.970.765-4','Amanda Martins'), ('787.518.749-46','41.714.221-3','Vitória Sara Ferreira'), ('037.807.299-46','50.376.533-8','Erick Thales Leonardo Brito'), ('389.595.319-95','12.797.471-4','Pedro Manuel das Neves'), ('350.601.428-50','24.676.355-3','Leila Rocha'), ('529.256.693-44','12.142.089-9','Tomás Melo'), ('642.403.864-70','35.565.322-9','Daniel Almeida'),  ('985.829.940-01','43.793.389-1','Renan Dias'), ('905.387.122-52','24.465.778-6','Lara Ferreira'),  ('486.999.452-64','10.061.155-2','Luan Silva'), ('488.734.614-09','40.698.953-9','Brenda Alves'), ('286.338.307-87','44.269.821-5','Letícia Rodrigues'), ('614.792.745-00','34.924.202-1','Luan Gomes'),  ('125.860.398-58','17.197.709-9','Marina Dias'),  ('105.023.129-55','36.327.829-1','Emily Mirella Sônia Pires'), ('236.052.809-27', '32.203.665-3','Pietra Tatiane Luzia Fernandes'), ('350.711.779-78','36.182.316-2','Silvana Cláudia Corte Real'), ('111.623.759-81','13.600.052-6','Eduardo André Rodrigues'), ('231.216.519-86','39.640.903-9','Nicolas Luiz Souza' ),  ('816.621.659-00','47.356.554-7','Julio Renan Pereira'), ('867.814.139-53','13.718.892-4','Luan Daniel Almeida'),  ('537.662.269-08','21.937.103-9','Stefany Milena Castro'), ('986.256.580-24','10.811.480-6','Nicole Cunha'),  ('584.358.977-37','44.465.979-1','Gabriela Dias'), ('111.336.912-70','98.173.672-7', 'Maryann Theunissen'), ('864.051.926-80', '35.821.479-1', 'Ronna Hankey'),  ('738.353.008-05','17.827.213-1', 'Tabby Polden'),  ('269.562.471-37','99.795.081-7', 'Robyn Robus'), ('965.364.806-75','18.250.590-3', 'Hulda Bernath'), ('541.741.304-18','20.882.293-7', 'Monti Edmondson'), ('171.093.724-45','37.437.119-8', 'Kristin Cescot'),  ('410.263.007-89','27.521.525-3', 'Franny Kays'), ('702.116.541-69','82.897.294-6', 'Teodoro Etty'),  ('928.817.573-31','28.413.306-9', 'Tommie Kayzer'),('950.806.365-30','12.251.615-1','Gustavo Lima'), ('745.966.512-64','47.520.306-9','Fernanda Pinto'), ('105.915.628-80','17.643.588-8','Manuela Carvalho'), ('274.561.839-37','31.059.962-3','Igor Martins'), ('588.974.610-34','43.126.009-6','Vinícius Melo'), ('813.506.303-22','37.207.328-1','Sofia Almeida'), ('577.777.399-05','39.558.561-2','Kauê Dias'), ('704.803.604-48','29.665.282-9','Carlos Martins'), ('543.287.787-22','43.317.454-7','Melissa Santos'),('958.708.100-51','33.299.676-1','Yasmin Cavalcanti'), ('366.404.624-27','45.283.283-4','Gabriela Alves'),('451.365.187-31','18.341.074-9','Leonardo Correia'), ('916.516.571-30','34.709.942-7','José Alves'), ('855.026.889-50','28.776.564-7','Breno Ferreira'), ('735.117.657-49','19.213.835-2','Estevan Melo'), ('866.372.787-93','49.839.118-8','Antônio Azevedo'), ('985.386.685-44','42.943.412-1','Thiago Ferreira'), ('899.842.144-51','43.159.397-8','Bruno Martins'), ('785.137.210-00','46.144.786-1','Rodrigo Dias'), ('699.335.447-05','17.518.518-9' ,'Vitór Cavalcanti'), ('800.707.965-30','50.108.002-8' ,'Murilo Lima'), ('459.074.580-11','35.351.390-8','Igor Carvalho'), ('476.949.084-40','29.153.225-1','Melissa Lima'), ('624.953.146-78','41.476.767-6','Luiza Goncalves'),('783.926.104-31','37.906.802-3','Amanda Santos'),('407.936.727-91','47.658.311-1','Emily Alves'), ('754.275.117-41','14.216.216-4','Livia Cunha') ;

INSERT INTO ENDERECO(numeracao, rua, bairro, cidade,cpf_pessoa) VALUES (640,'Rua Polônia', 'Igapó', 'Londrina','820.661.011-17'), (286, 'Rua Adelino Alexandrino Marquezini','Atuba','Curitiba','251.926.090-46'), (701,'Rua Osmar Sossai','Zona 06','Maringá','224.090.453-40'),(586,'Rua Gaspar','Jardim Petropólis','Foz do Iguaçu','176.317.203-12'), (112,'Rua Quebec', 'Jardim Califórnia','Sarandi','906.349.225-13'), (74,'Rua Coronel Adherbal Fortes de Sá','Seminário','Curitiba','614.792.745-00'),(607,'Rua Pinheiro', 'Leonor', 'Londrina','125.860.398-58'),(585,'Rua Seringueira','Jardim Tropical','Foz do Iguaçu','350.601.428-50'),(155,'Rua Mãe do Catira','Uberaba','Curitiba','278.195.757-78'), (350,'Rua Jequetiba','Tanguá','Almirante Tamandaré','584.358.977-37'),(711,'Rua José Martins Mochi','Parque Industrial IV','Sarandi','986.256.580-24'), (771,'Rua Alcindo Alves de Lima','Jardim São Jorge','Paranavaí','286.338.307-87'),(581,'Rua Pedro Gurgacz','Interlagos','Cascavel','488.734.614-09'), (671,'Rua Picapauzinho Verde','Jardim Interlagos','Arapongas','486.999.452-64'),(590,'Rua Tomaz Gonzaga','Vila Pioneiro','Toledo','905.387.122-52'), (360,'Rua dos Girassóis','Jardim Busmayer','Campo Largo','985.829.940-01'), (681,'Travessa Ismael Silva','Núcleo Habitacional Castelo Branco','Apucarana','642.403.864-70'), (730,'Rua Cruzeiro do Oeste','Centro','Campo Mourão','529.256.693-44'),(322,'Avenida Portuária','Dom Pedro II','Paranaguá','787.518.749-46'), (618,'Rua Sílvio Dalmas','Novo Bandeirantes','Cambé','037.807.299-46'),(187,'Rua Tiradentes','Centro', 'Telêmaco Borba','105.023.129-55'),(188,'Rua Domingos Smaniotto','Jardim Gisela','Toledo','236.052.809-27'),(919,'Rua Caldas Júnior','Vila Pioneiro','Toledo','350.711.779-78'),(723,'Rua Santa Cristina','Carlota','Londrina','111.623.759-81'),(578,'Rua Cambucá','Cataratas','Cascavel','231.216.519-86'),(758,'Rua Joaquim Alves Fontes','Colônia Murici','São José dos Pinhais','816.621.659-00'),(656,'Rua Mangueira','Vila Esperança','Telêmaco Borba','867.814.139-53'),(664, 'Avenida Brasil','Centro','Santo Antônio do Sudoeste','537.662.269-08'),(368,'Rua Miguel Felício Raccanelli','Jardim Imperial I','Umuarama','389.595.319-95'),(629,'Rua Geraldo da Silva', 'Conjunto Habitacional Santiago II', 'Londrina','111.336.912-70'),(321,'Rua Waldomiro Batista de Araújo','Jardim das Palmeiras','Londrina','864.051.926-80'),(127,'Travessa Tucunaré','Jardim Nossa Senhora Aparecida','Campo Mourão','738.353.008-05'),(298,'Rua Pioneira Amélia Vieira da Silva César','Conjunto Habitacional Lea Leal','Maringá','269.562.471-37'),(306,'Rua Xingu','Zona IV','Umuarama','965.364.806-75'),(052,'Praça Henry Ford','Industrial','Londrina','541.741.304-18'),(72,'Rua Brigadeiro Franco','Rebouças','Curitiba','171.093.724-45'),(333,'Rua Tuiuiú','Jardim Olímpico','Maringá','702.116.541-69'),(240,'Travessa Palmas','Pacaembu','Cascavel','928.817.573-31');

INSERT INTO ESPECTADOR(cpf, idade, sexo, celular) Values ('105.023.129-55','36','F','42 979512837'), ('236.052.809-27', '23','F','45 980504108'),('350.711.779-78','40','F','45 982594829'),('111.623.759-81','13','M','43 981784312'),('231.216.519-86','20','M','45 982077548'),('816.621.659-00','47','M','41 980246732'),('867.814.139-53','13','M','42 983854366'), ('537.662.269-08','21','F','46 983773245'),('986.256.580-24','10','F','41 981414015'), ('584.358.977-37','44','F','980458523'),('745.966.512-64','47','F','43 981599307'), ('105.915.628-80','17','F','43 989064118'), ('274.561.839-37','31','M','45 969190311'), ('588.974.610-34','43','M','44 997029665'),('813.506.303-22','20','F','42 967642694'), ('577.777.399-05','15','M','45 993477426'), ('704.803.604-48','29','M','44 975071326'), ('543.287.787-22','17','F','42 976992491'),('958.708.100-51','21','F','43 995329770'), ('366.404.624-27','24','F','43 991337358');

INSERT INTO ARBITRO(cpf,categoria,lutas_arbitradas,horas_trabalhadas) VALUES('950.806.365-30','A',20, 4), ('820.661.011-17','B',15,3),('251.926.090-46','B', 12, 3), ('224.090.453-40','C',13,3),('176.317.203-12','C', 9, 2), ('278.195.757-78','C', 10, 2), ('906.349.225-13','B', 15, 3), ('787.518.749-46','C', 8, 1),('037.807.299-46','A',25, 4), ('389.595.319-95','A',22, 4);

INSERT INTO TECNICO(cpf,cod_Tecn,email,cref_uf) VALUES ('350.601.428-50',20568,'leilamelorocha@superrito.com','878732-G/PR'), ('529.256.693-44',20846,'tomaslimamelo@jourrapide.com', '824674-G/PR'),('642.403.864-70',22260,'danielpintoalmeida@superrito.com','433175-G/PR'),('985.829.940-01',22577,'renancastrodias@superrito.com','426155-G/PR'),('905.387.122-52',25589,'larasantosferreira@einrot.com','304897-G/PR'),('486.999.452-64',25725,'luansantossilva@jourrapide.com','249569-G/PR'), ('488.734.614-09',25976,'brendaaraujoalves@rhyta.com','192256-G/PR'), ('286.338.307-87',26383,'leticiasantosrodrigues@jourrapide.com','189588-G/PR'), ('614.792.745-00',26772,'luansilvagomes@armyspy.com','073816-G/PR'), ('125.860.398-58',27970,'marinamelodias@gustr.com', '038653-G/PR'); 

INSERT INTO CLUBE (codigo, cidade, qtde_atletas, telefone) VALUES (1,'Curitiba',40 ,'41 3433-3259'), (2,'Paranaguá', 18, '41 2478-8876'),(3,'Londrina', 20, '43 3252-3403'),(4,'Maringá', 36, '44 3313-7054'), (5,'Foz do Iguaçu', 15, '45 3889-3614'), (6,'Almirante Tamandaré', 10, '41 3697-5067'),(7,'Cascavel', 13, '45 3024-2133'), (8,'Campo Largo', 25, '41 2707-1521'),(9,'Apucarana', 8, '43 3542-9393'), (10,'Campo Mourão', 23, '44 2031-7138'),(11,'Sarandi', 6, '44 99496685'),(12,'Paranavaí', 10, '44 3037-7821'),(13,'Arapongas', 12, '43 3852-5689'),(14,'Toledo', 8, '45 3813-3333'),(15,'Cambé', 3, '43 3183-5580'),(16,'Telêmaco Borba', 3, '42 3443-7355'),(17,'São José dos Pinhais', 16, '41 2163-9758'),(18,'Santo Antônio do Sudoeste', 2, '46 3353-3451'),(19,'Umuarama', 9, '44 3251-2337');

INSERT INTO CATEGORIA (idade_max, peso, sexo) VALUES ('11 anos',35.00, 'F'), ('11 anos',40.00, 'F'), ('11 anos', 45.00, 'F'),('11 anos', 50.00, 'F'),('11 anos', 35.00, 'M'),('11 anos', 40.00, 'M'),('11 anos', 45.00, 'M'), ('11 anos', 50.00, 'M'),('13 anos', 35.00, 'F'),('13 anos', 40.00, 'F'),('13 anos', 42.00, 'F'),('13 anos', 47.00, 'F'), ('13 anos', 47.00, 'F'),('13 anos', 40.00, 'M'),('13 anos', 45.00, 'M'),('13 anos', 50.00, 'M'),('13 anos', 55.00, 'M'), ('13 anos', 55.00, 'M'),('15 anos', 42.00, 'F'),('15 anos', 47.00, 'F'),('15 anos', 51.00, 'F'),('15 anos', 54.00, 'F'),('15 anos',54.00, 'F'),('15 anos', 52.00, 'M'),('15 anos', 57.00, 'M'),('15 anos', 63.00, 'M'),('15 anos', 70.00, 'M'),('15 anos',70.00, 'M'),('17 anos', 48.00, 'F'),('17 anos', 53.00, 'F'),('17 anos', 59.00, 'F'),('17 anos', 59.00, 'F'),('17 anos', 55.00, 'M'), ('17 anos', 61.00, 'M'),('17 anos', 68.00, 'M'),('17 anos', 76.00, 'M'), ('17 anos', 76.00, 'M'),('20 anos', 50.00, 'F'), ('20 anos', 55.00, 'F'),('20 anos', 61.00, 'F'),('20 anos', 68.00, 'F'), ('20 anos', 68.00, 'F'),('20 anos', 60.00, 'M'), ('20 anos', 67.00, 'M'),('20 anos', 75.00, 'M'),('20 anos', 84.00, 'M'), ('20 anos', 84.00, 'M'), ('18 anos e acima', 50.00, 'F'), ('18 anos e acima', 55.00, 'F'), ('18 anos e acima', 61.00, 'F'), ('18 anos e acima', 68.00, 'F'), ('18 anos e acima', 68.00, 'F'), ('18 anos e acima', 60.00, 'M'), ('18 anos e acima', 67.00, 'M'), ('18 anos e acima', 75.00, 'M'), ('18 anos e acima', 84.00, 'M'),  ('18 anos e acima', 84.00, 'M');

INSERT INTO QUADRA (numero, cat_disputada, responsavel) VALUES (4, 1, 'Paulo Lima'), (4, 2, 'Diego Martins'),(2, 4, 'Lucas Fernandes'), (3, 5, 'Guilherme Goncalves'),(5, 6, 'Ryan Almeida'), (4, 7, 'Brenda Santos'),(1, 8, 'Amanda Martins'), (5, 9,'Vitória Sara Ferreira'),(2, 10, 'Erick Thales Leonardo Brito'), (3, 25, 'Pedro Manuel das Neves');

INSERT INTO LUTA (id, duracao, resultado, id_quadra, cpf_arbitro) VALUES (1,'1:30','1x0',1,'950.806.365-30'),(2,'2:00','3x2',2,'251.926.090-46'),(3,'1:15','0x8',3,'820.661.011-17'),(4,'3:00','2x5',4,'224.090.453-40'),(5,'2:00','0x2',5,'176.317.203-12'),(6,'1:30','0x0',6,'278.195.757-78'),(7,'2:17','9x1',7,'906.349.225-13'),(8,'2:00','3x1',8,'787.518.749-46'),(9,'3:00','1x2',9,'037.807.299-46'),(10,'2:43','10x2',10,'389.595.319-95'),(11,'2:45','2x0', 10,'820.661.011-17'),(12,'3:00','1x2', 2,'251.926.090-46'),(13,'3:00','3x1', 3,'176.317.203-12'),(14,'2:34','0x0',8,'224.090.453-40'), (15,'2:30','8x0',5,'224.090.453-40'), (16,'2:30','4x0',4,'906.349.225-13'), (17,'2:30','0x0',1,'906.349.225-13'), (18,'2:30','1x0',8,'787.518.749-46'), (19,'2:10','9x1',9,'037.807.299-46');

INSERT INTO ATLETA (cpf, cod_atleta, data_filiacao, graduacao, cod_clube, cpf_tecnico, cod_categoria) VALUES ('111.336.912-70',191830,'2008-10-03','2 kyu',3,'350.601.428-50' ,41),('864.051.926-80',113961,'2010-05-21','6 kyu',3,'350.601.428-50' ,52),('738.353.008-05',618693,'2012-07-11','3 kyu',10,'529.256.693-44' ,47), ('269.562.471-37',796108,'2011-01-20','6 kyu',4,'642.403.864-70',28),('965.364.806-75',788905,'2006-08-02','4 kyu',10,'529.256.693-44',31), ('541.741.304-18',978060,'2015-11-14','5 kyu',3,'350.601.428-50' ,57),('171.093.724-45',310020,'2016-04-02','6 kyu',1,'985.829.940-01',38),('410.263.007-89',234675,'2014-06-10','2 kyu',9,'905.387.122-52',45),('702.116.541-69',615973,'2012-02-25','7 kyu',4,'642.403.864-70',37),('928.817.573-31',856471,'2010-06-17','4 kyu',7,'486.999.452-64',54),('451.365.187-31','210275','2010-09-18','2 kyu',5,'350.601.428-50',55), ('916.516.571-30','552267','2012-03-27','1 kyu',5,'350.601.428-50',55), ('855.026.889-50','334362','2013-08-24','4 kyu',10,'529.256.693-44',54),('735.117.657-49','249693','2012-07-11','1 kyu',13,'486.999.452-64',55), ('866.372.787-93','227290','2011-11-08','3 kyu',7,'488.734.614-09',54), ('985.386.685-44','236280','2012-04-21','3 kyu',14,'286.338.307-87',54), ('899.842.144-51','318655','2015-12-13','2 kyu',12,'486.999.452-64',57), ('785.137.210-00','137590','2010-06-20','1 kyu',1,'614.792.745-00',57), ('699.335.447-05','339557','2014-10-07','3 kyu',10,'529.256.693-44',53), ('800.707.965-30','127791','2011-05-15','4 kyu',3,'125.860.398-58',57),('459.074.580-11','232790','2013-11-28','2 kyu',1,'614.792.745-00',55), ('476.949.084-40','496239','2015-10-30','1 kyu',10,'529.256.693-44',52),('624.953.146-78','352780','2013-05-22','2 kyu',13,'486.999.452-64',52), ('783.926.104-31','307958','2013-10-16','1 kyu',1,'614.792.745-00',52),('407.936.727-91','236726','2011-09-14','3 kyu',5,'488.734.614-09',51), ('754.275.117-41','387134','2014-04-26','4 kyu',7,'488.734.614-09',50) ;

INSERT INTO DISPUTA(cpf_atleta, id_luta)  VALUES ('541.741.304-18', 2),('800.707.965-30', 2),('864.051.926-80', 3),('476.949.084-40', 3),('111.336.912-70',1),('738.353.008-05', 7),('269.562.471-37', 4),('965.364.806-75', 9),('171.093.724-45', 5),('410.263.007-89', 10),('702.116.541-69', 8),('928.817.573-31', 6),('866.372.787-93', 6),('899.842.144-51', 11),('800.707.965-30', 11),('899.842.144-51', 12),('785.137.210-00', 12),('451.365.187-31', 13),('735.117.657-49', 13),('459.074.580-11', 14),('916.516.571-30', 14),('735.117.657-49', 15),('459.074.580-11', 15),('624.953.146-78', 16),('783.926.104-31', 16),('476.949.084-40', 17),('624.953.146-78', 17),('985.386.685-44', 18),('855.026.889-50', 18),('866.372.787-93', 19),('985.386.685-44', 19);

INSERT INTO ASSISTE_LUTA (cpf_espectador, id_luta) VALUES  ('236.052.809-27',8),('350.711.779-78',6),('111.623.759-81',2),('231.216.519-86',1),('816.621.659-00',7),('867.814.139-53',4), ('537.662.269-08',3),('986.256.580-24',9), ('584.358.977-37',3),('745.966.512-64',15),  ('274.561.839-37',3), ('588.974.610-34',3),('813.506.303-22',2), ('577.777.399-05',15), ('704.803.604-48',9), ('543.287.787-22',17),('958.708.100-51',7), ('366.404.624-27',4),('274.561.839-37',15), ('588.974.610-34',11);

-- 1 Selecione os nomes dos ATLETAS QUE LUTAM POR CURITIBA

SELECT P.nome FROM PESSOA P
	WHERE P.cpf IN (
		SELECT A.cpf FROM ATLETA A, CLUBE C
		WHERE  C.codigo = A.cod_clube AND C.cidade = 'Curitiba'
);


-- 2 Selecione os clubes que possuem o numero de atletas com o valor maior que a média de atletas dos clubes
SELECT cidade, qtde_atletas FROM CLUBE C WHERE C.qtde_atletas > 
(SELECT AVG(C2.qtde_atletas) FROM CLUBE C2);

-- 3 Selecione o nome dos Atletas que foram filiados no ano de 2012
SELECT nome FROM PESSOA P, ATLETA A
WHERE P.cpf = A.cpf AND P.cpf IN (
            SELECT A2.cpf FROM ATLETA A2 WHERE A2.data_filiacao >= '2012-01-01'
                                         AND   A2.data_filiacao <= '2012-12-31');


-- 4 Selecione os atletas que tem o técnico com o nome = 'Tomás Melo' e que lutam na categoria com o código maior que 50
SELECT * FROM ATLETA A, TECNICO T, PESSOA P 
WHERE A.cpf_tecnico = T.cpf AND P.cpf = T.cpf AND P.nome = 'Tomás Melo' AND A.cod_categoria NOT IN(
        SELECT A2.cod_categoria FROM ATLETA A2
        WHERE A2.cod_categoria < 50);
        


-- 5 Retorne a quantidade de atletas que cada técnico auxiliou 

SELECT COUNT(T.cpf) AS qtde_auxilios, P.nome 
FROM TECNICO T, PESSOA P, ATLETA A
WHERE P.cpf  = T.cpf
AND T.cpf = A.cpf_tecnico
GROUP BY T.cpf
ORDER BY qtde_auxilios DESC;


-- 6 Retorne o nome dos atletas que não lutaram até o momento
SELECT P.nome FROM PESSOA P, ATLETA A
WHERE P.cpf = A.cpf 
AND A.cpf NOT IN (
        SELECT A2.cpf 
        FROM ATLETA A2, DISPUTA D
        WHERE A2.cpf = D.cpf_atleta
);


        
-- 7 Selecione os espectadores que não assistiram a nenhuma luta
SELECT *
FROM PESSOA P, ESPECTADOR E
WHERE P.cpf = E.cpf AND E.cpf NOT IN (
	SELECT E2.cpf 
    FROM ESPECTADOR E2, ASSISTE_LUTA AL
    WHERE E2.cpf = AL.cpf_espectador
);

