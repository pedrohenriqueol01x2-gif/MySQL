# Loja Somy — Banco de Dados

Projeto de banco de dados para uma loja de produtos de videogame, com cadastro de consoles, jogos e acessórios, clientes, funcionários, fornecedores, vendas, despesas, receitas e reposição de estoque.

## Estrutura

**Banco:** `db_loja_somy`

**Tabelas (12):** `tb_cargos`, `tb_funcionario`, `tb_fornecedor`, `tb_despesas`, `tb_produtos`, `tb_acessorios`, `tb_console`, `tb_jogos`, `tb_reposicao`, `tb_cliente`, `tb_vendas` e `tb_receita`.

**Recursos:** chaves primárias e estrangeiras, registros de demonstração, consultas com junções e agregações, trigger `trg_verificar_estoque` e procedure `sp_estoque_baixo`.

## Arquivo

- [`sql/loja_somy.sql`](./sql/loja_somy.sql): script completo, preservado sem alterações.

## Como estudar/executar

O script cria o banco e as tabelas, carrega dados, faz alterações e consultas e define uma trigger e uma procedure. Para reexecutá-lo, utilize um banco de testes e considere que `CREATE DATABASE`, inserções e criação de objetos podem falhar caso já existam.

### Pontos de revisão

- O script contém registros com **nomes, CPFs, telefones, e-mails e endereços**. Confirme que são inteiramente fictícios ou autorizados antes de uma publicação pública.
- Após redefinir o estoque de alguns produtos para zero, o script tenta inserir uma venda de um desses produtos após criar uma trigger de validação de estoque. **Essa inserção tende a falhar por design**, demonstrando a regra de proteção.
- Não houve execução nem validação integral em MySQL nesta revisão.
