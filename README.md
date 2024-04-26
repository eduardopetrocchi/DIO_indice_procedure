# Banco de Dados E-Commerce 

Este repositório contém scripts SQL para um sistema de e-commerce em estágio inicial. Os scripts foram desenvolvidos para criar e popular as tabelas do banco de dados e realizar operações básicas de consulta e manipulação de dados.

## Procedimentos Armazenados

### Procedimento `add_customer`

Este procedimento armazenado é responsável por adicionar um novo cliente à tabela `customer`.

Parâmetros:
- `fname`: Nome do cliente (VARCHAR)
- `Lname`: Sobrenome do cliente (VARCHAR)
- `Adrress`: Endereço do cliente (VARCHAR)
- `gender`: Gênero do cliente ('M' para masculino, 'H' para feminino) (CHAR)
- `bdate`: Data de nascimento do cliente (DATE)

### Procedimento `add_product`

Este procedimento armazenado é responsável por adicionar um novo produto à tabela `product`.

Parâmetros:
- `Pname`: Nome do produto (VARCHAR)
- `Category`: Categoria do produto ('Eletrônico', 'Vestuário', 'Alimentos', 'Brinquedos', 'Livros') (ENUM)
- `Review`: Avaliação do produto (FLOAT)
- `Pdescription`: Descrição do produto (VARCHAR)
- `Price`: Preço do produto (FLOAT)

## Funcionalidades

- Inserção de clientes e produtos
- Consultas relacionadas a clientes, produtos e pagamentos
- Cálculo de média de idade dos clientes por sexo
- Cálculo de média de preço por categoria de produto
- Criação de índices para otimização de consultas

# Banco de Dados Company

Os arquivos "Procedure_company" e "Queries_index_company" contêm scripts SQL para o banco de dados da empresa, utilizado para gerenciar informações sobre funcionários e departamentos.

## Estrutura do Banco de Dados

O banco de dados é composto pelas seguintes tabelas:

* **employee**: Armazena informações sobre os funcionários, incluindo:
    * `dno`: Número do departamento (chave estrangeira para a tabela `department`)
    * `dname` (somente leitura): Nome do departamento (`department`)
    * `Fname`: Primeiro nome
    * `Minit`: Inicial do meio
    * `Lname`: Sobrenome
    * `Ssn`: Número do seguro social (chave primária)
    * `Bdate`: Data de nascimento
    * `Address`: Endereço
    * `Sex`: Sexo (M ou H)
    * `Salary`: Salário
    * `Super_ssn`: Número do seguro social do supervisor (chave estrangeira para a tabela `employee`)
* **department**: Armazena informações sobre os departamentos
    * `dnumber`: Número do departamento (chave primária)
    * `dname`: Nome do departamento
* **dept_locations**: Armazena informações sobre a localização dos departamentos
    * `Dlocation`: Cidade da localização do departamento (chave estrangeira para a tabela `location`)

## Índices

Índices foram criados para otimizar consultas:

- `index_dno` na coluna `dno` da tabela `employee`

## Exemplos de Consulta

- **Departamento com maior número de funcionários:**

```sql
SELECT dno, dname, COUNT(*) AS quantity
FROM employee, department
WHERE dno = dnumber
GROUP BY dno
LIMIT 1;
```

- **Departamentos por cidade:**

```sql
SELECT Dlocation AS City, COUNT(*) AS quantity
FROM dept_locations
GROUP BY Dlocation;
```

- **Relação de empregados por departamento:**

```sql
SELECT dno, dname, COUNT(*) AS quantity
FROM employee, department
WHERE dno = dnumber
GROUP BY dno;
```

## Autores

- [@eduardopetrocchi](https://www.github.com/eduardopetrocchi)

