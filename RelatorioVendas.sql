CREATE DATABASE RelatorioV;

DROP DATABASE RelatorioV;

USE RelatorioV;

CREATE TABLE Funcionarios(
FuncionarioId INT AUTO_INCREMENT PRIMARY KEY,
Nome VARCHAR(255) NOT NULL, 
Cargo VARCHAR(255) NOT NULL,
Salario DOUBLE NOT NULL
);

INSERT INTO Funcionarios (FuncionarioId, Nome, Cargo, Salario) VALUES (1, 'João', 'Vendedor', 1200.00);
INSERT INTO Funcionarios (FuncionarioId, Nome, Cargo, Salario) VALUES (2, 'Carla', 'Gerente', 5000.00);
INSERT INTO Funcionarios (FuncionarioId, Nome, Cargo, Salario) VALUES (3, 'Luísa', 'Vendedor', 1200.00);
INSERT INTO Funcionarios (FuncionarioId, Nome, Cargo, Salario) VALUES (4, 'Marcelo', 'Vendedor', 1200.00);
INSERT INTO Funcionarios (FuncionarioId, Nome, Cargo, Salario) VALUES (5, 'Júlia', 'Vendedor', 1200.00);
    
 CREATE TABLE Vendas(
 VendaId INT AUTO_INCREMENT PRIMARY KEY NOT NULL, 
 FuncionarioId INT NOT NULL,
 DataVenda DATE NOT NULL, 
 ValorVenda DOUBLE NOT NULL,
 FOREIGN KEY (FuncionarioId) REFERENCES Funcionarios(FuncionarioId)
 );

INSERT INTO Vendas (VendaId, FuncionarioId, DataVenda, ValorVenda) VALUES (1, 1, '2023-01-10', 80.00);
INSERT INTO Vendas (VendaId, FuncionarioId, DataVenda, ValorVenda) VALUES (2, 1, '2023-02-15', 55.50);
INSERT INTO Vendas (VendaId, FuncionarioId, DataVenda, ValorVenda) VALUES (3, 2, '2023-02-20', 200.00);
INSERT INTO Vendas (VendaId, FuncionarioId, DataVenda, ValorVenda) VALUES (4, 3, '2023-03-05', 34.00);
INSERT INTO Vendas (VendaId, FuncionarioId, DataVenda, ValorVenda) VALUES (5, 4, '2023-04-01', 400.75);
    
    
CREATE VIEW relatorio_vendas AS
SELECT f.Nome AS nome_funcionario, COUNT(v.VendaId) AS numero_vendas, SUM(v.ValorVenda) AS valor_total_vendas
FROM Funcionarios f
LEFT JOIN Vendas v ON f.FuncionarioId = v.FuncionarioId
GROUP BY f.Nome;

SELECT * FROM relatorio_vendas;