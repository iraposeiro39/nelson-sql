-- 1- Selecionar todos os produtos que possuem preço maior que 100.00€ e estão em stock
SELECT * FROM product
	WHERE price > 100 AND stock_quantity > 0;
    
-- 2- Selecionar todos os produtos com preço menor que 20.00€ ou maior que 50.00€
SELECT * FROM product
	WHERE price < 20 OR price > 50;
    
-- 3- Selecionar todos os produtos que estão esgotados
SELECT * FROM product
	WHERE stock_quantity = 0;
    
-- 4- Selecionar todos os produtos cujo preço seja entre 15.00€ e 30.00€
SELECT * FROM product
	WHERE price BETWEEN 15 and 30;

-- 5- Selecionar todos os produtos que pertencem às categorias 1 e 3
SELECT * FROM product
	WHERE category_id = 1 or category_id = 3;
    
-- 6- Selecionar todos os produtos que possuem um preço diferente de 25.00€
SELECT * FROM product
	WHERE NOT price = 25;

-- 7- Selecionar todos os produtos cujo preço seja igual a 10.00€ ou a 20.00€
SELECT * FROM product
	WHERE price = 10 OR price = 20;
    
-- 8- Selecionar todos os users cujo nome comece com "J"
SELECT * FROM user
	WHERE name LIKE "J%";
    
-- 9- Selecionar todos os users cujo nome seja "Ewell Huel" ou "Aurelia Hermiston"
SELECT * FROM user
	WHERE name = "Ewell Huel" OR name = "Aurelia Hermiston";

-- 10- Selecionar todos os produtos com preço menor ou igual a 30.00€ e em stock
SELECT * FROM product
	WHERE price <= 30 AND stock_quantity > 0;
    
-- 11- Selecionar o número total de produtos na tabela product
SELECT COUNT(*) FROM product;

-- 12- Calcular a soma do preço de todos os produtos
SELECT SUM(price) FROM product;

-- 13- Calcular a média do preço dos produtos
SELECT AVG(price) FROM product;

-- 14- Calcular o preço mínimo dos produtos
SELECT MIN(price) FROM product;

-- 15- Calcular o preço máximo dos produtos
SELECT MAX(price) FROM product;

-- 16- Selecionar todos os produtos cuja categoria seja 2 e o preço seja maior que 20.00€
SELECT * FROM product
	WHERE category_id = 2 AND price > 20;
    
-- 17- Selecionar todos os produtos cujos nomes sejam "exercitationem" ou "atque"
SELECT * FROM product
	WHERE product_name = "exercitationem" OR product_name = "atque";
    
-- 18- Selecionar todos os produtos cuja categoria não seja 1 e cujo preço seja inferior a 50.00€
SELECT * FROM product
	WHERE NOT category_id = 1 AND price < 50;

-- 19- Calcular o número total de pedidos feitos por cada user
SELECT COUNT(order_id), user_id FROM `order`GROUP BY user_id;

-- 20- Calcular a soma do valor total dos produtos de cada pedido
SELECT SUM(total_price), order_id FROM order_item GROUP BY order_id;