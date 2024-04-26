USE ecommercerascunho;

DELIMITER $$

CREATE PROCEDURE add_customer(
    IN fname VARCHAR(10),
    IN Lname VARCHAR(10),
    IN Adrress VARCHAR(45),
    IN gender CHAR(1),
    IN bdate DATE
)
BEGIN
    INSERT INTO customer (fname, Lname, Adrress, gender, bdate) VALUES (fname, Lname, Adrress, gender, bdate);
    
    SELECT * FROM customer;
    SELECT "Inserção bem sucedida" AS message;
END $$

DELIMITER $$

CALL add_customer("Alberto", "Costa", "123-Endereço-Cidade", "H", "1972-04-26");

DELIMITER //

CREATE PROCEDURE add_product(
    IN Pname VARCHAR(45),
    IN Category ENUM('Eletrônico', 'Vestuário', 'Alimentos', 'Brinquedos', 'Livros'),
    IN Review FLOAT,
    IN Pdescription VARCHAR(45),
    IN Price FLOAT(2)
)
BEGIN
    INSERT INTO product (Pname, Category, Review, Pdescription, Price) VALUES (Pname, Category, Review, Pdescription, Price);
    
    SELECT * FROM product;
    SELECT "Inserção bem sucedida" AS message;
END //

DELIMITER //

CALL add_product("Xbox", "Eletrônico", 4.5, "Video-game", 1599.99);
