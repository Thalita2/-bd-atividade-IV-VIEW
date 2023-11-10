CREATE DATABASE Loja;

DROP DATABASE Loja;

USE Loja;

CREATE TABLE Produto (
ProdutoId INT AUTO_INCREMENT PRIMARY KEY,
Nome VARCHAR(255) NOT NULL,
PrecoUnitario DOUBLE NOT NULL,
Categoria VARCHAR(255) NOT NULL
);

INSERT INTO Produto (ProdutoId, Nome, PrecoUnitario, Categoria) VALUES (1, 'Caderno', 35.00, 'Papelaria');
INSERT INTO Produto (ProdutoId, Nome, PrecoUnitario, Categoria) VALUES (2, 'Salgadinho', 5.00, 'Comida');
INSERT INTO Produto (ProdutoId, Nome, PrecoUnitario, Categoria) VALUES (3, 'Notebook', 3.000, 'Tecnologia');
INSERT INTO Produto (ProdutoId, Nome, PrecoUnitario, Categoria) VALUES (4, 'Arroz', 4.00, 'Comida');
INSERT INTO Produto (ProdutoId, Nome, PrecoUnitario, Categoria) VALUES (5, 'Detergente', 15.00, 'Limpeza');


CREATE TABLE Estoque (
ProdutoId INT NOT NULL,
Quantidade INT NOT NULL,
FOREIGN KEY (ProdutoId) REFERENCES Produto (ProdutoId)
);

INSERT INTO Estoque (ProdutoId, Quantidade) VALUES (1, 6);
INSERT INTO Estoque (ProdutoId, Quantidade) VALUES (1, 7);
INSERT INTO Estoque (ProdutoId, Quantidade) VALUES (2, 8);
INSERT INTO Estoque (ProdutoId, Quantidade) VALUES (3, 9);
INSERT INTO Estoque (ProdutoId, Quantidade) VALUES (4, 10);
INSERT INTO Estoque (ProdutoId, Quantidade) VALUES (5, 11);


CREATE VIEW estoque_critico AS
SELECT p.Nome AS p_nome, e.quantidade AS e_Quantidade
FROM Produto p
INNER JOIN Estoque e ON p.ProdutoId = e.ProdutoId
WHERE e.quantidade < 15000;


SELECT * FROM estoque_critico;