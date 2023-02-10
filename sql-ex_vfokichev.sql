-- �������: 1
-- ������� ����� ������, �������� � ������ �������� ����� ��� ���� �� ���������� ����� 500 ���. �������: model, speed � hd 

select model, speed, hd
from pc
where price < 500

-- �������: 2
-- ������� �������������� ���������. �������: maker 

select distinct maker
from product
where type='Printer'

-- �������: 3
-- ������� ����� ������, ����� ������ � ������� ������� ��-���������, ���� ������� ��������� 1000 ���. 

select model, ram, screen
from laptop
where price > 1000

-- �������: 4
-- ������� ��� ������ ������� Printer ��� ������� ���������. 

select *
from printer
where color ='y'


-- �������: 5
-- ������� ����� ������, �������� � ������ �������� ����� ��, ������� 12x ��� 24x CD � ���� ����� 600 ���. 

select model, speed, hd
from pc
where cd in ('12x', '24x')
  and price < 600

-- ������: 6
-- ��� ������� �������������, ������������ ��-�������� c ������� �������� ����� �� ����� 10 �����, ����� �������� ����� ��-���������. �����: �������������, ��������. 

select distinct maker, speed
from product
join laptop
on product.model=laptop.model
where hd>=10

-- �������: 7
-- ������� ������ ������� � ���� ���� ��������� � ������� ��������� (������ ����) ������������� B (��������� �����). 

select mp.model, mp.price
from product
join
(select model, price from pc
union
select model, price from laptop
union
select model, price from printer) mp
on  product.model=mp.model
where maker='B'

-- �������: 8
-- ������� �������������, ������������ ��, �� �� ��-��������. 

select distinct maker
from product
where type='PC'
  and maker not in (select distinct maker from product where type='Laptop')

-- �������: 9
-- ������� �������������� �� � ����������� �� ����� 450 ���. �������: Maker

select distinct maker
from product
join pc
on product.model=pc.model
where speed>=450

-- �������: 10
-- ������� ������ ���������, ������� ����� ������� ����. �������: model, price 

select model, price
from printer
where price = (select max(price) from printer)

-- �������: 11
-- ������� ������� �������� ��.

select avg(speed)
from pc

-- �������: 12
-- ������� ������� �������� ��-���������, ���� ������� ��������� 1000 ���. 

select avg(speed)
from laptop
where price > 1000

-- �������: 13
-- ������� ������� �������� ��, ���������� �������������� A. 

select avg(speed)
from product
join pc
on product.model=pc.model
where maker='A'

-- �������: 14
-- ������� �����, ��� � ������ ��� �������� �� ������� Ships, ������� �� ����� 10 ������. 

select ships.class, name, country
from ships
join classes
on ships.class = classes.class
where numguns>=10

-- �������: 15
-- ������� ������� ������� ������, ����������� � ���� � ����� PC. �������: HD

select hd
from pc
group by hd
having count(hd)>1

-- �������: 16 (Serge I: 2003-02-03)
-- ������� ���� ������� PC, ������� ���������� �������� � RAM. � ���������� ������ ���� ����������� ������ ���� ���, �.�. (i,j), �� �� (j,i), ������� ������: ������ � ������� �������, ������ � ������� �������, �������� � RAM. 

select distinct pc.model, pc1.model, pc.speed, pc.ram
from pc, pc pc1,
(select speed, ram
from pc
group by speed, ram
having count(*)>1) pc2
where
  pc.ram=pc2.ram and pc.speed=pc2.speed 
  and pc1.ram=pc2.ram and pc1.speed=pc2.speed
  and pc.model>pc1.model

17
--
select distinct type, laptop.model, speed
from laptop, product
where laptop.model=product.model and speed < (select min(speed) from pc)

18
--
select distinct maker, price
from product
join printer
on product.model=printer.model
where printer.color='y'
  and printer.price = (select min(price) from printer where color='y')

19
--
select maker, avg(screen)
from product
join laptop
on product.model=laptop.model
group by maker

20
--
select maker, count(model)
from product
where type='PC'
group by maker
having count(model)>=3

21
--
select maker, max(price)
from product
join pc
on product.model=pc.model
group by maker

22
--
select speed, avg(price)
from pc
where speed>600
group by speed

23
--
select maker
from product
join pc
on product.model=pc.model
where speed>=750
intersect
select maker
from product
join laptop
on product.model=laptop.model
where speed>=750

24
--
select model
from
(select model, price
from pc
union
select model, price
from laptop
union
select model, price
from printer) m1
where m1.price=(select max(price)
from
(select model, price
from pc
union
select model, price
from laptop
union
select model, price
from printer) mp)

25
--
select distinct maker
from product
join pc
on product.model=pc.model
where pc.ram=(select min(ram) from pc)
  and pc.speed=(select max(speed) from pc where pc.ram=(select min(ram) from pc))
  and maker in (select maker from product where type='Printer')

26
--
select avg(p.price)
from
(select price
from product
join pc
on product.model=pc.model and maker='A'
union all
select price
from product
join laptop
on product.model=laptop.model and maker='A') p

27
--
select maker, avg(hd)
from product
join pc
on product.model=pc.model
where maker in (select maker from product where type='Printer')
group by maker

28
--
select count(m.maker)
from
(select maker
from product
group by maker
having count(model)=1) m

29
--
select
case when i.point is null
  then o.point
  else i.point
end,
case when i.date is null
  then o.date
  else i.date
end,
inc, out
from income_o i
full join outcome_o o
on i.point=o.point
  and i.date=o.date

30
--
select
case when i.point is null
  then o.point
  else i.point
end point,
case when i.date is null
  then o.date
  else i.date
end date,
sout, sinc
from
(select point, date, sum(inc) sinc
from income
group by point, date) i
full join 
(select point, date, sum(out) sout
from outcome
group by point, date) o
on i.point=o.point
  and i.date=o.date

31
--
select class, country
from classes
where bore>=16

32
--

33
--
select ship
from outcomes
where battle='North Atlantic'
  and result='sunk'

34
--

35
--

36
--
select s.n
from
(select name n
from ships
union
select ship n
from outcomes) s
join classes
on s.n=class

37
--

38
--
select country
from classes
where type='bb'
intersect
select country
from classes
where type='bc'

39
--

40
--
select p2.maker, p2.type
from
(select p1.maker
from 
(select distinct maker, type
from product) p1
group by p1.maker
having count(p1.type)=1) p
join product p2
on p.maker=p2.maker
group by p2.maker, p2.type
having count(*)>1









