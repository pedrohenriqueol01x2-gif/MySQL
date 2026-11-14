CREATE DATABASE db_formula_1;

USE db_formula_1;

CREATE TABLE tb_paises (
codigo INTEGER NOT NULL,
nome VARCHAR(100),
PRIMARY KEY (codigo)
);

CREATE TABLE tb_equipes (
sigla VARCHAR(5) NOT NULL,
nome VARCHAR(100) NOT NULL,
PRIMARY KEY (sigla)
);

CREATE TABLE tb_pilotos (
numero INTEGER NOT NULL AUTO_INCREMENT,
nome VARCHAR(100) NOT NULL,
cod_pais INTEGER NOT NULL,
sigla_equipe VARCHAR(5) NOT NULL,
PRIMARY KEY (numero),
FOREIGN KEY (cod_pais) references tb_paises(codigo),
FOREIGN KEY (sigla_equipe) references tb_equipes(sigla)
);

CREATE TABLE tb_corridas (
sigla_gp VARCHAR(5) NOT NULL,
nome_gp VARCHAR(100) NOT NULL,
cod_pais INTEGER NOT NULL,
qnt_voltas INTEGER NOT NULL,
PRIMARY KEY (sigla_gp),
FOREIGN KEY (cod_pais) references tb_paises(codigo)
);

CREATE TABLE tb_participante (
posicao_largada VARCHAR(3) NOT NULL,
num_piloto INTEGER NOT NULL AUTO_INCREMENT,
sigla_corrida VARCHAR(5) NOT NULL,
FOREIGN KEY (num_piloto) references tb_pilotos(numero),
FOREIGN KEY (sigla_corrida) references tb_corridas(sigla_gp)
);

INSERT tb_paises VALUES ('1','BRASIL');
INSERT tb_paises VALUES ('2','ITÁLIA');
INSERT tb_paises VALUES ('3','FRANÇA');
INSERT tb_paises VALUES ('4','AUSTRÁLIA');
INSERT tb_paises VALUES ('5','ALEMANHA');
INSERT tb_paises VALUES ('6','PAÍSES BAIXOS');

SELECT * FROM tb_paises;

INSERT tb_equipes VALUES ('MER','MERCEDES');
INSERT tb_equipes VALUES ('FER','FERRARI');
INSERT tb_equipes VALUES ('MCL','MC LAREN');
INSERT tb_equipes VALUES ('RED','RED BULL RACING');
INSERT tb_equipes VALUES ('AUD','AUDI F1 TEAM (SAUBER)');
INSERT tb_equipes VALUES ('WIL','WILLIAMS');

SELECT * FROM tb_equipes;

INSERT tb_pilotos VALUES ('6','ISACK HADJAR','3','RED' );
INSERT tb_pilotos VALUES ('1','ALAIN PROST','3','FER');
INSERT tb_pilotos VALUES ('27','JEAN ALESI','3','FER');
INSERT tb_pilotos VALUES ('19','FELIPE MASSA','1','FER');
INSERT tb_pilotos VALUES ('2','RUBENS BARRICHELLO','1','FER');
INSERT tb_pilotos VALUES ('12','AYRTON SENNA','1','MCL');
INSERT tb_pilotos VALUES ('5','EMERSON FITTIPALDI','1','MCL');
INSERT tb_pilotos VALUES ('7','NELSON PIQUET','1','WIL');
INSERT tb_pilotos VALUES ('22','KIMI ANTONELLI','2','MER');
INSERT tb_pilotos VALUES ('8','ANDREA DE CESARIS','2','MCL');
INSERT tb_pilotos VALUES ('3','MAX VERSTAPPEN','6','RED');
INSERT tb_pilotos VALUES ('17','SEBASTIAN VETTEL','5','RED');
INSERT tb_pilotos VALUES ('14','MARK WEBBER','4','RED');
INSERT tb_pilotos VALUES ('18','NICO HÜLKENBERG','5','AUD');
INSERT tb_pilotos VALUES ('9','NICK HEIDFELD','5','AUD');
INSERT tb_pilotos VALUES ('21','MICHAEL SCHUMACHER','5','FER');
INSERT tb_pilotos VALUES ('16','HEINZ-HARALD FRENTZEN','5','AUD');

SELECT * FROM tb_pilotos;

INSERT tb_corridas VALUES ('GP','GRAND PRIX','3','53');
INSERT tb_corridas VALUES ('WCC','WORLD CONSTRUCTORS CHAMPIONSHIP','1','20');
INSERT tb_corridas VALUES ('WDC','WORLD DRIVERS CHAMPIONSHIP','5','70');
INSERT tb_corridas VALUES ('SQ','SPRINT QUALIFYING','4','67');

SELECT * FROM tb_corridas;

INSERT tb_participante VALUES ('G1','12','GP');
INSERT tb_participante VALUES ('G2','21','GP');
INSERT tb_participante VALUES ('G3','1','GP');
INSERT tb_participante VALUES ('G4','3','GP');
INSERT tb_participante VALUES ('G5','19','GP');
INSERT tb_participante VALUES ('G6','22','GP');
INSERT tb_participante VALUES ('G7','18','GP');
INSERT tb_participante VALUES ('G8','14','GP');
INSERT tb_participante VALUES ('G9','27','GP');
INSERT tb_participante VALUES ('G10','6','GP');
INSERT tb_participante VALUES ('G11','5','GP');
INSERT tb_participante VALUES ('G12','9','GP');
INSERT tb_participante VALUES ('G13','2','GP');
INSERT tb_participante VALUES ('G14','7','GP');
INSERT tb_participante VALUES ('G15','8','GP');
INSERT tb_participante VALUES ('G16','16','GP');
INSERT tb_participante VALUES ('G17','17','GP');

SELECT * FROM tb_participante;

/* Queries */

/* 3. Liste o nome dos países que começam com a letra B e terminam com a letra L */
SELECT nome FROM tb_paises
WHERE nome LIKE 'B%L';

/* 4. Liste o nome dos pilotos que são dos países BRASIL, ITÁLIA e FRANÇA */

SELECT tb_pilotos.nome AS Piloto, tb_paises.nome AS Pais
FROM tb_pilotos
JOIN tb_paises
ON tb_pilotos.cod_pais = tb_paises.codigo
WHERE tb_pilotos.cod_pais IN ('1', '2', '3');

/* 5. Liste o nome dos pilotos */
SELECT nome FROM tb_pilotos;

/* 6. Liste o nome dos gp e a quantidade de voltas */
SELECT nome_gp AS 'CORRIDAS', qnt_voltas AS 'QUANTIDADE DE VOLTAS'
FROM tb_corridas;

/* 7. Liste o nome dos pilotos e seus países */
SELECT tb_pilotos.nome AS Piloto, tb_paises.nome AS Pais
FROM tb_pilotos
JOIN tb_paises
ON tb_pilotos.cod_pais = tb_paises.codigo;

/* 8. Insira o atributo salário na tabela piloto. */
ALTER TABLE tb_pilotos
ADD salario INTEGER NOT NULL;

SELECT * FROM tb_pilotos;

UPDATE tb_pilotos
SET salario = '8000000'
WHERE numero = 1;

UPDATE tb_pilotos
SET salario = '4000000'
WHERE numero = 2;

UPDATE tb_pilotos
SET salario = '35000000'
WHERE numero = 3;

UPDATE tb_pilotos
SET salario = '3000000'
WHERE numero = 5;

UPDATE tb_pilotos
SET salario = '6600000'
WHERE numero = 6;

UPDATE tb_pilotos
SET salario = '6000000'
WHERE numero = 7;

UPDATE tb_pilotos
SET salario = '1500000'
WHERE numero = 8;

UPDATE tb_pilotos
SET salario = '3000000'
WHERE numero = 9;

UPDATE tb_pilotos
SET salario = '10000000'
WHERE numero = 12;

UPDATE tb_pilotos
SET salario = '8000000'
WHERE numero = 14;

UPDATE tb_pilotos
SET salario = '2000000'
WHERE numero = 16;

UPDATE tb_pilotos
SET salario = '15000000'
WHERE numero = 17;

UPDATE tb_pilotos
SET salario = '5000000'
WHERE numero = 18;

UPDATE tb_pilotos
SET salario = '5000000'
WHERE numero = 19;

UPDATE tb_pilotos
SET salario = '20000000'
WHERE numero = 21;

UPDATE tb_pilotos
SET salario = '4500000'
WHERE numero = 22;

UPDATE tb_pilotos
SET salario = '4000000'
WHERE numero = 27;

/* 10. Liste o nome dos pilotos cujos salários sejam entre 7 e 10 milhões */
SELECT nome, salario FROM tb_pilotos
WHERE salario BETWEEN 7000000 and 10000000;

/* 11. Retorne para cada cod_pais, a média salarial dos empregados */

SELECT TRUNCATE(AVG(salario), 0)AS"Média salrial dos pilotos (Brasil)"
FROM tb_pilotos
WHERE cod_pais = '1';

SELECT TRUNCATE(AVG(salario), 0)AS"Média salarial dos pilotos (França)"
FROM tb_pilotos
WHERE cod_pais = '2';

SELECT TRUNCATE(AVG(salario), 0)AS"Média salarial dos pilotos (Itália)"
FROM tb_pilotos
WHERE cod_pais = '3';

SELECT TRUNCATE(AVG(salario), 0)AS"Média salarial dos pilotos (Austrália)"
FROM tb_pilotos
WHERE cod_pais = '4';

SELECT TRUNCATE(AVG(salario), 0)AS"Média salarial dos pilotos (Alemanha)"
FROM tb_pilotos
WHERE cod_pais = '5';

SELECT TRUNCATE(AVG(salario), 0)AS"Média salarial dos pilotos (Países Baixos)"
FROM tb_pilotos
WHERE cod_pais = '6';

/* 12. Exiba todos os diferentes valores dos salários contidos na tabela pilotos ordenados em ordem
crescente de valor. */
SELECT nome, salario FROM tb_pilotos
ORDER BY salario;