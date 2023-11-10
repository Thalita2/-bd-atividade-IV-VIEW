CREATE DATABASE RelatorioPag;

DROP DATABASE RelatorioPag;

USE RelatorioPag;

CREATE TABLE Clientes (
ClienteId INT AUTO_INCREMENT PRIMARY KEY,
Nome VARCHAR(255) NOT NULL,
Endereco VARCHAR(255) NOT NULL,
Cidade VARCHAR(255) NOT NULL
);

INSERT INTO Clientes (ClienteId, Nome, Endereco, Cidade) VALUES (1, 'João', 'Rua dos Beija Flores', 'Salvador');
INSERT INTO Clientes (ClienteId, Nome, Endereco, Cidade) VALUES (2, 'Pedro', 'Rua da Saudade', 'Conde');
INSERT INTO Clientes (ClienteId, Nome, Endereco, Cidade) VALUES (3, 'Thalita', 'Ruas dos Antes', 'Barra Itariri');
INSERT INTO Clientes (ClienteId, Nome, Endereco, Cidade) VALUES (4, 'Maria', 'Rua das Gaivotas', 'Arembepe');
INSERT INTO Clientes (ClienteId, Nome, Endereco, Cidade) VALUES (5, 'Camila', 'Rua das Flores', 'Jauá');

 CREATE TABLE Pagamentos (
PagamentoId INT AUTO_INCREMENT PRIMARY KEY,
ClienteId INT NOT NULL,
DataPagamento DATE NOT NULL,
ValorPagamento DOUBLE NOT NULL,
FOREIGN KEY (ClienteId) REFERENCES Clientes(ClienteId)
);

INSERT INTO Pagamentos (PagamentoId, ClienteId, DataPagamento, ValorPagamento) VALUES (1, 1, '2023-01-10', 100.00);
INSERT INTO Pagamentos (PagamentoId, ClienteId, DataPagamento, ValorPagamento) VALUES (2, 1, '2023-02-15', 75.50);
INSERT INTO Pagamentos (PagamentoId, ClienteId, DataPagamento, ValorPagamento) VALUES (3, 2, '2023-02-20', 200.00);
INSERT INTO Pagamentos (PagamentoId, ClienteId, DataPagamento, ValorPagamento) VALUES (4, 3, '2023-03-05', 50.25);
INSERT INTO Pagamentos (PagamentoId, ClienteId, DataPagamento, ValorPagamento) VALUES (5, 4, '2023-04-01', 300.75); 
    
CREATE VIEW relatorios_pagamentos AS
SELECT c.Cidade AS nome_cidade, SUM(p.ValorPagamento) AS valor_total_pagamentos
FROM Clientes c
LEFT JOIN Pagamentos p ON c.ClienteId = p.ClienteId
GROUP BY c.Cidade;   
    
SELECT * FROM relatorios_pagamentos;    

