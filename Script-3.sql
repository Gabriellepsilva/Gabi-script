--1 quantos filmes há em português?
select count(*) from film f inner join "language" l on l.language_id = f.language_id where l."name" = 'Português';
 
--2 quantos clientes alugaram o filme de id = 7?
select count(*) from customer c inner join rental r on c.customer_id = r.customer_id inner join inventory i 
on r.inventory_id = i.inventory_id inner join film f on i.film_id = f.film_id where f.film_id = 7;
 
--3 quantos aluguéis foram feitos no total?
select count(*) from rental;
 
--4 qual foi o custo do filme de id = 600?
select f.replacement_cost as "custo de reposição" from  film f where film_id = 600;
 
--5 qual funcionário alugou mais filmes?
 select s.first_name, s.last_name from staff s inner join rental r on s.staff_id = r.staff_id group by s.first_name,
 s.last_name limit 1;
 
--6 quantos funcionários tem em cada loja?
 select a.address, count(*) from staff s inner join store st on s.store_id = st.store_id inner join address a 
on a.address_id=st.address_id group by a.address_id ;
 
--7)liste as seguintes colunaas: título do filme, idioma, custo, data do último aluguel, loja do aluguel e preço do aluguel.
 
--8)quantos atores que participam do filme?
 
--9)gual loja possui mais inventários?