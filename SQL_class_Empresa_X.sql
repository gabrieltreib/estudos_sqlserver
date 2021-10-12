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

 