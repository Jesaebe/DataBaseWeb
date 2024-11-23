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
SELECT tp.codProdutoVenda, p.nome, SUM(tp.quantidade) Qtd
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


