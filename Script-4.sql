--1 quantos filmes há em português?
select count(*) from film f inner join "language" l 
on l.language_id = f.language_id where l."name" = 'Português';
 
--2 quantos clientes alugaram o filme de id = 7?
select count(*) from customer c inner join rental r 
on c.customer_id = r.customer_id inner join inventory i 
on r.inventory_id = i.inventory_id inner join film f 
on i.film_id = f.film_id where f.film_id = 7;
 
--3 quantos aluguéis foram feitos no total?
select count(*) as"Qtd aluguéis" from rental;
 
--4 qual foi o custo do filme de id = 600?
select f.replacement_cost as "custo de reposição" from  film f where film_id = 600;
 
--5 qual funcionário alugou mais filmes?
 select s.first_name, s.last_name from staff s inner join rental r 
 on s.staff_id = r.staff_id group by s.first_name,s.last_name limit 1;
 
--6 quantos funcionários tem em cada loja?
 select a.address, count(*) from staff s inner join store st 
 on s.store_id = st.store_id inner join address a 
on a.address_id=st.address_id group by a.address_id ;
 
--7)liste as seguintes colunaas: título do filme, idioma, custo, data do último aluguel, loja do aluguel e preço do aluguel.
select 
	f.title as "título do filme",
	l."name" as "Idioma",
	f.replacement_cost as"Custo de reposição",
	r.rental_date as"Data de aluguel",
	c.first_name as "Nome do cliente",
	s.first_name as"Nome do funcionário",
	s2.store_id as"Id da loja",
	f.rental_rate as"Valor do aluquel"
	from film f 
inner join "language" l on l.language_id = f.language_id 
inner join inventory i on i.film_id = f.film_id 
inner join rental r on r.inventory_id = i.inventory_id
inner join customer c on c.customer_id = r.customer_id
inner join staff s on s.staff_id = r.staff_id
inner join store s2 on s2.store_id =s.store_id 
order by r.rental_date desc 
limit 1 ;

--8)quantos atores que participam do filme?
select count(*) as"Qtd. atores" 
from film_actor fa where fa.film_id =1;

--9)gual loja possui mais inventários?
select s.store_id as "Id da loja",
count (i.inventory_id) from store s
inner join staff s2 on s2.store_id = s.store_id 
inner join rental r on r.staff_id = s2.staff_id 
inner join inventory i on i.inventory_id = r.inventory_id
group by s.store_id 
order by count(i.inventory_id) desc limit 1 ;
