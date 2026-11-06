-- Exemplo seguro: alteracao fica SOMENTE dentro de uma transacao e e revertida.
-- Execute apenas no banco de teste criado com 00_preparar_ambiente.sql.
BEGIN TRANSACTION;
    SELECT pedido_id, status FROM dbo.portfolio_pedidos WHERE pedido_id = 102;
    UPDATE dbo.portfolio_pedidos SET status = N'em_separacao' WHERE pedido_id = 102;
    SELECT pedido_id, status FROM dbo.portfolio_pedidos WHERE pedido_id = 102;
ROLLBACK TRANSACTION;

-- Confirmacao: a alteracao NAO foi persistida.
SELECT pedido_id, status FROM dbo.portfolio_pedidos WHERE pedido_id = 102;

-- Para um COMMIT real, revise os filtros, crie backup e execute em ambiente controlado.
