-- Total de vendas e faturamento por categoria, usando os precos da data de compra.
WITH vendas_categoria AS (
    SELECT cat.nome AS categoria,
           SUM(i.quantidade) AS unidades,
           SUM(CAST(i.quantidade AS DECIMAL(12,2)) * i.preco_unitario) AS faturamento
    FROM dbo.portfolio_itens AS i
    JOIN dbo.portfolio_produtos AS p ON p.produto_id = i.produto_id
    JOIN dbo.portfolio_categorias AS cat ON cat.categoria_id = p.categoria_id
    GROUP BY cat.nome
)
SELECT categoria, unidades, faturamento,
       DENSE_RANK() OVER (ORDER BY faturamento DESC) AS ranking
FROM vendas_categoria
ORDER BY ranking;

-- Produto mais vendido dentro de cada categoria.
WITH vendas AS (
    SELECT c.nome AS categoria, p.nome AS produto,
           SUM(i.quantidade) AS quantidade
    FROM dbo.portfolio_itens AS i
    JOIN dbo.portfolio_produtos AS p ON p.produto_id = i.produto_id
    JOIN dbo.portfolio_categorias AS c ON c.categoria_id = p.categoria_id
    GROUP BY c.nome, p.nome
), ordenado AS (
    SELECT *, DENSE_RANK() OVER (PARTITION BY categoria ORDER BY quantidade DESC) AS posicao
    FROM vendas
)
SELECT categoria, produto, quantidade FROM ordenado WHERE posicao = 1;
