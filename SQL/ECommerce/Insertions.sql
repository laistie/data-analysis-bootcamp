INSERT INTO ecommerce.Clients (idClient, Fname, Minit, Lname, CPF, CNPJ) VALUES
    (1, 'Maria', 'M', 'Silva', '12345678901', NULL),
    (2, 'Matheus', 'O', 'Pimentel', '98765432100', NULL),
    (3, 'Ricardo', 'F', 'Siva', '45678912399', NULL),
    (4, 'Julia', 'S', 'França', '78912345688', NULL),
    (5, 'Roberta', 'G', 'Assis', '56789123477', NULL),
    (6, 'Isabela', 'M', 'Cruz', '67891234566', NULL);

INSERT INTO ecommerce.Products (idProduct, Pname, kidsClass, Pcategory, rating, Psize) VALUES
    (1, 'Fone de ouvido', false, 'Eletronic', 4.0, NULL),
    (2, 'Barbie Elsa', true, 'Toy', 3.0, NULL),
    (3, 'Body Carters', true, 'Clothing', 5.0, '4-16'),
    (4, 'Microfone YT', false, 'Eletronic', 4.0, NULL),
    (5, 'Sofá retrátil', false, 'Furniture', 3.0, '3x57x80cm'),
    (6, 'Farinha arroz', false, 'Food', 2.0, NULL),
    (7, 'Fire Stick', false, 'Eletronic', 3.0, NULL);

INSERT INTO ecommerce.Storages (idStorage, Sname, Slocation) VALUES
    (1, 'CD Central RJ', 'Rio de Janeiro'),
    (2, 'CD Guarulhos', 'São Paulo');

INSERT INTO ecommerce.ProductStorage (idProductStorage, idProduct, idStorage, idSupplier, quantity) VALUES
    (1, 1, 1, 1, 100),
    (2, 2, 1, 2, 50),
    (3, 3, 2, 1, 200),
    (4, 4, 2, 2, 75),
    (5, 5, 2, 2, 30),
    (6, 1, 1, 1, 60),
    (7, 2, 2, 1, 90),
    (8, 3, 1, 2, 40),
    (9, 4, 2, 1, 20),
    (10, 5, 2, 1, 150);

INSERT INTO ecommerce.Supplier (idSupplier, Sname, CNPJ, contactno) VALUES
    (1, 'Tech Import', '12345678000199', '21999999999'),
    (2, 'Fashion Ind', '23456789000188', '21988888888');

    INSERT INTO ecommerce.Sellers (idSeller, Sname, CNPJ, CPF, Slocation, contactno) VALUES
    (1, 'Tech Eletronics', NULL, '123456789', 'Rio de Janeiro', '21994687000'),
    (2, 'Botique Durgas', NULL, '123456783', 'Rio de Janeiro', '21956789500'),
    (3, 'Kids World', NULL, '456789123', 'São Paulo', '11912345678'),
    (4, 'Fashion Ind', '23456789000188', NULL, 'São Paulo', '21988888888');

INSERT INTO ecommerce.ProductSeller (idProduct, idSeller, quantity) VALUES
    (1, 1, 50),
    (4, 1, 30),
    (2, 3, 15),
    (3, 3, 20),
    (5, 2, 10),
    (6, 1, 5);

INSERT INTO ecommerce.Payments (idPayment, idClient, Ptype) VALUES
    (1, 1, 'CC'),
    (2, 2, 'Bank payment'),
    (3, 3, 'CC'),
    (4, 4, 'Bank payment');

INSERT INTO ecommerce.Orders (idOrder, idOrderClient, idPayment, orderStatus, orderDescription, shipping) VALUES
    (1, 1, 1, 'Processing', 'Compra via aplicativo', 10),
    (2, 2, 2, 'Processing', 'Compra via aplicativo', 50),
    (3, 3, 3, 'Confirmed', 'Compra finalizada com sucesso', 10),
    (4, 4, 4, 'Canceled', 'Compra via web', 150);
    (5, 1, 2, 'Confirmed', 'Segunda compra via aplicativo', 20),
    (6, 2, 1, 'Processing', 'Segunda compra via site', 40),
    (7, 2, 2, 'Confirmed', 'Terceira compra via site', 60),
    (8, 3, 2, 'Canceled', 'Pedido cancelado via app', 10),
    (9, 4, 1, 'Processing', 'Recompra via web', 130);

INSERT INTO ecommerce.PaymentsOrders (idPayment, idOrder) VALUES
    (1, 1),
    (2, 2),
    (3, 3),
    (4, 4);

INSERT INTO ecommerce.ProductOrder (idProduct, idOrder, quantity, productorderStatus) VALUES
    (1, 1, 2, 'Available'),
    (2, 1, 1, 'Available'),
    (3, 2, 1, 'Available'),
    (5, 4, 1, 'Not available'),
    (6, 3, 3, 'Available');