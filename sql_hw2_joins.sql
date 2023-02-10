-- ДЗ по SQL_Joins
-- SQL HomeWork 2. Joins

-- Если для какого-то кейса надо сделать дополнительную таблицу, наполнить её данными, то делайте )

--  1. Вывести всех работников чьи зарплаты есть в базе, вместе с зарплатами.

-- вариант 1
select employees.employee_name, salary.monthly_salary from employee_salary, employees, salary
	where employee_salary.employee_id = employees.id and employee_salary.salary_id = salary.id;

-- вариант 2
select e.employee_name, s.monthly_salary from employee_salary es
	join employees e on es.employee_id = e.id 
	join salary s on es.salary_id = s.id;

--  2. Вывести всех работников у которых ЗП меньше 2000.

-- вариант 1
select employees.employee_name, salary.monthly_salary from employee_salary, employees, salary
	where employee_salary.employee_id = employees.id and employee_salary.salary_id = salary.id and salary.monthly_salary < 2000;

-- вариант 2
select e.employee_name, s.monthly_salary from employee_salary es
	join employees e on es.employee_id = e.id 
	join salary s on es.salary_id = s.id 
	where s.monthly_salary < 2000;

--  3. Вывести все зарплатные позиции, но работник по ним не назначен. (ЗП есть, но не понятно кто её получает.)

select * from employee_salary es
	join salary s on es.salary_id = s.id
	where es.employee_id not in (select e.id from employees e);

--  4. Вывести все зарплатные позиции  меньше 2000 но работник по ним не назначен. (ЗП есть, но не понятно кто её получает.)

select * from employee_salary es
	join salary s on es.salary_id = s.id
	where es.employee_id not in (select e.id from employees e)
		and s.monthly_salary < 2000;

--  5. Найти всех работников кому не начислена ЗП.

select e.employee_name  from employee_salary es 
	right join employees e on es.employee_id = e.id
	where es.id is null;
	
--  6. Вывести всех работников с названиями их должности.

select e.employee_name, r.role_name from roles_employee re 
	join roles r on re.role_id = r.id 
	join employees e on re.employee_id = e.id;

--  7. Вывести имена и должность только Java разработчиков.

select e.employee_name, r.role_name from roles_employee re 
	join roles r on re.role_id = r.id 
	join employees e on re.employee_id = e.id
	where r.role_name like '% Java developer';

--  8. Вывести имена и должность только Python разработчиков.

select e.employee_name, r.role_name from roles_employee re 
	join roles r on re.role_id = r.id 
	join employees e on re.employee_id = e.id
	where r.role_name like '% Python developer';

--  9. Вывести имена и должность всех QA инженеров.

select e.employee_name, r.role_name from roles_employee re 
	join roles r on re.role_id = r.id 
	join employees e on re.employee_id = e.id
	where r.role_name like '% QA engineer';

--  10. Вывести имена и должность ручных QA инженеров.

select e.employee_name, r.role_name from roles_employee re 
	join roles r on re.role_id = r.id 
	join employees e on re.employee_id = e.id
	where r.role_name like '% Manual QA engineer';

--  11. Вывести имена и должность автоматизаторов QA

select e.employee_name, r.role_name from roles_employee re 
	join roles r on re.role_id = r.id 
	join employees e on re.employee_id = e.id
	where r.role_name like '%Automation QA engineer';

--  12. Вывести имена и зарплаты Junior специалистов

select e.employee_name, s.monthly_salary, r.role_name from roles_employee re 
	join roles r on re.role_id = r.id 
	join employees e on re.employee_id = e.id
	join employee_salary es on es.employee_id = e.id 
	join salary s on es.salary_id = s.id 
	where r.role_name like 'Junior %';

--  13. Вывести имена и зарплаты Middle специалистов

select e.employee_name, s.monthly_salary, r.role_name from roles_employee re 
	join roles r on re.role_id = r.id 
	join employees e on re.employee_id = e.id
	join employee_salary es on es.employee_id = e.id 
	join salary s on es.salary_id = s.id 
	where r.role_name like 'Middle %';

--  14. Вывести имена и зарплаты Senior специалистов

select e.employee_name, s.monthly_salary, r.role_name from roles_employee re 
	join roles r on re.role_id = r.id 
	join employees e on re.employee_id = e.id
	join employee_salary es on es.employee_id = e.id 
	join salary s on es.salary_id = s.id 
	where r.role_name like 'Senior %';

--  15. Вывести зарплаты Java разработчиков
select s.monthly_salary, r.role_name from roles_employee re 
	join roles r on re.role_id = r.id 
	join employees e on re.employee_id = e.id
	join employee_salary es on es.employee_id = e.id 
	join salary s on es.salary_id = s.id 
	where r.role_name like '% Java developer';

--  16. Вывести зарплаты Python разработчиков

select s.monthly_salary, r.role_name from roles_employee re 
	join roles r on re.role_id = r.id 
	join employees e on re.employee_id = e.id
	join employee_salary es on es.employee_id = e.id 
	join salary s on es.salary_id = s.id 
	where r.role_name like '% Python developer';

--  17. Вывести имена и зарплаты Junior Python разработчиков

select e.employee_name, s.monthly_salary, r.role_name from roles_employee re 
	join roles r on re.role_id = r.id 
	join employees e on re.employee_id = e.id
	join employee_salary es on es.employee_id = e.id 
	join salary s on es.salary_id = s.id 
	where r.role_name like 'Junior Python developer';

--  18. Вывести имена и зарплаты Middle JS разработчиков

select e.employee_name, s.monthly_salary, r.role_name from roles_employee re 
	join roles r on re.role_id = r.id 
	join employees e on re.employee_id = e.id
	join employee_salary es on es.employee_id = e.id 
	join salary s on es.salary_id = s.id 
	where r.role_name like 'Middle JavaScript %';

--  19. Вывести имена и зарплаты Senior Java разработчиков

select e.employee_name, s.monthly_salary, r.role_name from roles_employee re 
	join roles r on re.role_id = r.id 
	join employees e on re.employee_id = e.id
	join employee_salary es on es.employee_id = e.id 
	join salary s on es.salary_id = s.id 
	where r.role_name like 'Senior Java %';

--  20. Вывести зарплаты Junior QA инженеров

select s.monthly_salary, r.role_name from roles_employee re 
	join roles r on re.role_id = r.id 
	join employees e on re.employee_id = e.id
	join employee_salary es on es.employee_id = e.id 
	join salary s on es.salary_id = s.id 
	where r.role_name like 'Junior % QA engineer';

--  21. Вывести среднюю зарплату всех Junior специалистов

select avg(s.monthly_salary) from roles_employee re 
	join roles r on re.role_id = r.id 
	join employees e on re.employee_id = e.id
	join employee_salary es on es.employee_id = e.id 
	join salary s on es.salary_id = s.id 
	where r.role_name like 'Junior %';

--  22. Вывести сумму зарплат JS разработчиков

-- limit не ограничивает набор для sum
select sum(s.monthly_salary) from roles_employee re 
	join roles r on re.role_id = r.id 
	join employees e on re.employee_id = e.id
	join employee_salary es on es.employee_id = e.id 
	join salary s on es.salary_id = s.id
	where r.role_name like '% developer'
	limit 1;

--  23. Вывести минимальную ЗП QA инженеров

select min(s.monthly_salary) from roles_employee re 
	join roles r on re.role_id = r.id 
	join employees e on re.employee_id = e.id
	join employee_salary es on es.employee_id = e.id 
	join salary s on es.salary_id = s.id 
	where r.role_name like '% QA engineer';

--  24. Вывести максимальную ЗП QA инженеров

select max(s.monthly_salary) from roles_employee re 
	join roles r on re.role_id = r.id 
	join employees e on re.employee_id = e.id
	join employee_salary es on es.employee_id = e.id 
	join salary s on es.salary_id = s.id 
	where r.role_name like '% QA engineer';

--  25. Вывести количество QA инженеров

select count(*) from roles_employee re 
	join roles r on re.role_id = r.id 
	join employees e on re.employee_id = e.id
	where r.role_name like '% QA engineer';

--  26. Вывести количество Middle специалистов.

select count(*) from roles_employee re 
	join roles r on re.role_id = r.id 
	join employees e on re.employee_id = e.id
	where r.role_name like 'Middle %';

--  27. Вывести количество разработчиков

select count(*) from roles_employee re 
	join roles r on re.role_id = r.id 
	join employees e on re.employee_id = e.id
	where r.role_name like '% developer';

--  28. Вывести фонд (сумму) зарплаты разработчиков.

select sum(s.monthly_salary) from roles_employee re 
	join roles r on re.role_id = r.id 
	join employees e on re.employee_id = e.id
	join employee_salary es on es.employee_id = e.id 
	join salary s on es.salary_id = s.id
	where r.role_name like '% developer';

--  29. Вывести имена, должности и ЗП всех специалистов по возрастанию

-- по возрастанию чего? например, по имени
select e.employee_name, r.role_name, s.monthly_salary from roles_employee re 
	join roles r on re.role_id = r.id 
	join employees e on re.employee_id = e.id
	join employee_salary es on es.employee_id = e.id 
	join salary s on es.salary_id = s.id
	order by e.employee_name;

--  30. Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП от 1700 до 2300

select e.employee_name, r.role_name, s.monthly_salary from roles_employee re 
	join roles r on re.role_id = r.id 
	join employees e on re.employee_id = e.id
	join employee_salary es on es.employee_id = e.id 
	join salary s on es.salary_id = s.id
	where s.monthly_salary >= 1700 and s.monthly_salary <= 2300
	order by e.employee_name;
	
--  31. Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП меньше 2300

select e.employee_name, r.role_name, s.monthly_salary from roles_employee re 
	join roles r on re.role_id = r.id 
	join employees e on re.employee_id = e.id
	join employee_salary es on es.employee_id = e.id 
	join salary s on es.salary_id = s.id
	where s.monthly_salary < 2300
	order by e.employee_name;

--  32. Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП равна 1100, 1500, 2000

select e.employee_name, r.role_name, s.monthly_salary from roles_employee re 
	join roles r on re.role_id = r.id 
	join employees e on re.employee_id = e.id
	join employee_salary es on es.employee_id = e.id 
	join salary s on es.salary_id = s.id
	where s.monthly_salary in (1100, 1500, 2000)
	order by e.employee_name;
