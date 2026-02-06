CREATE TYPE ecommerce.category AS ENUM ('Eletronic', 'Clothing', 'Toy', 'Food', 'Furniture');
CREATE TYPE ecommerce.payment AS ENUM ('Bank payment', 'CC');
CREATE TYPE ecommerce.OStatus AS ENUM ('Canceled', 'Confirmed', 'Processing');
CREATE TYPE ecommerce.POStatus AS ENUM ('Available', 'Not available');

-- Clients table with 1st condition of project objectives satisfied
CREATE TABLE ecommerce.Clients (
    idClient INT PRIMARY KEY,
    Fname VARCHAR(10),
    Minit CHAR(3),
    Lname VARCHAR(20),
    CPF CHAR(11),
	CNPJ CHAR(15),
    CONSTRAINT uq_client_cpf UNIQUE (CPF),
    CONSTRAINT uq_client_cnpj UNIQUE (CNPJ),
        CONSTRAINT chk_cpf_or_cnpj CHECK (
            (CPF IS NOT NULL AND CNPJ IS NULL) OR
            (CPF IS NULL AND CNPJ IS NOT NULL)
        )
);

CREATE TABLE ecommerce.Products (
    idProduct INT PRIMARY KEY,
    Pname VARCHAR(15) NOT NULL,
    kidsClass BOOLEAN DEFAULT FALSE,
    Pcategory category,
    rating FLOAT DEFAULT 0,
    Psize VARCHAR(10)
);

CREATE TABLE ecommerce.Storages (
    idStorage INT PRIMARY KEY,
    Sname VARCHAR(30),
    Slocation VARCHAR(255)
);

CREATE TABLE ecommerce.Suppliers (
    idSupplier INT PRIMARY KEY,
    Sname VARCHAR(255) NOT NULL,
    CNPJ CHAR(15),
    contactno CHAR(11) NOT NULL,
    CONSTRAINT uq_supplier_cnpj UNIQUE (CNPJ)
);

CREATE TABLE ecommerce.ProductStorage (
    idProductStorage INT PRIMARY KEY,
    idProduct INT,
    idStorage INT,
    idSupplier INT,
    quantity INT DEFAULT 0,
    CONSTRAINT fk_productstorage_product FOREIGN KEY (idProduct)
        REFERENCES ecommerce.Products(idProduct),
    CONSTRAINT fk_productstorage_storage FOREIGN KEY (idStorage)
        REFERENCES ecommerce.Storages(idStorage),
    CONSTRAINT fk_productstorage_supplier FOREIGN KEY (idSupplier)
        REFERENCES ecommerce.Suppliers(idSupplier)
);

CREATE TABLE ecommerce.Sellers (
    idSeller INT PRIMARY KEY,
    Sname VARCHAR(255) NOT NULL,
    CNPJ char(15),
    CPF char(9),
    Slocation VARCHAR(255),
    contactno char(11) NOT NULL,
    CONSTRAINT uq_seller_cnpj UNIQUE (CNPJ),
    CONSTRAINT uq_seller_cpf UNIQUE (CPF),
	CONSTRAINT chk_cpf_or_cnpj CHECK (
        (CPF IS NOT NULL AND CNPJ IS NULL) OR
        (CPF IS NULL AND CNPJ IS NOT NULL)
    )
);

CREATE TABLE ecommerce.ProductSeller (
    idProduct INT,
    idSeller INT,
    quantity INT DEFAULT 1,
    CONSTRAINT pk_productseller PRIMARY KEY (idProduct, idSeller),
    CONSTRAINT fk_productseller_product FOREIGN KEY (idProduct)
		REFERENCES ecommerce.Products(idProduct),
    CONSTRAINT fk_productseller_seller FOREIGN KEY (idSeller)
		REFERENCES ecommerce.Sellers(idSeller)
);

CREATE TABLE ecommerce.Payments (
    idPayment INT PRIMARY KEY,
    idClient INT,
    Ptype payment,
    CONSTRAINT fk_payments_client FOREIGN KEY (idClient) 
        REFERENCES ecommerce.Clients(idClient)
);

-- Orders table with 3rd condition of project objectives satisfied
CREATE TABLE ecommerce.Orders (
    idOrder INT PRIMARY KEY,
    idOrderClient INT,
    idPayment INT,
    orderStatus OStatus,
    orderDescription VARCHAR(255),
    shipping FLOAT DEFAULT 10,
    CONSTRAINT fk_orders_client FOREIGN KEY (idOrderClient) 
        REFERENCES ecommerce.Clients(idClient),
    CONSTRAINT fk_orders_payment FOREIGN KEY (idPayment) 
        REFERENCES ecommerce.Payments(idPayment)
        ON UPDATE CASCADE
);

-- PaymentsOrder table with 2nd condition of project objectives satisfied
CREATE TABLE ecommerce.PaymentsOrders (
    idPayment INT,
    idOrder INT,
    CONSTRAINT pk_paymentsorders PRIMARY KEY (idPayment, idOrder),
    CONSTRAINT fk_paymentsorders_payment FOREIGN KEY (idPayment)
        REFERENCES ecommerce.Payments(idPayment),
    CONSTRAINT fk_paymentordes_order FOREIGN KEY (idOrder)
        REFERENCES ecommerce.Orders(idOrder)
);

CREATE TABLE ecommerce.ProductOrder (
    idProduct INT,
    idOrder INT,
    quantity INT DEFAULT 1,
    productorderStatus POStatus DEFAULT 'Available',
    CONSTRAINT pk_productorder PRIMARY KEY (idProduct, idOrder),
    CONSTRAINT fk_productorder_product FOREIGN KEY (idProduct)
        REFERENCES ecommerce.Products(idProduct),
    CONSTRAINT fk_productorder_order FOREIGN KEY (idOrder)
        REFERENCES ecommerce.Orders(idOrder)
)