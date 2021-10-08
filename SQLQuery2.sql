-- apresenta valores �nicos
SELECT DISTINCT(CARGO)
FROM dbo.funcionario;

-- apresenta a estrutura de uma tabela
sp_help funcionario;

-- %  no final, tudo que come�a com aqueLA STRING
SELECT * 
FROM funcionario
WHERE nome LIKE 'Maria%';

-- "_" nesse exemplo abaixo, mostra todos os nomes que possuem "s"
-- na 4� posi��o, e qualquer coisa ap�s isso
SELECT * 
FROM funcionario
WHERE nome LIKE '___s%';

-- todos os funcionarios que come�am com nome de A a C
SELECT *
FROM funcionario
WHERE nome LIKE '[A-C]%';

-- todos os funcionarios que n�o come�am com nome de A a C
SELECT *
FROM funcionario
WHERE nome LIKE '[^A-C]%';

-- SUBSTRING('Ol� Mundo',1,3); resultado = Ol�
-- primeiro par�metro = texto a ser ajustado
-- segundo par�metro = posi��o inicial a ser impressa
-- terceiro par�metro = tamanho final da string

SELECT id,
	SUBSTRING(nome,1,10)
FROM funcionario;


-- LEN; retorna o tamanho da string, contando espa�os em branco

--REPLACE; Aceita 3 par�metros, 
-- 1� coluna a ser manipulada
-- 2� caracter procurado
-- 3� caracter que substituir� o caracter procurado

SELECT id,
	REPLACE(nome, 'J','W')
FROM funcionario;


-- LTRIM = remove espa�os em branco na esquerda 
-- RTRIM = remove espa�os em branco na direita

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
-- 1� Par�metro = o que deseja retornar, se � m�s, dia ou ano
-- 2� Par�metro = de onde que ser� buscado o valor a ser apresentado

SELECT DATEPART(MONTH, GETDATE())

-- DATEADD; Adiciona dias/meses/anos ao campo informado

SELECT DATEADD(YEAR,3,GETDATE())

-- DATEDIFF; Retorna a diferen�a em dia, mes ou ano entre duas datas.

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

 