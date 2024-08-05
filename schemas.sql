create table Company(
company_code varchar(20),
founder varchar(20)
);
INSERT INTO Company (company_code, founder) VALUES
('C93', 'Jesse'),
('C46', 'Lori'),
('C98', 'Christine'),
('C9', 'Joe'),
('C63', 'Dorothy'),
('C49', 'John'),
('C44', 'Lawrence'),
('C76', 'Marilyn'),
('C35', 'Donna'),
('C26', 'Paul');
--Lead_Manager 
create table Lead_Manager(
lead_manager_code varchar(20),
company_code varchar(20)
);
INSERT INTO Lead_Manager (lead_manager_code, company_code) VALUES
('LM76', 'C76'),
('LM74', 'C74'),
('LM10', 'C10'),
('LM78', 'C78'),
('LM55', 'C55'),
('LM6', 'C6'),
('LM34', 'C34'),
('LM46', 'C46'),
('LM3', 'C3'),
('LM15', 'C15');
--Senior_Manager
create table Senior_Manager(
senior_manager_code varchar(20),
lead_manager_code varchar(20),
company_code varchar(20)
);
INSERT INTO Senior_Manager (senior_manager_code, lead_manager_code, company_code) VALUES
('SM115', 'LM78', 'C78'),
('SM77', 'LM54', 'C54'),
('SM63', 'LM44', 'C44'),
('SM82', 'LM58', 'C58'),
('SM60', 'LM42', 'C42'),
('SM19', 'LM14', 'C14'),
('SM21', 'LM16', 'C16'),
('SM110', 'LM76', 'C76'),
('SM4', 'LM3', 'C3'),
('SM47', 'LM34', 'C34');
--Manager
create table Manager(
manager_code varchar(20),
senior_manager_code varchar(20),
lead_manager_code varchar(20),
company_code varchar(20)
);
INSERT INTO Manager (manager_code, senior_manager_code, lead_manager_code, company_code) VALUES
('M152', 'SM73', 'LM51', 'C51'),
('M4', 'SM2', 'LM1', 'C1'),
('M223', 'SM112', 'LM77', 'C77'),
('M76', 'SM38', 'LM29', 'C29'),
('M17', 'SM12', 'LM9', 'C9'),
('M236', 'SM118', 'LM81', 'C81'),
('M246', 'SM124', 'LM85', 'C85'),
('M23', 'SM15', 'LM12', 'C12'),
('M202', 'SM101', 'LM70', 'C70'),
('M13', 'SM9', 'LM6', 'C6');
--Employee
create table Employe(
employee_code varchar(20),
manager_code varchar(20),
senior_manager_code varchar(20),
lead_manager_code varchar(20),
company_code varchar(20)
);
INSERT INTO Employe (employee_code, manager_code, senior_manager_code, lead_manager_code, company_code) VALUES
('E85', 'M36', 'SM19', 'LM14', 'C14'),
('E560', 'M277', 'SM141', 'LM98', 'C98'),
('E274', 'M131', 'SM63', 'LM44', 'C44'),
('E277', 'M133', 'SM64', 'LM45', 'C45'),
('E145', 'M68', 'SM35', 'LM27', 'C27'),
('E68', 'M29', 'SM17', 'LM13', 'C13'),
('E558', 'M277', 'SM141', 'LM98', 'C98'),
('E536', 'M265', 'SM135', 'LM93', 'C93'),
('E381', 'M187', 'SM93', 'LM65', 'C65'),
('E531', 'M262', 'SM133', 'LM91', 'C91');
/*Given the table schemas above,
write a query to print the
company_code, founder name, total number of lead managers,
total number of senior managers, total number of managers, 
and total number of employees. Order your output by ascending company_code.*/
--query 
select 
Company.company_code,
Company.founder,
 count(Lead_Manager.lead_manager_code)
,count(Senior_Manager.senior_manager_code)
,COUNT(Manager.manager_code)
,COUNT(Employe.employee_code)
from Company
left join Lead_Manager on Company.company_code=Lead_Manager.company_code 
left join Senior_Manager on Company.company_code=Senior_Manager.company_code
left join Manager on Company.company_code=Manager.company_code
left join Employe on Company.company_code=Employe.company_code
group by Company.company_code,
Company.founder
order by company_code;
