CREATE DATABASE MOTORISTA_ONIBUSEX01
GO
USE MOTORISTA_ONIBUSEX01
GO
CREATE TABLE MOTORISTA
(
CODIGO			INT				NOT NULL,
NOME			VARCHAR(50)		NOT NULL,
NATURALIDADE	VARCHAR(50)		NOT NULL
PRIMARY KEY (CODIGO)
)
GO
CREATE TABLE ONIBUS
(
PLACA			VARCHAR(20)		NOT NULL,
MARCA			VARCHAR(30)		NOT NULL,
ANO				INT				NOT NULL,
DESCRICAO		VARCHAR(50)		NOT NULL
PRIMARY KEY (PLACA)
)
GO
CREATE TABLE VIAGEM
(
CODIGO			INT											NOT NULL,
ONIBUS			VARCHAR(20)									NOT NULL,
MOTORISTA		INT											NOT NULL,
HORA_DE_SAIDA	INT				CHECK(HORA_DE_SAIDA>=0)		NOT NULL,
HORA_DE_CHEGADA	INT				CHECK(HORA_DE_CHEGADA>=0)	NOT NULL,
PARTIDA			VARCHAR(30)									NOT NULL
PRIMARY KEY (CODIGO)
FOREIGN KEY (ONIBUS)
			REFERENCES ONIBUS(PLACA),
FOREIGN KEY (MOTORISTA)
			REFERENCES MOTORISTA (CODIGO)
)
GO
ALTER TABLE VIAGEM
ADD DESTINO			VARCHAR(30)									NOT NULL
GO
INSERT INTO MOTORISTA
VALUES 
(12341,'Julio Cesar','São Paulo'),
(12342,'Mario Carmo','Americana'),
(12343,'Lucio Castro','Campinas'),
(12344,'André Figueiredo','São Paulo'),
(12345,'Luiz Carlos','São Paulo'),
(12346,'Carlos Roberto','Campinas'),
(12347,'João Paulo','São Paulo')
GO
INSERT INTO ONIBUS
VALUES
('adf0965','Mercedes',2009,'Leito'),
('bhg7654','Mercedes',2012,'Sem Banheiro'),
('dtr2093','Mercedes',2017,'Ar Condicionado'),
('gui7625','Volvo',2014,'Ar Condicionado'),
('jhy9425','Volvo',2018,'Leito'),
('lmk7485','Mercedes',2015,'Ar Condicionado'),
('aqw2374','Volvo',2014,'Leito')
GO
INSERT INTO VIAGEM
VALUES
(101,'adf0965',12343,10,12,'São Paulo','Campinas'),
(102,'gui7625',12341,7,12,'São Paulo','Araraquara'),
(103,'bhg7654',12345,14,22,'São Paulo','Rio de Janeiro'),
(104,'dtr2093',12344,18,21,'São Paulo','Sorocaba'),
(105,'aqw2374',12342,11,17,'São Paulo','Ribeirão Preto'),
(106,'jhy9425',12347,10,19,'São Paulo','São José do Rio Preto'),
(107,'lmk7485',12346,13,20,'São Paulo','Curitiba'),
(108,'adf0965',12343,14,16,'Campinas','São Paulo'),
(109,'gui7625',12341,14,19,'Araraquara','São Paulo'),
(110,'bhg7654',12345,0,8,'Rio de Janeiro','São Paulo'),
(111,'dtr2093',12344,22,1,'Sorocaba','São Paulo'),
(112,'aqw2374',12342,19,5,'Ribeirão Preto','São Paulo'),
(113,'jhy9425',12347,22,7,'São José do Rio Preto','São Paulo'),
(114,'lmk7485',12346,0,7,'Curitiba','São Paulo')
GO
--'1) Criar um Union das tabelas Motorista e ônibus, com as colunas ID (Código e Placa) e Nome (Nome e Marca)
SELECT CONVERT(VARCHAR(20),M.CODIGO) AS ID,M.NOME AS NOME FROM MOTORISTA M
UNION
SELECT O.PLACA AS ID,O.MARCA AS NOME FROM ONIBUS O
GO
--'2) Criar uma View (Chamada v_motorista_onibus) do Union acima
CREATE VIEW V_MOTORISTA_ONIBUS
AS
	SELECT CONVERT(VARCHAR(20),M.CODIGO) AS ID,M.NOME AS NOME FROM MOTORISTA M
	UNION
	SELECT O.PLACA AS ID,O.MARCA AS NOME FROM ONIBUS O;
GO
SELECT * FROM V_MOTORISTA_ONIBUS
GO
--'3) Criar uma View (Chamada v_descricao_onibus) que mostre o Código da Viagem, o Nome do motorista, 
--a placa do ônibus (Formato XXX-0000), a Marca do ônibus, o Ano do ônibus e a descrição do onibus
CREATE VIEW V_DESCRICAO_ONIBUS
AS
	SELECT V.CODIGO,M.NOME AS NOME_DO_MOTORISTA,
	SUBSTRING(V.ONIBUS,1,3)+'-'+SUBSTRING(V.ONIBUS,4,4) AS PLACA_DO_ONIBUS,
	O.MARCA,O.ANO,O.DESCRICAO
	FROM VIAGEM V
	INNER JOIN MOTORISTA M
	ON M.CODIGO = V.MOTORISTA
	INNER JOIN ONIBUS O
	ON O.PLACA = V.ONIBUS;
GO
SELECT * FROM V_DESCRICAO_ONIBUS
GO
--'4) Criar uma View (Chamada v_descricao_viagem) que mostre o Código da viagem, 
--a placa do ônibus(Formato XXX-0000), a Hora da Saída da viagem (Formato HH:00), 
--a Hora da Chegada da viagem (Formato HH:00), partida e destino
CREATE VIEW V_DESCRICAO_VIAGEM
AS
	SELECT V.CODIGO,
	SUBSTRING(V.ONIBUS,1,3)+'-'+SUBSTRING(V.ONIBUS,4,4) AS PLACA_DO_ONIBUS,
	CONVERT(VARCHAR(12),V.HORA_DE_SAIDA)+':00' AS HORA_DE_SAIDA,
	CONVERT(VARCHAR(12),V.HORA_DE_CHEGADA)+':00' AS HORA_DE_CHEGADA,
	V.PARTIDA,V.DESTINO
	FROM VIAGEM V;
GO
	SELECT * FROM V_DESCRICAO_VIAGEM WHERE CODIGO=101

SP_HELP MOTORISTA

Select V.CODIGO from VIAGEM V

SELECT * FROM V_DESCRICAO_VIAGEM