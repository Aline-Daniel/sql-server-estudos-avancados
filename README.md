# SQL Server | Consultas e Análise de Dados

![SQL Server](https://img.shields.io/badge/SQL%20Server-T--SQL-cc2927?style=flat-square) ![Projeto](https://img.shields.io/badge/Portf%C3%B3lio-Estudos-2563eb?style=flat-square)

Portfólio prático de **SQL Server / T-SQL**, cobrindo modelagem relacional, consultas multitabulares, análise de vendas, ranking, datas e transações. Os scripts deste repositório foram **reescritos em um exemplo demonstrativo autocontido**, para que sejam legíveis e possam ser utilizados sem depender de bases de clientes reais ou do backup de aulas.

## Conteúdos

| Arquivo | Tema | O que demonstra |
|---|---|---|
| `sql/00_preparar_ambiente.sql` | Modelagem | Tabelas, PK, FK, relacionamentos e dados fictícios |
| `sql/01_joins.sql` | JOIN | INNER, LEFT, RIGHT e FULL OUTER JOIN |
| `sql/02_ranking_vendas.sql` | Análise | `GROUP BY`, `SUM`, `DENSE_RANK`, subconsulta |
| `sql/03_datas_prazos.sql` | Datas | `DATEADD`, `DATEDIFF`, `CONVERT`, previsão de entrega |
| `sql/04_views.sql` | View | `CREATE OR ALTER VIEW`, resumo de pedidos |
| `sql/05_transacoes.sql` | Transações | `BEGIN TRAN`, `UPDATE` com `WHERE`, `ROLLBACK` |
| `sql/06_subconsultas.sql` | Analytics | CTE, subconsultas e clientes sem pedidos |
| `sql/07_qualidade_dados.sql` | Qualidade | Consistência de valores, duplicidade, chaves e nulos |

## Como executar no SQL Server

1. Instale **SQL Server Developer ou Express** e **SQL Server Management Studio (SSMS)**, ou conecte-se a uma instância de testes autorizada.
2. Crie um **banco de testes vazio**, por exemplo `PortfolioSQL`, e selecione esse banco no SSMS.
3. Execute `sql/00_preparar_ambiente.sql` primeiro.
4. Execute os outros scripts separadamente, na ordem desejada. São exemplos de estudo, não uma rotina automatizada de produção.

O script inicial cria apenas tabelas com prefixo `portfolio_`, caso ainda não existam, e popula registros **fictícios** somente se estiverem vazias. Os exemplos usam **T-SQL para SQL Server** e não devem ser executados diretamente em MySQL ou PostgreSQL.

## Modelo relacional

```text
portfolio_clientes (cliente_id) ───┐
                                  ├── portfolio_pedidos (pedido_id) ── portfolio_itens (item_id)
portfolio_categorias ── portfolio_produtos (produto_id) ────────────────────────┘
```

As tabelas incluem chaves primárias e estrangeiras e um conjunto pequeno de clientes, produtos, pedidos e itens inventados para aprendizado.

## Segurança e limites

- **Não execute em banco de produção.** Todos os exemplos pressupõem um ambiente de testes, com cópia de segurança quando aplicável.
- Os exemplos de transação fazem `ROLLBACK` e não deixam alterações persistidas.
- Não foram incluídos os scripts brutos do material recebido, que tinham trechos destrutivos (`DROP`, `TRUNCATE`, `DELETE` sem `WHERE`) e referências a bancos indisponíveis.
- O backup `AdventureWorksDW2019.bak` (~97 MiB) e planilhas legadas de e-commerce também não estão incluídos: são dados externos de tamanho elevado e sua redistribuição depende da origem e das permissões de uso.
- **Validação:** scripts revisados estruturalmente; não foi executado teste real contra uma instância SQL Server neste ambiente.

## Origem e autoria

Organização temática inspirada em exercícios e arquivos de estudo fornecidos pela titular do portfólio. Os exemplos em `sql/` foram reescritos com **dados fictícios**, para demonstrar as técnicas sem copiar bases privadas. Ver `docs/guia-de-estudos.md`.
