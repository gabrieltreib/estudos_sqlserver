SELECT * 
FROM PEDIDO INNER JOIN PRODUTO ON PEDIDO.idProduto = PRODUTO.idProduto;


SELECT ped.idPedido, ped.idVendedor, ped.idCliente, ped.Valor, vend.nome, cli.nome
FROM PEDIDO AS ped
JOIN VENDEDOR AS vend ON ped.idVendedor = vend.idVendedor
JOIN CLIENTE AS cli ON ped.idCliente = cli.idCliente;

-- LEFT JOIN - É utilizado para consultar dados que estejam pelo menos uma vez na tabela da esquerda, 
-- e que não estejam referenciados na tabela da direita.

SELECT *
FROM VENDA
LEFT JOIN FUNCIONARIO ON VENDA.vendedor = FUNCIONARIO.nome;

-- no exemplo acima, caso exista algum funcionario na VENDA que não esteja na tabela FUNCIONARIO
-- ele continuará sendo impresso, com os valores NULL nos dados referentes ao FUNCIONARIO

-- RIGHT JOIN - É utilizado para consultar dados que estejam pelo menos uma vez na tabela da direita, 
-- e que não estejam referenciados na tabela da esquerda.

SELECT *
FROM VENDA
RIGHT JOIN FUNCIONARIO ON VENDA.vendedor = FUNCIONARIO.nome;
