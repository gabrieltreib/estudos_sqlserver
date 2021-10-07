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