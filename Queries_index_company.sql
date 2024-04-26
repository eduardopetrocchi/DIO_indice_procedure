use company;

-- Qual o departamento com maior número de pessoas? 
select dno, dname, count(*) as quantity
from employee, departament
where dno = dnumber
GROUP BY dno
LIMIT 1;

-- Quais são os departamentos por cidade? 
select Dlocation as City, count(*) quantity
from dept_locations
GROUP BY Dlocation;

-- Relação de empregrados por departamento 
select dno, dname, count(*) as quantity
from employee, departament
where dno = dnumber
GROUP BY dno;

-- Criação de indice
-- Motivo: A coluna 'dno' é bastante usada em consultas com a tabela department
create index index_dno on employee(dno);
