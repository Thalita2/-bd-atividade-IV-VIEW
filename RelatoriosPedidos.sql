CREATE DATABASE RelatorioP;

DROP DATABASE RelatorioP;

USE RelatorioP;

CREATE TABLE Cliente (
ClienteId INT AUTO_INCREMENT PRIMARY KEY,
Nome VARCHAR(255) NOT NULL,
Email VARCHAR(255) NOT NULL UNIQUE,
Telefone VARCHAR(255) NOT NULL
);

INSERT INTO Cliente(Nome, Email, Telefone) VALUES ('Thalita', 'thalita@gmail.com', "71985013844");
INSERT INTO Cliente(Nome, Email, Telefone) VALUES ('Thiago', 'thiago@gmail.com', "71987758626");
INSERT INTO Cliente(Nome, Email, Telefone) VALUES ('Maria', 'maria@gmail.com', "7132127026");
INSERT INTO Cliente(Nome, Email, Telefone) VALUES ('João', 'joao@gmail.com', "71988895734");
INSERT INTO Cliente(Nome, Email, Telefone) VALUES('Cristina', 'cristina@gmai.com', "71987183933");
 
 
CREATE TABLE Pedido (
PedidoId INT AUTO_INCREMENT PRIMARY KEY,
Nome VARCHAR(255) NOT NULL,
DataIncio DATE NOT NULL,
ValorTotal DOUBLE NOT NULL,
ClienteId INT NOT NULL,
FOREIGN KEY (ClienteId) REFERENCES Cliente(ClienteId)
);

INSERT INTO Pedido(Nome, DataIncio, ValorTotal, ClienteId) VALUES ('Vassoura', '2008-05-05', 50.00, 1); 

CREATE VIEW relatorios_pedidos_cliente  AS
SELECT C.Nome AS NomeCliente, COUNT(PedidoId) AS numeroPedido, SUM(ValorTotal) AS ValorTotal_Gasto
FROM Cliente c
LEFT JOIN Pedido p ON c.ClienteId = p.ClienteId
GROUP BY c.Nome;
 
SELECT * FROM relatorios_pedidos_cliente;
