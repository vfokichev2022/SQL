-- Задание: 1
-- Найдите номер модели, скорость и размер жесткого диска для всех ПК стоимостью менее 500 дол. Вывести: model, speed и hd 

select model, speed, hd
from pc
where price < 500

-- Задание: 2
-- Найдите производителей принтеров. Вывести: maker 

select distinct maker
from product
where type='Printer'

-- Задание: 3
-- Найдите номер модели, объем памяти и размеры экранов ПК-блокнотов, цена которых превышает 1000 дол. 

select model, ram, screen
from laptop
where price > 1000

-- Задание: 4
-- Найдите все записи таблицы Printer для цветных принтеров. 

select *
from printer
where color ='y'


-- Задание: 5
-- Найдите номер модели, скорость и размер жесткого диска ПК, имеющих 12x или 24x CD и цену менее 600 дол. 

select model, speed, hd
from pc
where cd in ('12x', '24x')
  and price < 600

-- адание: 6
-- Для каждого производителя, выпускающего ПК-блокноты c объёмом жесткого диска не менее 10 Гбайт, найти скорости таких ПК-блокнотов. Вывод: производитель, скорость. 

select distinct maker, speed
from product
join laptop
on product.model=laptop.model
where hd>=10

-- Задание: 7
-- Найдите номера моделей и цены всех имеющихся в продаже продуктов (любого типа) производителя B (латинская буква). 

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

-- Задание: 8
-- Найдите производителя, выпускающего ПК, но не ПК-блокноты. 

select distinct maker
from product
where type='PC'
  and maker not in (select distinct maker from product where type='Laptop')

-- Задание: 9
-- Найдите производителей ПК с процессором не менее 450 Мгц. Вывести: Maker

select distinct maker
from product
join pc
on product.model=pc.model
where speed>=450

-- Задание: 10
-- Найдите модели принтеров, имеющих самую высокую цену. Вывести: model, price 

select model, price
from printer
where price = (select max(price) from printer)

-- Задание: 11
-- Найдите среднюю скорость ПК.

select avg(speed)
from pc

-- Задание: 12
-- Найдите среднюю скорость ПК-блокнотов, цена которых превышает 1000 дол. 

select avg(speed)
from laptop
where price > 1000

-- Задание: 13
-- Найдите среднюю скорость ПК, выпущенных производителем A. 

select avg(speed)
from product
join pc
on product.model=pc.model
where maker='A'

-- Задание: 14
-- Найдите класс, имя и страну для кораблей из таблицы Ships, имеющих не менее 10 орудий. 

select ships.class, name, country
from ships
join classes
on ships.class = classes.class
where numguns>=10

-- Задание: 15
-- Найдите размеры жестких дисков, совпадающих у двух и более PC. Вывести: HD

select hd
from pc
group by hd
having count(hd)>1

-- Задание: 16
-- Найдите пары моделей PC, имеющих одинаковые скорость и RAM. В результате каждая пара указывается только один раз, т.е. (i,j), но не (j,i), Порядок вывода: модель с большим номером, модель с меньшим номером, скорость и RAM. 

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

-- Задание: 17
-- Найдите модели ПК-блокнотов, скорость которых меньше скорости каждого из ПК. Вывести: type, model, speed 

select distinct type, laptop.model, speed
from laptop, product
where laptop.model=product.model and speed < (select min(speed) from pc)

-- Задание: 18
-- Найдите производителей самых дешевых цветных принтеров. Вывести: maker, price

select distinct maker, price
from product
join printer
on product.model=printer.model
where printer.color='y'
  and printer.price = (select min(price) from printer where color='y')

-- Задание: 19
-- Для каждого производителя, имеющего модели в таблице Laptop, найдите средний размер экрана выпускаемых им ПК-блокнотов. Вывести: maker, средний размер экрана. 

select maker, avg(screen)
from product
join laptop
on product.model=laptop.model
group by maker

-- Задание: 20
-- Найдите производителей, выпускающих по меньшей мере три различных модели ПК. Вывести: Maker, число моделей ПК

select maker, count(model)
from product
where type='PC'
group by maker
having count(model)>=3

-- Задание: 21
-- Найдите максимальную цену ПК, выпускаемых каждым производителем, у которого есть модели в таблице PC. Вывести: maker, максимальная цена. 

select maker, max(price)
from product
join pc
on product.model=pc.model
group by maker

-- Задание: 22
-- Для каждого значения скорости ПК, превышающего 600 МГц, определите среднюю цену ПК с такой же скоростью. Вывести: speed, средняя цена. 

select speed, avg(price)
from pc
where speed>600
group by speed

-- Задание: 23
-- Найдите производителей, которые производили бы как ПК со скоростью не менее 750 МГц, так и ПК-блокноты со скоростью не менее 750 МГц. Вывести: Maker

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

-- Задание: 24
-- Перечислите номера моделей любых типов, имеющих самую высокую цену по всей имеющейся в базе данных продукции. 

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

-- Задание: 25
-- Найдите производителей принтеров, которые производят ПК с наименьшим объемом RAM и с самым быстрым процессором среди всех ПК, имеющих наименьший объем RAM. Вывести: Maker 

select distinct maker
from product
join pc
on product.model=pc.model
where pc.ram=(select min(ram) from pc)
  and pc.speed=(select max(speed) from pc where pc.ram=(select min(ram) from pc))
  and maker in (select maker from product where type='Printer')

-- Задание: 26
-- Найдите среднюю цену ПК и ПК-блокнотов, выпущенных производителем A (латинская буква). Вывести: одна общая средняя цена.

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

-- Задание: 27
-- Найдите средний размер диска ПК каждого из тех производителей, которые выпускают и принтеры. Вывести: maker, средний размер HD. 

select maker, avg(hd)
from product
join pc
on product.model=pc.model
where maker in (select maker from product where type='Printer')
group by maker

-- Задание: 28
-- Используя таблицу Product, определить количество производителей, выпускающих по одной модели.

select count(m.maker)
from
(select maker
from product
group by maker
having count(model)=1) m

-- Задание: 29 (Serge I: 2003-02-14)
-- В предположении, что приход и расход денег на каждом пункте приема фиксируется не чаще одного раза в день [т.е. первичный ключ (пункт, дата)], написать запрос с выходными данными (пункт, дата, приход, расход). Использовать таблицы Income_o и Outcome_o.

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

-- Задание: 30
-- В предположении, что приход и расход денег на каждом пункте приема фиксируется произвольное число раз (первичным ключом в таблицах является столбец code), требуется получить таблицу, в которой каждому пункту за каждую дату выполнения операций будет соответствовать одна строка.
-- Вывод: point, date, суммарный расход пункта за день (out), суммарный приход пункта за день (inc). Отсутствующие значения считать неопределенными (NULL). 

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

-- Задание: 31
-- Для классов кораблей, калибр орудий которых не менее 16 дюймов, укажите класс и страну. 

select class, country
from classes
where bore>=16

-- Задание: 32
-- Одной из характеристик корабля является половина куба калибра его главных орудий (mw). С точностью до 2 десятичных знаков определите среднее значение mw для кораблей каждой страны, у которой есть корабли в базе данных. 

select country, cast(avg(mw) as numeric(6,2))
from ships s
right join
(select class, country, bore*bore*bore/2 mw
from classes) c
on s.class=c.class
group by country


-- Задание: 33
-- Укажите корабли, потопленные в сражениях в Северной Атлантике (North Atlantic). Вывод: ship. 

select ship
from outcomes
where battle='North Atlantic'
  and result='sunk'

-- Задание: 34
-- По Вашингтонскому международному договору от начала 1922 г. запрещалось строить линейные корабли водоизмещением более 35 тыс.тонн. Укажите корабли, нарушившие этот договор (учитывать только корабли c известным годом спуска на воду). Вывести названия кораблей. 

select s.name
from ships s
join classes c
on s.class=c.class
where s.launched>1922
  and type='bb'
  and displacement>35000


-- Задание: 35
-- В таблице Product найти модели, которые состоят только из цифр или только из латинских букв (A-Z, без учета регистра). Вывод: номер модели, тип модели.

select model, type
from product[0-9]
where model like '[0-9][0-9][0-9][0-9]'
  or model like '[a-zA-Z][a-zA-Z][a-zA-Z][a-zA-Z]'

-- Задание: 36
-- Перечислите названия головных кораблей, имеющихся в базе данных (учесть корабли в Outcomes). 

select s.n
from
(select name n
from ships
union
select ship n
from outcomes) s
join classes
on s.n=class

-- Задание: 37
-- Найдите классы, в которые входит только один корабль из базы данных (учесть также корабли в Outcomes).

select c.class
from classes c
join ships s
on c.class=s.class
group by c.class
having count(*)=1
union
select c2.class
from
(select distinct ship from outcomes where ship not in (select name from ships)) s2
join classes c2
on s2.ship=c2.class
group by c2.class
having count(*)=1


-- Задание: 38
-- Найдите страны, имевшие когда-либо классы обычных боевых кораблей ('bb') и имевшие когда-либо классы крейсеров ('bc').

select country
from classes
where type='bb'
intersect
select country
from classes
where type='bc'

-- Задание: 39
-- Найдите корабли, `сохранившиеся для будущих сражений`; т.е. выведенные из строя в одной битве (damaged), они участвовали в другой, произошедшей позже.

select o1.ship
from
(select *
from outcomes o
join battles b
on o.battle=b.name
where result='damaged') o1
join
(select *
from outcomes o
join battles b
on o.battle=b.name) o2
on o1.ship=o2.ship
  and o1.date<o2.date

-- Задание: 40
--Найти производителей, которые выпускают более одной модели, при этом все выпускаемые производителем модели являются продуктами одного типа. Вывести: maker, type

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
