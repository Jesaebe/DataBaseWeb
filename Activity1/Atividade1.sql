SELECT * FROM cliente;

SELECT * FROM endereco;

SELECT * FROM pedido;

SELECT * FROM pessoafisica;

SELECT * FROM pessoajuridica;

SELECT * FROM produto;

SELECT * FROM telefone;

SELECT * FROM trocaproduto;

SELECT * FROM venda;


/******* ATIVIDADE 1 - EXISTS ********/
SELECT p.nome 
FROM produto p
WHERE NOT EXISTS (
	SELECT * 
	FROM venda v
	WHERE p.codProduto = v.codProduto);
	
/******* ATIVIDADE 1 - ALL ********/
SELECT p.nome 
FROM produto p
WHERE p.codProduto != ALL (
	SELECT v.codProduto 
	FROM venda v);
	
/******* ATIVIDADE 1 - JOIN ********/
SELECT p.nome 
FROM produto p
LEFT JOIN venda v ON v.codProduto = p.codProduto
WHERE v.codProduto IS NULL;



/******* ATIVIDADE 2 ********/
SELECT tp.codProdutoVenda, p.nome, SUM(tp.quantidade) Qtd Troca
FROM trocaproduto tp
INNER JOIN produto p ON p.codProduto = tp.codProdutoVenda
GROUP BY tp.codProdutoVenda, p.nome
HAVING COUNT(*) = (
	SELECT MAX(Qtd)
	FROM (
		SELECT codProdutoVenda, COUNT(codProdutoVenda) Qtd
		FROM trocaproduto 
		GROUP BY codProdutoVenda
		) troca
	);

/******* ATIVIDADE 3 ********/
SELECT TRUNCATE (
	(SELECT COUNT(*) FROM trocaproduto) /
	(SELECT COUNT(*) FROM venda) * 100,
	2) Percent;


/******* ATIVIDADE 4 ********/
SELECT p.codProduto, p.nome
FROM produto p
WHERE EXISTS (
	SELECT * 
	FROM trocaproduto tp
	WHERE tp.codProdutoVenda = p.codProduto
	);


/******* ATIVIDADE 5 ********/
SELECT p.codProduto, p.nome, COUNT(tp.quantidade) Qtd Troca
FROM produto p
INNER JOIN trocaproduto tp ON tp.codProdutoVenda = p.codProduto
GROUP BY p.codProduto, p.nome
HAVING Qtd > 1
ORDER BY p.codProduto;


/******* ATIVIDADE 6 ********/
SELECT p.codProduto, p.nome, SUM(v.quantidade) Qtd Vendida
FROM venda v 
INNER JOIN produto p ON p.codProduto = v.codProduto
INNER JOIN pedido pd ON pd.codPedido = v.codPedido
WHERE pd.data BETWEEN '2016-02-01' AND '2016-11-30'
GROUP BY p.codProduto, p.nome
HAVING SUM(v.quantidade) = (
	SELECT MAX(Qtd)
	FROM (
		SELECT codProduto, SUM(quantidade) Qtd
		FROM venda
		GROUP BY codProduto
		) venda
	);


/******* ATIVIDADE 7 ********/
SELECT pd.formaPagamento, COUNT(pd.formaPagamento) Quantidade
FROM pedido pd
WHERE pd.data BETWEEN '2015-01-01' AND '2016-12-31'
GROUP BY pd.formaPagamento;


/******* ATIVIDADE 8 ********/
SELECT c.codCliente, c.nome, c.tipoCliente, SUM(v.quantidade) QtdComprado
FROM pedido pd
INNER JOIN cliente c ON c.codCliente = pd.codCliente
INNER JOIN venda v ON v.codPedido = pd.codPedido
WHERE pd.data BETWEEN '2015-01-01' AND '2016-12-31'
GROUP BY c.codCliente, c.nome, c.tipoCliente
HAVING SUM(v.quantidade) = (
	SELECT MAX(Qtd)
	FROM (
		SELECT c.codCliente, SUM(v.quantidade) Qtd
		FROM venda v
		INNER JOIN pedido pd ON pd.codPedido = v.codPedido
		INNER JOIN cliente c ON c.codCliente = pd.codCliente
		GROUP BY c.codCliente
		) venda
	);


/******* ATIVIDADE 9 ********/
SELECT pd.codPedido, YEAR(pd.data) Ano, pd.status, c.nome, c.tipoCliente
FROM pedido pd
INNER JOIN cliente c ON c.codCliente = pd.codCliente
WHERE NOT EXISTS (
	SELECT *
	FROM venda v
	WHERE v.codPedido = pd.codPedido
	);


/******* ATIVIDADE 10 ********/
SELECT c.tipoCliente, COUNT(pd.codPedido) QtdPedido
FROM cliente c
INNER JOIN pedido pd ON pd.codCliente = c.codCliente
WHERE pd.status = 'aprovado'
GROUP BY c.tipoCliente;
