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