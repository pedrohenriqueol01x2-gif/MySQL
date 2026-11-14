# Projetos de Banco de Dados — MySQL

Repositório de projetos acadêmicos desenvolvidos para praticar modelagem relacional, SQL e manipulação de dados com MySQL.

## Projetos

| Projeto | Banco de dados | Conteúdo |
| --- | --- | --- |
| [Loja Somy](./loja-somy/) | `db_loja_somy` | Sistema de loja de videogames, com 12 tabelas, inserções, consultas SQL, trigger e procedure |
| [Fórmula 1](./formula-1/) | `db_formula_1` | Sistema de países, equipes, pilotos, corridas e participações, com 5 tabelas e exercícios de SQL |

## Tecnologias e conceitos

- MySQL e SQL
- Criação de tabelas e relacionamentos com `PRIMARY KEY` e `FOREIGN KEY`
- Inserção e atualização de registros com `INSERT` e `UPDATE`
- Consultas com `SELECT`, `WHERE`, `JOIN`, `GROUP BY` e funções de agregação
- `TRIGGER` e `PROCEDURE` (Loja Somy)

## Como executar

1. Instale um servidor MySQL e utilize o MySQL Workbench ou outro cliente compatível.
2. Abra o script `.sql` da pasta do projeto escolhido.
3. Confira se já existe um banco com o mesmo nome, porque o script cria o banco de dados.
4. Execute o script em um ambiente de testes, seguindo as observações de cada projeto.

> **Atenção:** os arquivos foram preservados como enviados. A execução integral **não foi validada** em um servidor MySQL. Consulte as notas de revisão em cada pasta antes de executá-los.

> **Privacidade:** o arquivo da Loja Somy contém registros com nomes, CPFs, telefones, e-mails e endereços. Confirme que são todos dados fictícios/autorizados antes de tornar este repositório público.
