-- inserção de dados e queries
USE ecommerce;
SHOW TABLES;

-- idClient, Fname, Minit, Lname, CPF, Address
INSERT INTO clients (Fname, Minit, Lname, CPF, Address) VALUES
('Maria', 'M', 'Silva', 12346789, 'rua silva de prata 29, Carangola - Cidade das flores'),
('Matheus', 'O', 'Pimentel', 987654321, 'rua alameda 289, Centro - Cidade das flores'),
('Ricardo', 'F', 'Silva', 45678913, 'avenida alameda vinha 1009, Centro - Cidade das flores'),
('Julia', 'S', 'Franca', 789123456, 'rua laranjeiras 861, Centro - Cidade das flores'),
('Roberta', 'G', 'Assis', 98745631, 'avenida koller 19, Centro - Cidade das flores'),
('Isabela', 'M', 'Cruz', 654789123, 'rua alameda das flores 28, Centro - Cidade das flores');

-- idProduct, Pname, classification_kids, category ('Eletrônico', 'Vestimenta', 'Brinquedos', 'Alimentos', 'Móveis'), avaliação, size
INSERT INTO product (Pname, classification_kids, category, avaliação, size) VALUES
('Fone de ouvido', FALSE, 'Eletrônico', '4', NULL),
('Barbie Elsa', TRUE, 'Brinquedos', '3', NULL),
('Body Carters', TRUE, 'Vestimenta', '5', NULL),
('Microfone Vedo - Youtuber', FALSE, 'Eletrônico', '4', NULL),
('Sofá retrátil', FALSE, 'Móveis', '3', '3x57x80'),
('Farinha de arroz', FALSE, 'Alimentos', '2', NULL),
('Fire Stick Amazon', FALSE, 'Eletrônico', '3', NULL);

SELECT * FROM clients;
SELECT * FROM product;

-- idOrder, idOrderClient, orderStatus, orderDescription, sendValue, paymentCash
INSERT INTO orders (idOrderClient, orderStatus, orderDescription, sendValue, paymentCash) VALUES
(1, default, 'compra via aplicativo', NULL, 1),
(2, default, 'compra via aplicativo', 50, 0),
(3, 'Confirmado', NULL, NULL, 1),
(4, default, 'compra via web site', 150, 0);

-- idPOproduct, idPOorder, poQuantity, poStatus
SELECT * FROM orders;
INSERT INTO productOrder (idPOproduct, idPOorder, poQuantity, poStatus) VALUES
						(1, 1, 2, NULL),
						(2, 1, 1, NULL),
						(3, 2, 1, NULL);

-- storageLocation, quantity
INSERT INTO productStorage (storageLocation, quantity) VALUES
('Rio de Janeiro', 1000),
('Rio de Janeiro', 500),
('São Paulo', 10),
('São Paulo', 100),
('São Paulo', 10),
('Brasília', 60);

-- idProduct, idStorage, location
INSERT INTO storageLocation (idLproduct, idLstorage, location) VALUES
(1, 2, 'RJ'),
(2, 6, 'GO');

-- idSupplier, SocialName, CNPJ, contact
INSERT INTO supplier (SocialName, CNPJ, contact) VALUES
('Almeida e filhos', 123456789123456, '21985474'),
('Eletrônicos Silva', 85451964914457, '21985484'),
('Eletrônicos Valma', 934567893394659, '21975474');

select * from supplier;
-- idPsSupplier, idPsProduct, quantity
insert into productSupplier (idPsSupplier, idPsProduct, quantity) values
    (1, 1, 500),
    (1, 2, 400),
    (2, 4, 633),
    (3, 3, 5),
    (2, 5, 10);

INSERT INTO seller (SocialName, AbstName, CNPJ, CPF, location, contact) VALUES
('Tech Electronics', NULL, 123456789456321, NULL, 'Rio de Janeiro', 219946287),
('Boutique Durgas', NULL, NULL, 123456783, 'Rio de Janeiro', 219567895),
('Kids World', NULL, 456789123654485, NULL, 'São Paulo', 1198657484);  
select * from seller;

-- idPseller, idPproduct, prodQuantity
insert into productSeller (idPseller, idPproduct, prodQuantity) values
    (1, 6, 80),
    (2, 7, 10);

select * from clients c, orders o where c.idClient = idOrderClient;

select * from productSeller;

-- Conta o total de registros na tabela de clientes
select count(*) from clients;

-- Consulta simples unindo clientes e pedidos
select * from clients c, orders o where c.idClient = idOrderClient;

-- Seleciona colunas específicas de clientes e pedidos
select Fname, Lname, idOrder, orderStatus from clients c, orders o where c.idClient = idOrderClient;

-- Consulta formatada com concatenação de nome e apelidos (aliases) para as colunas
select concat(Fname,' ', Lname) as Client, idOrder as Request, orderStatus as Status from clients c, orders o where c.idClient = idOrderClient;

insert into orders (idOrderClient, orderStatus, orderDescription, sendValue, paymentCash) values
    (2, default, 'compra via aplicativo', null, 1);

select * from seller;
select * from orders;
select * from productSeller;

-- Conta o total de clientes
select count(*) from clients;

-- Conta o total de pedidos realizados por clientes
select count(*) from clients c, orders o where c.idClient = idOrderClient;

-- Recupera dados básicos de clientes e seus pedidos
select Fname, Lname, idOrder, orderStatus 
from clients c, orders o 
where c.idClient = idOrderClient;

-- Relatório formatado com nomes amigáveis (Aliases) e concatenação
select concat(Fname, ' ', Lname) as Client, 
       idOrder as Request, 
       orderStatus as Status 
from clients c, orders o 
where c.idClient = idOrderClient;

-- Consulta avançada utilizando INNER JOIN em múltiplas tabelas (Clientes, Pedidos e Produtos do Pedido)
select * from clients c 
inner join orders o ON c.idClient = o.idOrderClient
inner join productOrder p on p.idPOorder = o.idOrder;

-- Consulta detalhada unindo Clientes, Pedidos e Itens do Pedido
select * from clients c 
inner join orders o on c.idClient = o.idOrderClient
inner join productOrder p on p.idPOorder = o.idOrder;

-- Recuperar quantos pedidos foram realizados pelos clientes?
select c.idClient, Fname, count(*) as Number_of_orders 
from clients c 
inner join orders o ON c.idClient = o.idOrderClient
inner join productOrder p on p.idPOorder = o.idOrder
group by idClient;

select * from orders;
select * from clients c inner join orders o on c.idClient = o.idOrderClient
					inner join productOrder p on p.idPOorder = o.idOrder;


