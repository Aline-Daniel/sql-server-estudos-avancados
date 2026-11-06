-- CREATE OR ALTER VIEW exige ser o primeiro comando de seu lote no SQL Server.
CREATE OR ALTER VIEW dbo.vw_portfolio_resumo_pedidos
AS
SELECT p.pedido_id, p.data_pedido, p.status, c.nome AS cliente,
       COUNT(i.item_id) AS linhas_pedido,
       COALESCE(SUM(CAST(i.quantidade AS DECIMAL(12,2)) * i.preco_unitario), 0) AS subtotal,
       p.valor_frete
FROM dbo.portfolio_pedidos AS p
JOIN dbo.portfolio_clientes AS c ON c.cliente_id = p.cliente_id
LEFT JOIN dbo.portfolio_itens AS i ON i.pedido_id = p.pedido_id
GROUP BY p.pedido_id, p.data_pedido, p.status, c.nome, p.valor_frete;
GO
SELECT *, subtotal + valor_frete AS total_pedido
FROM dbo.vw_portfolio_resumo_pedidos
ORDER BY data_pedido DESC;
