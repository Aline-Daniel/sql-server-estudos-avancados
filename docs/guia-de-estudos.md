# Roteiro de estudos (SQL Server)

## Ordem sugerida

1. **Banco relacional:** siga `00_preparar_ambiente.sql`, entenda PK, FK, tipos de dados e constraints.
2. **Relacionamentos:** rode `01_joins.sql` e observe os resultados de JOIN, LEFT, RIGHT e FULL.
3. **Métricas e desempenho comercial:** agregue dados em `02_ranking_vendas.sql`; compare `DENSE_RANK` e agrupamento.
4. **Calendário e prazos:** pratique `03_datas_prazos.sql` com `DATEADD`, `DATEDIFF` e conversões.
5. **Reuso de consultas:** crie a view em `04_views.sql`.
6. **Controle transacional:** estude `05_transacoes.sql`: todos os UPDATEs de exemplo são revertidos com ROLLBACK.
7. **Consultas analíticas:** subconsultas, `NOT EXISTS`, CTE em `06_subconsultas.sql`.
8. **Qualidade:** execute as verificações de `07_qualidade_dados.sql`.

## Materiais recebidos e adaptação

O ZIP original incluía cerca de **20 arquivos SQL de aula** com práticas sobre JOINs, transações, data, ranking, constraints, views e operações DML/DDL. Alguns continham instruções destrutivas e outros dependiam de tabelas e bancos externos, como AdventureWorks, DWAdventure ou um e-commerce didático. Os scripts deste portfólio foram reescritos como um conjunto consistente de **dados fictícios**.

O ZIP também incluía o banco AdventureWorksDW2019 em formato BAK, planilhas XLS antigas, PDF e um PBIX de relacionamento. Esses materiais externos não foram republicados neste pacote.

## Próximos aprimoramentos

- Executar em instância SQL Server Developer/Express e registrar screenshots de resultados.
- Adicionar planos de execução e índices a um caso com dados sintéticos maiores.
- Medir tempos de consulta e documentar tradeoffs.
