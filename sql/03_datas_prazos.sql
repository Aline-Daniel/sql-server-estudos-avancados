-- DATEADD, DATEDIFF e CONVERT para prazos hipoteticos de entrega.
-- Regras didaticas, NAO promessas reais de prazo de transportadora.
SELECT p.pedido_id, c.uf, p.data_pedido,
       DATEADD(DAY,
           CASE WHEN c.uf IN ('SP','RJ','ES') THEN 5
                WHEN c.uf = 'MG' THEN 7
                ELSE 10 END,
           p.data_pedido) AS data_prevista,
       DATEDIFF(DAY, p.data_pedido, CAST(GETDATE() AS DATE)) AS dias_desde_pedido,
       CONVERT(VARCHAR(10), p.data_pedido, 103) AS data_pedido_br
FROM dbo.portfolio_pedidos AS p
JOIN dbo.portfolio_clientes AS c ON c.cliente_id = p.cliente_id
ORDER BY p.data_pedido;

SELECT YEAR(data_pedido) AS ano, MONTH(data_pedido) AS mes,
       COUNT(*) AS quantidade_pedidos
FROM dbo.portfolio_pedidos
GROUP BY YEAR(data_pedido), MONTH(data_pedido)
ORDER BY ano, mes;
