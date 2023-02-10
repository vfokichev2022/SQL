-- �� �� SQL_Joins
-- SQL HomeWork 2. Joins

-- ���� ��� ������-�� ����� ���� ������� �������������� �������, ��������� � �������, �� ������� )

--  1. ������� ���� ���������� ��� �������� ���� � ����, ������ � ����������.

-- ������� 1
select employees.employee_name, salary.monthly_salary from employee_salary, employees, salary
	where employee_salary.employee_id = employees.id and employee_salary.salary_id = salary.id;

-- ������� 2
select e.employee_name, s.monthly_salary from employee_salary es
	join employees e on es.employee_id = e.id 
	join salary s on es.salary_id = s.id;

--  2. ������� ���� ���������� � ������� �� ������ 2000.

-- ������� 1
select employees.employee_name, salary.monthly_salary from employee_salary, employees, salary
	where employee_salary.employee_id = employees.id and employee_salary.salary_id = salary.id and salary.monthly_salary < 2000;

-- ������� 2
select e.employee_name, s.monthly_salary from employee_salary es
	join employees e on es.employee_id = e.id 
	join salary s on es.salary_id = s.id 
	where s.monthly_salary < 2000;

--  3. ������� ��� ���������� �������, �� �������� �� ��� �� ��������. (�� ����, �� �� ������� ��� � ��������.)

select * from employee_salary es
	join salary s on es.salary_id = s.id
	where es.employee_id not in (select e.id from employees e);

--  4. ������� ��� ���������� �������  ������ 2000 �� �������� �� ��� �� ��������. (�� ����, �� �� ������� ��� � ��������.)

select * from employee_salary es
	join salary s on es.salary_id = s.id
	where es.employee_id not in (select e.id from employees e)
		and s.monthly_salary < 2000;

--  5. ����� ���� ���������� ���� �� ��������� ��.

select e.employee_name  from employee_salary es 
	right join employees e on es.employee_id = e.id
	where es.id is null;
	
--  6. ������� ���� ���������� � ���������� �� ���������.

select e.employee_name, r.role_name from roles_employee re 
	join roles r on re.role_id = r.id 
	join employees e on re.employee_id = e.id;

--  7. ������� ����� � ��������� ������ Java �������������.

select e.employee_name, r.role_name from roles_employee re 
	join roles r on re.role_id = r.id 
	join employees e on re.employee_id = e.id
	where r.role_name like '% Java developer';

--  8. ������� ����� � ��������� ������ Python �������������.

select e.employee_name, r.role_name from roles_employee re 
	join roles r on re.role_id = r.id 
	join employees e on re.employee_id = e.id
	where r.role_name like '% Python developer';

--  9. ������� ����� � ��������� ���� QA ���������.

select e.employee_name, r.role_name from roles_employee re 
	join roles r on re.role_id = r.id 
	join employees e on re.employee_id = e.id
	where r.role_name like '% QA engineer';

--  10. ������� ����� � ��������� ������ QA ���������.

select e.employee_name, r.role_name from roles_employee re 
	join roles r on re.role_id = r.id 
	join employees e on re.employee_id = e.id
	where r.role_name like '% Manual QA engineer';

--  11. ������� ����� � ��������� ��������������� QA

select e.employee_name, r.role_name from roles_employee re 
	join roles r on re.role_id = r.id 
	join employees e on re.employee_id = e.id
	where r.role_name like '%Automation QA engineer';

--  12. ������� ����� � �������� Junior ������������

select e.employee_name, s.monthly_salary, r.role_name from roles_employee re 
	join roles r on re.role_id = r.id 
	join employees e on re.employee_id = e.id
	join employee_salary es on es.employee_id = e.id 
	join salary s on es.salary_id = s.id 
	where r.role_name like 'Junior %';

--  13. ������� ����� � �������� Middle ������������

select e.employee_name, s.monthly_salary, r.role_name from roles_employee re 
	join roles r on re.role_id = r.id 
	join employees e on re.employee_id = e.id
	join employee_salary es on es.employee_id = e.id 
	join salary s on es.salary_id = s.id 
	where r.role_name like 'Middle %';

--  14. ������� ����� � �������� Senior ������������

select e.employee_name, s.monthly_salary, r.role_name from roles_employee re 
	join roles r on re.role_id = r.id 
	join employees e on re.employee_id = e.id
	join employee_salary es on es.employee_id = e.id 
	join salary s on es.salary_id = s.id 
	where r.role_name like 'Senior %';

--  15. ������� �������� Java �������������
select s.monthly_salary, r.role_name from roles_employee re 
	join roles r on re.role_id = r.id 
	join employees e on re.employee_id = e.id
	join employee_salary es on es.employee_id = e.id 
	join salary s on es.salary_id = s.id 
	where r.role_name like '% Java developer';

--  16. ������� �������� Python �������������

select s.monthly_salary, r.role_name from roles_employee re 
	join roles r on re.role_id = r.id 
	join employees e on re.employee_id = e.id
	join employee_salary es on es.employee_id = e.id 
	join salary s on es.salary_id = s.id 
	where r.role_name like '% Python developer';

--  17. ������� ����� � �������� Junior Python �������������

select e.employee_name, s.monthly_salary, r.role_name from roles_employee re 
	join roles r on re.role_id = r.id 
	join employees e on re.employee_id = e.id
	join employee_salary es on es.employee_id = e.id 
	join salary s on es.salary_id = s.id 
	where r.role_name like 'Junior Python developer';

--  18. ������� ����� � �������� Middle JS �������������

select e.employee_name, s.monthly_salary, r.role_name from roles_employee re 
	join roles r on re.role_id = r.id 
	join employees e on re.employee_id = e.id
	join employee_salary es on es.employee_id = e.id 
	join salary s on es.salary_id = s.id 
	where r.role_name like 'Middle JavaScript %';

--  19. ������� ����� � �������� Senior Java �������������

select e.employee_name, s.monthly_salary, r.role_name from roles_employee re 
	join roles r on re.role_id = r.id 
	join employees e on re.employee_id = e.id
	join employee_salary es on es.employee_id = e.id 
	join salary s on es.salary_id = s.id 
	where r.role_name like 'Senior Java %';

--  20. ������� �������� Junior QA ���������

select s.monthly_salary, r.role_name from roles_employee re 
	join roles r on re.role_id = r.id 
	join employees e on re.employee_id = e.id
	join employee_salary es on es.employee_id = e.id 
	join salary s on es.salary_id = s.id 
	where r.role_name like 'Junior % QA engineer';

--  21. ������� ������� �������� ���� Junior ������������

select avg(s.monthly_salary) from roles_employee re 
	join roles r on re.role_id = r.id 
	join employees e on re.employee_id = e.id
	join employee_salary es on es.employee_id = e.id 
	join salary s on es.salary_id = s.id 
	where r.role_name like 'Junior %';

--  22. ������� ����� ������� JS �������������

-- limit �� ������������ ����� ��� sum
select sum(s.monthly_salary) from roles_employee re 
	join roles r on re.role_id = r.id 
	join employees e on re.employee_id = e.id
	join employee_salary es on es.employee_id = e.id 
	join salary s on es.salary_id = s.id
	where r.role_name like '% developer'
	limit 1;

--  23. ������� ����������� �� QA ���������

select min(s.monthly_salary) from roles_employee re 
	join roles r on re.role_id = r.id 
	join employees e on re.employee_id = e.id
	join employee_salary es on es.employee_id = e.id 
	join salary s on es.salary_id = s.id 
	where r.role_name like '% QA engineer';

--  24. ������� ������������ �� QA ���������

select max(s.monthly_salary) from roles_employee re 
	join roles r on re.role_id = r.id 
	join employees e on re.employee_id = e.id
	join employee_salary es on es.employee_id = e.id 
	join salary s on es.salary_id = s.id 
	where r.role_name like '% QA engineer';

--  25. ������� ���������� QA ���������

select count(*) from roles_employee re 
	join roles r on re.role_id = r.id 
	join employees e on re.employee_id = e.id
	where r.role_name like '% QA engineer';

--  26. ������� ���������� Middle ������������.

select count(*) from roles_employee re 
	join roles r on re.role_id = r.id 
	join employees e on re.employee_id = e.id
	where r.role_name like 'Middle %';

--  27. ������� ���������� �������������

select count(*) from roles_employee re 
	join roles r on re.role_id = r.id 
	join employees e on re.employee_id = e.id
	where r.role_name like '% developer';

--  28. ������� ���� (�����) �������� �������������.

select sum(s.monthly_salary) from roles_employee re 
	join roles r on re.role_id = r.id 
	join employees e on re.employee_id = e.id
	join employee_salary es on es.employee_id = e.id 
	join salary s on es.salary_id = s.id
	where r.role_name like '% developer';

--  29. ������� �����, ��������� � �� ���� ������������ �� �����������

-- �� ����������� ����? ��������, �� �����
select e.employee_name, r.role_name, s.monthly_salary from roles_employee re 
	join roles r on re.role_id = r.id 
	join employees e on re.employee_id = e.id
	join employee_salary es on es.employee_id = e.id 
	join salary s on es.salary_id = s.id
	order by e.employee_name;

--  30. ������� �����, ��������� � �� ���� ������������ �� ����������� � ������������ � ������� �� �� 1700 �� 2300

select e.employee_name, r.role_name, s.monthly_salary from roles_employee re 
	join roles r on re.role_id = r.id 
	join employees e on re.employee_id = e.id
	join employee_salary es on es.employee_id = e.id 
	join salary s on es.salary_id = s.id
	where s.monthly_salary >= 1700 and s.monthly_salary <= 2300
	order by e.employee_name;
	
--  31. ������� �����, ��������� � �� ���� ������������ �� ����������� � ������������ � ������� �� ������ 2300

select e.employee_name, r.role_name, s.monthly_salary from roles_employee re 
	join roles r on re.role_id = r.id 
	join employees e on re.employee_id = e.id
	join employee_salary es on es.employee_id = e.id 
	join salary s on es.salary_id = s.id
	where s.monthly_salary < 2300
	order by e.employee_name;

--  32. ������� �����, ��������� � �� ���� ������������ �� ����������� � ������������ � ������� �� ����� 1100, 1500, 2000

select e.employee_name, r.role_name, s.monthly_salary from roles_employee re 
	join roles r on re.role_id = r.id 
	join employees e on re.employee_id = e.id
	join employee_salary es on es.employee_id = e.id 
	join salary s on es.salary_id = s.id
	where s.monthly_salary in (1100, 1500, 2000)
	order by e.employee_name;
