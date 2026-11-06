-- Clientes que ainda nao fizeram pedidos.
SELECT c.cliente_id, c.nome
FROM dbo.portfolio_clientes AS c
WHERE NOT EXISTS (
    SELECT 1 FROM dbo.portfolio_pedidos AS p
    WHERE p.cliente_id = c.cliente_id
);

-- Pedido cujo subtotal supera a media de todos os pedidos.
WITH totais AS (
    SELECT p.pedido_id,
           SUM(CAST(i.quantidade AS DECIMAL(12,2)) * i.preco_unitario) AS subtotal
    FROM dbo.portfolio_pedidos AS p
    JOIN dbo.portfolio_itens AS i ON i.pedido_id = p.pedido_id
    GROUP BY p.pedido_id
)
SELECT pedido_id, subtotal FROM totais
WHERE subtotal > (SELECT AVG(subtotal) FROM totais)
ORDER BY subtotal DESC;
