CREATE DATABASE Empresa;

DROP DATABASE Empresa;

USE Empresa;

CREATE TABLE Categorias(
CategoriaId INT AUTO_INCREMENT PRIMARY KEY,
Nome VARCHAR(255) NOT NULL, 
Descricao VARCHAR(255) NOT NULL
);

INSERT INTO Categorias (CategoriaId, Nome, Descricao) VALUES (1, 'Limpeza', 'Algo para limpeza');
INSERT INTO Categorias (CategoriaId, Nome, Descricao) VALUES (2, 'Higiene', 'Algo para higiene');
INSERT INTO Categorias (CategoriaId, Nome, Descricao) VALUES (3, 'Comida', 'Algo para comer');
    
    
CREATE TABLE Produtos(
ProdutoId INT AUTO_INCREMENT PRIMARY KEY,
CategoriaId INT NOT NULL,
Nome VARCHAR(255) NOT NULL, 
PrecoUnitario DOUBLE NOT NULL,
FOREIGN KEY (CategoriaId) REFERENCES Categorias(CategoriaId)
);

INSERT INTO Produtos (ProdutoId, Nome, PrecoUnitario, CategoriaId) VALUES (1, 'Vassoura', 10.00, 1);
INSERT INTO Produtos (ProdutoId, Nome, PrecoUnitario, CategoriaId) VALUES (2, 'Sabao', 20.00, 2);
INSERT INTO Produtos (ProdutoId, Nome, PrecoUnitario, CategoriaId) VALUES (3, 'Feijao', 15.00, 1);
   

CREATE VIEW relatorio_produtos AS
SELECT c.Nome AS nome_categoria, COUNT(p.ProdutoId) AS quantidade_de_produtos
FROM Categorias c
LEFT JOIN Produtos p ON c.CategoriaId = p.CategoriaId
GROUP BY c.Nome;

SELECT * FROM relatorio_produtos;