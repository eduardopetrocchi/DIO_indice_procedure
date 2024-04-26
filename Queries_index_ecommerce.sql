USE ecommercerascunho;

-- Adiciona colunas gender e bdate na tabela customer
ALTER TABLE customer ADD COLUMN gender CHAR(1);
ALTER TABLE customer ADD COLUMN bdate DATE;

-- Atualiza os valores de gender para 'M' e 'H' conforme o nome
UPDATE customer
SET gender = 'M'
WHERE fname IN ('Amanda', 'Elizabeth', 'Emily', 'Isabella', 'Jane', 'Jennifer', 'Jessica', 'Olivia', 'Samantha', 'Sarah');

UPDATE customer
SET gender = 'H'
WHERE fname IN ('Christopher', 'Daniel', 'David', 'Ethan', 'James', 'John', 'Matthew', 'Michael', 'Ryan', 'William');

-- Atualiza os valores de bdate para datas aleatórias entre '1960-01-01' e '2004-12-31'
UPDATE customer
SET bdate = DATE_FORMAT(FROM_UNIXTIME(UNIX_TIMESTAMP('1960-01-01') + RAND() * (UNIX_TIMESTAMP('2004-12-31') - UNIX_TIMESTAMP('1960-01-01'))), '%Y-%m-%d')
WHERE fname IN ('Amanda', 'Christopher', 'Daniel', 'David', 'Elizabeth', 'Emily', 'Ethan', 'Isabella', 'James', 'Jane', 'Jennifer', 'Jessica', 'John', 'Matthew', 'Michael', 'Olivia', 'Ryan', 'Samantha', 'Sarah', 'William');

-- Exibe todos os registros da tabela customer
SELECT * FROM customer;

-- Quantidade de clientes por sexo
SELECT gender, COUNT(*) FROM customer GROUP BY gender;

-- Informações sobre idade dos clientes
SELECT fname, gender, bdate, TIMESTAMPDIFF(YEAR, bdate, CURDATE()) AS idade FROM customer ORDER BY idade, gender;

-- Média de idade dos clientes por sexo
SELECT gender, ROUND(AVG(TIMESTAMPDIFF(YEAR, bdate, CURDATE())), 0) AS idade FROM customer GROUP BY gender;

-- Exibe todos os registros da tabela payment
SELECT * FROM payment;

-- Quantidade de tipos de pagamento
SELECT typepayment, COUNT(*) FROM payment GROUP BY TypePayment;

-- Tipos de pagamento por sexo
SELECT c.gender, p.TypePayment, COUNT(*) AS total FROM Payment p JOIN Customer c ON p.idCustomer = c.idCustomer GROUP BY c.gender, p.TypePayment ORDER BY c.gender, p.TypePayment;

-- Exibe todos os registros da tabela product
SELECT * FROM product;

-- Média dos preços por categoria de produto
SELECT category, ROUND(AVG(price), 2) AS media_preco FROM product GROUP BY category;

-- Criação de índices
ALTER TABLE product ADD INDEX index_category(category);
CREATE INDEX index_sales_order_client ON salesOrder (idOrderClient);
CREATE INDEX index_delivery_sales_order ON Delivery (idSalesOrder);
