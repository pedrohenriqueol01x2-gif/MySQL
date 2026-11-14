# Fórmula 1 — Banco de Dados

Exercício de banco de dados relacional envolvendo países, equipes, pilotos, corridas e participações. Inclui inserção de registros e consultas com filtros, `JOIN`, médias salariais e ordenação.

## Estrutura

**Banco:** `db_formula_1`

**Tabelas (5):** `tb_paises`, `tb_equipes`, `tb_pilotos`, `tb_corridas` e `tb_participante`.

## Arquivo

- [`sql/formula_1.sql`](./sql/formula_1.sql): script completo, preservado sem alterações.

## Pontos de revisão antes de executar

- A consulta da média salarial da Alemanha usa `cod_país`, mas o nome correto da coluna é `cod_pais`, o que provoca erro nessa consulta.
- A tabela `tb_participante` define `num_piloto` como `AUTO_INCREMENT`, embora a coluna seja chave estrangeira para o identificador já existente em `tb_pilotos`; convém revisar esse desenho.
- Nas consultas das médias salariais, os rótulos de França e Itália estão trocados em relação aos códigos de países inseridos.
- A consulta final pede valores distintos de salários, mas lista nomes e salários sem `DISTINCT`.
- Não houve execução nem validação integral em MySQL nesta revisão.
