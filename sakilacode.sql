use sakila;
/*1) Gere uma listagem dos clientes com o endereço completo, ordenado pelo nome do cliente*/
select first_name from customer;
select last_name from customer;
select customer.first_name, customer.address_id, address.address_id, address.address
	from customer, address where customer.address_id = address.address_id 
    order by customer.first_name;
    
/*2) Quais os filmes que a cliente MARY(ID: 1) realizou emprestimo*/
select customer_id from customer where first_name like 'mary';
select * from rental;
select * from inventory;
select distinct customer.customer_id, rental.customer_id, customer.first_name, rental.inventory_id,
	inventory.inventory_id, inventory.film_id, film.title from customer, rental, inventory, film
    where customer.customer_id = 1;
    
/*3) Quanto a Mary gastou com locação de filmes*/
select customer.first_name, sum(payment.amount) as 'Total Payment' from payment, customer
	where payment.customer_id = 1 and customer.customer_id = 1;
    
/*4) Quanto faturou o gerente responsável pela Mary com uma omissão de 5%*/
select * from payment;
select * from staff;
select rental.customer_id, rental.staff_id from rental where rental.customer_id = 1;
    