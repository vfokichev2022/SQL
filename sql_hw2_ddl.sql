-- SQL_DDL
-- ������ �����.

-- ������� employees

--     1) ������� ������� employees
-- - id. serial,  primary key,
-- - employee_name. Varchar(50), not null

create table employees(
	id serial primary key,
	employee_name varchar(50) not null
);

--     2) ��������� ������� employee 70 ��������.

insert into employees(employee_name)
values
('������'),
('�������'),
('��������'),
('�����'),
('��������'),
('������'),
('�������'),
('��������'),
('�������'),
('�������'),
('�������'),
('������'),
('��������'),
('�������'),
('�������'),
('������'),
('������'),
('������'),
('��������'),
('��������'),
('�����'),
('�������'),
('�������'),
('�������'),
('�������'),
('������'),
('��������'),
('�������'),
('�������'),
('���������'),
('�������'),
('��������'),
('�������'),
('�������'),
('������'),
('�����������'),
('��������'),
('�������'),
('�����'),
('�������'),
('�����'),
('��������'),
('�������'),
('�������'),
('����������'),
('�������'),
('�����'),
('��������'),
('�������'),
('�������'),
('�����'),
('�������'),
('��������'),
('�������'),
('�������'),
('������'),
('���������'),
('��������'),
('������'),
('�������'),
('�������'),
('�����'),
('������'),
('�������'),
('������'),
('�������'),
('������'),
('������'),
('���������'),
('�������');

-- ������� salary

--     3) ������� ������� salary
-- - id. Serial  primary key,
-- - monthly_salary. Int, not null

create table salary(
	id serial primary key,
	monthly_salary int not null
);

--     4) ��������� ������� salary 15 ��������:
-- (� ������� ��������� 16 ����� �� ����������)

insert into salary(monthly_salary)
values
('1000'),
('1100'),
('1200'),
('1300'),
('1400'),
('1500'),
('1600'),
('1700'),
('1800'),
('1900'),
('2000'),
('2100'),
('2200'),
('2300'),
('2400'),
('2500');

-- ������� employee_salary

--     5) ������� ������� employee_salary
-- - id. Serial  primary key,
-- - employee_id. Int, not null, unique
-- - salary_id. Int, not null

create table employee_salary(
	id serial primary key,
	employee_id int not null unique,
	salary_id int not null
);

--     6) ��������� ������� employee_salary 40 ��������:
-- - � 10 ����� �� 40 �������� �������������� employee_id

insert into employee_salary(employee_id, salary_id)
values
(1, 1),
(3, 2),
(5, 3),
(7, 4),
(9, 5),
(11, 6),
(13, 7),
(15, 8),
(17, 9),
(21, 10),
(23, 11),
(25, 12),
(27, 13),
(30, 14),
(31, 15),
(132, 1),
(133, 2),
(134, 3),
(135, 4),
(136, 5),
(137, 6),
(138, 7),
(139, 8),
(140, 9),
(150, 10),
(51, 15),
(52, 14),
(53, 13),
(54, 12),
(55, 11),
(56, 10),
(61, 9),
(62, 8),
(63, 7),
(64, 6),
(65, 5),
(66, 4),
(67, 3),
(68, 2),
(69, 1);

-- ������� roles

--     7) ������� ������� roles
-- - id. Serial  primary key,
-- - role_name. int, not null, unique

create table roles(
	id serial primary key,
	role_name int not null unique
);

--     8) �������� ��� ������ role_name � int �� varchar(30)

alter table roles
alter column role_name type varchar(30);

--     9) ��������� ������� roles 20 ��������:

insert into roles(role_name)
values
('Junior Python developer'),
('Middle Python developer'),
('Senior Python developer'),
('Junior Java developer'),
('Middle Java developer'),
('Senior Java developer'),
('Junior JavaScript developer'),
('Middle JavaScript developer'),
('Senior JavaScript developer'),
('Junior Manual QA engineer'),
('Middle Manual QA engineer'),
('Senior Manual QA engineer'),
('Project Manager'),
('Designer'),
('HR'),
('CEO'),
('Sales manager'),
('Junior Automation QA engineer'),
('Middle Automation QA engineer'),
('Senior Automation QA engineer');

-- ������� roles_employee

--     10) ������� ������� roles_employee
-- - id. Serial  primary key,
-- - employee_id. Int, not null, unique (������� ���� ��� ������� employees, ���� id)
-- - role_id. Int, not null (������� ���� ��� ������� roles, ���� id)

create table roles_employee(
	id serial primary key,
	employee_id int not null unique references employees(id),
	role_id int not null references roles(id)
);

--     11) ��������� ������� roles_employee 40 ��������:

insert into roles_employee(employee_id, role_id)
values
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10),
(11, 11),
(12, 12),
(13, 13),
(14, 14),
(15, 15),
(16, 16),
(17, 17),
(18, 18),
(19, 19),
(20, 20),
(22, 1),
(24, 2),
(26, 3),
(32, 4),
(34, 5),
(36, 6),
(42, 7),
(44, 8),
(46, 9),
(51, 10),
(52, 11),
(53, 12),
(54, 13),
(55, 14),
(61, 15),
(62, 16),
(63, 17),
(64, 18),
(65, 19),
(70, 20);

