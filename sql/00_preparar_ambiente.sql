-- EXECUTAR SOMENTE NUM BANCO DE TESTES VAZIO, SELECIONADO NO SSMS.
-- Este script NAO executa DROP/TRUNCATE/DELETE e NAO altera tabelas de terceiros.
SET NOCOUNT ON;
GO
IF OBJECT_ID(N'dbo.portfolio_clientes', N'U') IS NULL
BEGIN
    CREATE TABLE dbo.portfolio_clientes (
        cliente_id INT NOT NULL PRIMARY KEY,
        nome NVARCHAR(80) NOT NULL,
        uf CHAR(2) NOT NULL,
        data_cadastro DATE NOT NULL
    );
END;
GO
IF OBJECT_ID(N'dbo.portfolio_categorias', N'U') IS NULL
BEGIN
    CREATE TABLE dbo.portfolio_categorias (
        categoria_id INT NOT NULL PRIMARY KEY,
        nome NVARCHAR(80) NOT NULL
    );
END;
GO
IF OBJECT_ID(N'dbo.portfolio_produtos', N'U') IS NULL
BEGIN
    CREATE TABLE dbo.portfolio_produtos (
        produto_id INT NOT NULL PRIMARY KEY,
        nome NVARCHAR(120) NOT NULL,
        categoria_id INT NOT NULL REFERENCES dbo.portfolio_categorias(categoria_id),
        preco DECIMAL(12,2) NOT NULL CHECK(preco >= 0)
    );
END;
GO
IF OBJECT_ID(N'dbo.portfolio_pedidos', N'U') IS NULL
BEGIN
    CREATE TABLE dbo.portfolio_pedidos (
        pedido_id INT NOT NULL PRIMARY KEY,
        cliente_id INT NOT NULL REFERENCES dbo.portfolio_clientes(cliente_id),
        data_pedido DATE NOT NULL,
        status NVARCHAR(30) NOT NULL,
        valor_frete DECIMAL(12,2) NOT NULL DEFAULT 0 CHECK(valor_frete >= 0)
    );
END;
GO
IF OBJECT_ID(N'dbo.portfolio_itens', N'U') IS NULL
BEGIN
    CREATE TABLE dbo.portfolio_itens (
        item_id INT NOT NULL PRIMARY KEY,
        pedido_id INT NOT NULL REFERENCES dbo.portfolio_pedidos(pedido_id),
        produto_id INT NOT NULL REFERENCES dbo.portfolio_produtos(produto_id),
        quantidade INT NOT NULL CHECK(quantidade > 0),
        preco_unitario DECIMAL(12,2) NOT NULL CHECK(preco_unitario >= 0)
    );
END;
GO
IF NOT EXISTS (SELECT 1 FROM dbo.portfolio_clientes)
BEGIN
    INSERT dbo.portfolio_clientes (cliente_id,nome,uf,data_cadastro) VALUES
    (1,N'Cliente Demonstrativo 01','SP','2024-01-10'),
    (2,N'Cliente Demonstrativo 02','RJ','2024-02-12'),
    (3,N'Cliente Demonstrativo 03','MG','2024-03-08'),
    (4,N'Cliente Demonstrativo 04','BA','2024-03-29'),
    (5,N'Cliente Demonstrativo 05','ES','2024-04-05');
END;
GO
IF NOT EXISTS (SELECT 1 FROM dbo.portfolio_categorias)
BEGIN
    INSERT dbo.portfolio_categorias (categoria_id,nome) VALUES
    (1,N'Acessórios'),(2,N'Informática'),(3,N'Escritório');
END;
GO
IF NOT EXISTS (SELECT 1 FROM dbo.portfolio_produtos)
BEGIN
    INSERT dbo.portfolio_produtos (produto_id,nome,categoria_id,preco) VALUES
    (1,N'Mouse',2,59.90),(2,N'Teclado',2,129.90),
    (3,N'Caderno',3,19.90),(4,N'Suporte',1,39.90);
END;
GO
IF NOT EXISTS (SELECT 1 FROM dbo.portfolio_pedidos)
BEGIN
    INSERT dbo.portfolio_pedidos (pedido_id,cliente_id,data_pedido,status,valor_frete) VALUES
    (101,1,'2024-05-01',N'entregue',12.00),
    (102,1,'2024-05-09',N'pendente',10.00),
    (103,2,'2024-05-12',N'entregue',15.00),
    (104,3,'2024-06-03',N'enviado',18.00),
    (105,4,'2024-06-10',N'pendente',20.00);
END;
GO
IF NOT EXISTS (SELECT 1 FROM dbo.portfolio_itens)
BEGIN
    INSERT dbo.portfolio_itens (item_id,pedido_id,produto_id,quantidade,preco_unitario) VALUES
    (1,101,1,2,59.90),(2,101,3,1,19.90),
    (3,102,2,1,129.90),(4,103,4,3,39.90),
    (5,104,1,1,59.90),(6,105,3,4,19.90),
    (7,105,2,1,129.90);
END;
GO
SELECT
    (SELECT COUNT(*) FROM dbo.portfolio_clientes) AS total_clientes,
    (SELECT COUNT(*) FROM dbo.portfolio_pedidos) AS total_pedidos,
    (SELECT COUNT(*) FROM dbo.portfolio_itens) AS total_itens;
