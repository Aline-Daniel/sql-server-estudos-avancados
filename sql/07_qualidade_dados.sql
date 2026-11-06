-- Verificacoes exploratorias, somente SELECT (nao alteram dados).
-- 1. Pedidos sem itens
SELECT p.pedido_id
FROM dbo.portfolio_pedidos AS p
LEFT JOIN dbo.portfolio_itens AS i ON i.pedido_id = p.pedido_id
WHERE i.item_id IS NULL;

-- 2. Valores invalidos; as constraints CHECK tambem evitam gravacoes incorretas.
SELECT item_id, quantidade, preco_unitario
FROM dbo.portfolio_itens
WHERE quantidade <= 0 OR preco_unitario < 0;

-- 3. Pedidos com frete acima de um limiar didatico.
SELECT pedido_id, valor_frete
FROM dbo.portfolio_pedidos
WHERE valor_frete > 15;

-- 4. Quantidade de clientes por UF.
SELECT uf, COUNT(*) AS clientes FROM dbo.portfolio_clientes
GROUP BY uf ORDER BY clientes DESC, uf;
