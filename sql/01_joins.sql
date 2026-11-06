-- INNER JOIN: apenas pedidos com clientes relacionados.
SELECT p.pedido_id, p.data_pedido, c.nome AS cliente, p.status
FROM dbo.portfolio_pedidos AS p
INNER JOIN dbo.portfolio_clientes AS c ON c.cliente_id = p.cliente_id
ORDER BY p.pedido_id;

-- LEFT JOIN: inclui clientes sem pedidos.
SELECT c.cliente_id, c.nome, p.pedido_id
FROM dbo.portfolio_clientes AS c
LEFT JOIN dbo.portfolio_pedidos AS p ON p.cliente_id = c.cliente_id
ORDER BY c.cliente_id;

-- RIGHT JOIN: inclui todos os produtos, mesmo sem itens em pedido.
SELECT i.pedido_id, pr.nome AS produto, i.quantidade
FROM dbo.portfolio_itens AS i
RIGHT JOIN dbo.portfolio_produtos AS pr ON pr.produto_id = i.produto_id
ORDER BY pr.produto_id;

-- FULL JOIN: em bancos inconsistentes/dados sem correspondencia, preserva ambos os lados.
SELECT c.nome, p.pedido_id
FROM dbo.portfolio_clientes AS c
FULL OUTER JOIN dbo.portfolio_pedidos AS p ON p.cliente_id = c.cliente_id
ORDER BY c.nome, p.pedido_id;
