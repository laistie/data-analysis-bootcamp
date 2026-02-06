-- ===CUSTOM QUERIES=== --

-- Lista informações dos Produtos cadastrados
SELECT *
FROM ecommerce.Products;

-- Lista clientes que são pessoas físicas
SELECT idClient, Fname, Lname, CPF
FROM ecommerce.Clients
WHERE CPF IS NOT NULL;

-- Alternativa para verificar se a constraint de CPF/CNPJ está funcionando
SELECT *
FROM ecommerce.Clients
WHERE ecommerce.Clients.CPF IS NOT NULL;

-- Frete com 20% de desconto nos pedidos
SELECT idOrder, shipping, shipping * 0.8 AS shipping_discounted
FROM ecommerce.Orders;

-- Produtos ordenados por avaliação (rating) decrescente
SELECT Pname, rating
FROM ecommerce.Products
ORDER BY rating DESC;

-- Quantidade total de pedidos por status, exibindo apenas aqueles com mais de 1 pedido
SELECT orderStatus, COUNT(*) AS total_pedidos
FROM ecommerce.Orders
GROUP BY orderStatus
HAVING COUNT(*) > 1;

-- ===SUGGESTED QUERIES=== --

-- Quantos pedidos foram feitos por cada cliente?
SELECT COUNT(*), c.fname, c.minit, c.lname
FROM ecommerce.Clients c
LEFT JOIN ecommerce.Orders o ON c.idClient = o.idOrderClient
GROUP BY c.idclient;

-- Algum vendedor também é fornecedor?
SELECT *
FROM ecommerce.Sellers
NATURAL JOIN ecommerce.Supplier;

-- Relação de produtos e estoques
SELECT p.pname, ps.quantity, s.sname
FROM ecommerce.ProductStorage ps
NATURAL JOIN ecommerce.Products p
NATURAL JOIN ecommerce.Storages s
GROUP BY p.pname, ps.quantity, s.sname;

-- Relação de nomes dos fornecedores e nome dos produtos
SELECT s.sname AS Fornecedor, p.pname AS Produto
FROM ecommerce.ProductStorage ps
NATURAL JOIN ecommerce.Suppliers s
NATURAL JOIN ecommerce.Products p;