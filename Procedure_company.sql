use company;

DELIMITER //
CREATE PROCEDURE manipulate_employee(
    IN action INT, 
    IN Fname_p VARCHAR(15), 
    IN Minit_p CHAR(1),
    IN Lname_p VARCHAR(15), 
    IN Ssn_p CHAR(9), 
    IN Bdate_p DATE, 
    IN Address_p VARCHAR(30), 
    IN Sex_p CHAR(1), 
    IN Salary_p DECIMAL(10,2), 
    IN Super_ssn_p CHAR(9), 
    IN Dno_p INT
)
BEGIN
    IF action = 1 THEN
        SELECT * FROM employee;
    ELSEIF action = 2 THEN
        UPDATE employee 
        SET 
            Fname = Fname_p,
            Minit = Minit_p,
            Lname = Lname_p,
            Bdate = Bdate_p,
            Address = Address_p,
            Sex = Sex_p,
            Salary = Salary_p,
            Super_ssn = Super_ssn_p,
            Dno = Dno_p
        WHERE Ssn = Ssn_p;
        SELECT "atualização ok" AS message;
    ELSEIF action = 3 THEN
        DELETE FROM employee WHERE Ssn = Ssn_p;
        SELECT "remoção ok" AS message;
    ELSE
        SELECT "opção inválida" AS message;
    END IF;
END //
DELIMITER ;

CALL manipulate_employee(1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL); 
CALL manipulate_employee(2, 'Carlos', 'J', 'Cesar', '368087132', '1972-01-22', '234-Pine-Denver-CO', 'M', '34000.00', '111234567', 4); 
CALL manipulate_employee(3, NULL, NULL, NULL, '368087132', NULL, NULL, NULL, NULL, NULL, NULL); 


