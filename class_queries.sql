-- apresenta valores únicos
SELECT DISTINCT(CARGO)
FROM dbo.funcionario;

-- apresenta a estrutura de uma tabela
sp_help funcionario;

-- %  no final, tudo que começa com aqueLA STRING
SELECT * 
FROM funcionario
WHERE nome LIKE 'Maria%';

-- "_" nesse exemplo abaixo, mostra todos os nomes que possuem "s"
-- na 4° posição, e qualquer coisa após isso
SELECT * 
FROM funcionario
WHERE nome LIKE '___s%';

-- todos os funcionarios que começam com nome de A a C
SELECT *
FROM funcionario
WHERE nome LIKE '[A-C]%';

-- todos os funcionarios que não começam com nome de A a C
SELECT *
FROM funcionario
WHERE nome LIKE '[^A-C]%';

-- SUBSTRING('Olá Mundo',1,3); resultado = Olá
-- primeiro parâmetro = texto a ser ajustado
-- segundo parâmetro = posição inicial a ser impressa
-- terceiro parâmetro = tamanho final da string

SELECT id,
	SUBSTRING(nome,1,10)
FROM funcionario;


-- LEN; retorna o tamanho da string, contando espaços em branco

--REPLACE; Aceita 3 parâmetros, 
-- 1° coluna a ser manipulada
-- 2° caracter procurado
-- 3° caracter que substituirá o caracter procurado

SELECT id,
	REPLACE(nome, 'J','W')
FROM funcionario;


-- LTRIM = remove espaços em branco na esquerda 
-- RTRIM = remove espaços em branco na direita

SELECT TRIM(nome) AS nome
FROM funcionario

-- STUFF

SELECT STUFF(nome, 4,3, 'teste')
FROM funcionario;

-- ROUND; 

SELECT ROUND(1322.56,-1) FROM funcionario 

-- ABS; Transforma qualquer valor em absoluto, ou seja, muda para positivo

SELECT ABS(-15) FROM funcionario

-- RAND; Gera valores randomicos

-- FLOOR; Remove os valores decimais, deixando sempre o valor inteiro

SELECT FLOOR(12.92)

-- GETDATE(); Retorna data e hora atual do sistema

SELECT GETDATE()

--DATEPART
-- 1° Parâmetro = o que deseja retornar, se é mês, dia ou ano
-- 2° Parâmetro = de onde que será buscado o valor a ser apresentado

SELECT DATEPART(MONTH, GETDATE())

-- DATEADD; Adiciona dias/meses/anos ao campo informado

SELECT DATEADD(YEAR,3,GETDATE())

-- DATEDIFF; Retorna a diferença em dia, mes ou ano entre duas datas.

SELECT DATEDIFF(MONTH, '01/01/1980', GETDATE())

-- FORMAT; Formata a data no formato desejado

SELECT FORMAT(GETDATE(), 'MM/dd/yyyy');


 -- SUBQUERYES

SELECT nome,
       nascimento,
       salario
FROM funcionario
WHERE salario = (SELECT MAX(salario) FROM funcionario)

SELECT *
FROM funcionario
WHERE salario > (SELECT AVG(salario) FROM funcionario)


SELECT *
FROM funcionario
WHERE nome = (SELECT vendedor
			  FROM venda
			  WHERE quantidade = (SELECT MAX(quantidade)
                                  FROM venda))

 
SELECT * 
FROM PEDIDO INNER JOIN PRODUTO ON PEDIDO.idProduto = PRODUTO.idProduto;


SELECT ped.idPedido, ped.idVendedor, ped.idCliente, ped.Valor, vend.nome, cli.nome
FROM PEDIDO AS ped
JOIN VENDEDOR AS vend ON ped.idVendedor = vend.idVendedor
JOIN CLIENTE AS cli ON ped.idCliente = cli.idCliente;

-- LEFT JOIN - ? utilizado para consultar dados que estejam pelo menos uma vez na tabela da esquerda, 
-- e que n?o estejam referenciados na tabela da direita.

SELECT *
FROM VENDA
LEFT JOIN FUNCIONARIO ON VENDA.vendedor = FUNCIONARIO.nome;

-- no exemplo acima, caso exista algum funcionario na VENDA que n?o esteja na tabela FUNCIONARIO
-- ele continuar? sendo impresso, com os valores NULL nos dados referentes ao FUNCIONARIO

-- RIGHT JOIN - ? utilizado para consultar dados que estejam pelo menos uma vez na tabela da direita, 
-- e que n?o estejam referenciados na tabela da esquerda.

SELECT *
FROM VENDA
RIGHT JOIN FUNCIONARIO ON VENDA.vendedor = FUNCIONARIO.nome;


SELECT NOME, DATA_CONTRATACAO,
CASE YEAR(DATA_CONTRATACAO)
WHEN 2015 THEN 'Contratado em 2015'
WHEN 2010 THEN 'Contratado em 2010'
WHEN 2001 THEN 'Contratado em 2001'
ELSE 'N?o classificado'
END AS 'Ano refer?ncia'
FROM FUNCIONARIO

SELECT NOME, SALARIO, SALARIO =
CASE 
WHEN SALARIO >= 3500 THEN '?timo sal?rio'
WHEN SALARIO < 3500 AND SALARIO >= 1500 THEN 'Bom sal?rio'
WHEN SALARIO < 1500 THEN 'Sal?rio ruim'
END
FROM FUNCIONARIO

SELECT SALARIO,
IIF (SALARIO >=2500, 'Sal?rio bom', 'Sal?rio ruim') AS RESULTADO FROM FUNCIONARIO;

SELECT NOME, CARGO, CIDADE, SALARIO,
CASE 
	WHEN CIDADE = 'S?o Paulo' THEN
		CASE WHEN SALARIO >= 3500 THEN 'Bom sal?rio'
		ELSE 'Sal?rio Ruim'
		END
	WHEN CIDADE = 'Araras' THEN
		CASE WHEN SALARIO >= 2500 THEN 'Bom sal?rio'
		ELSE 'Sal?rio ruim'
		END
END AS Resultado
FROM Empresa_X.dbo.funcionario;

INSERT INTO
    funcionario
    (
    nome,
    nascimento,
    data_contratacao,
    cargo,
    cidade,
    salario
    )
VALUES
    (
        'Flavio',
        '2000-12-23',
        '2019-12-10',
        'Caixa',
        'Canoas',
        3323
    );
-- Voltando o sequencial do ID para um n ú mero desejado 
DBCC CHECKIDENT('funcionario', RESEED, 28);

SELECT
    *
FROM
    PEDIDO;


INSERT INTO
    PEDIDO
    (
    idProduto,
    idVendedor,
    idCliente,
    Quantidade,
    Valor
    )
SELECT
    PRODUTO.idProduto,
    VENDEDOR.idVendedor,
    CLIENTE.idCliente,
    20,
    400
FROM
    PRODUTO,
    VENDEDOR,
    CLIENTE
WHERE
    CLIENTE.NOME = 'Daniel Mendes'
    AND VENDEDOR.NOME = 'Josias Mateus'
    AND PRODUTO.Descrição = 'TV';

-- BEGIN = INICIA TRANSAÇÃO, COM O NOME COLOCADO A DIREITA
-- COMMIT = APÓS RODADO OS INSERTS/DELETES/UPDATES, CONFIRMA A TRANSAÇÃO
-- ROLLBACK = RETORNA OS DADOS DAS TABELAS PARA O MESMO ESTADO ANTES DE INICIAR A TRANSAÇÃO

BEGIN TRANSACTION EXEMPLO;
COMMIT TRANSACTION EXEMPLO;
ROLLBACK TRANSACTION EXEMPLO;

CREATE DATABASE Empresa_Z;

-- TIPOS DE DADOS
-- https://docs.microsoft.com/pt-br/sql/t-sql/data-types/data-types-transact-sql?view=sql-server-ver15

CREATE TABLE CLIENTES
(
    ID INTEGER IDENTITY(1, 1) PRIMARY KEY NOT NULL,
    NOME VARCHAR(50) NOT NULL,
    ENDERECO VARCHAR(50) NOT NULL,
    EMAIL VARCHAR(50),
    DATA_NASCIMENTO DATE
);

CREATE TABLE PRODUTOS
(
    ID INTEGER IDENTITY(1, 1) PRIMARY KEY NOT NULL,
    NOME VARCHAR(50) NOT NULL,
    PRECO FLOAT (8) NOT NULL,
    QUANTIDADE INTEGER NOT NULL,
    DATA_VALIDADE DATE
);

CREATE TABLE PEDIDOS
(
    ID INTEGER IDENTITY(1, 1) PRIMARY KEY NOT NULL,
    ID_PROD INTEGER CONSTRAINT FK_PED_PROD REFERENCES PRODUTOS(ID),
    ID_CLIENTE INTEGER CONSTRAINT FK_PED_CLI REFERENCES CLIENTES(ID),
    QUANTIDADE INTEGER NOT NULL
);

CREATE TABLE VENDEDORES
(
    ID INTEGER IDENTITY(1, 1) PRIMARY KEY NOT NULL,
    NOME VARCHAR(50) NOT NULL,
    SEXO VARCHAR(1) NOT NULL,
    EMAIL VARCHAR(50) NOT NULL,
    SALARIO FLOAT(4)
);

ALTER TABLE PEDIDOS
ADD ID_VEND INTEGER;

ALTER TABLE PEDIDOS
ADD CONSTRAINT FK_PED_VEND FOREIGN KEY (ID_VEND) REFERENCES VENDEDORES (ID);

