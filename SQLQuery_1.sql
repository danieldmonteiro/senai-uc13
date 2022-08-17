--DDL
CREATE DATABASE BdJogoRpg
GO

USE BdJogoRpg
GO

CREATE TABLE Usuarios(
    IdUsuario INT PRIMARY KEY IDENTITY,
    Email VARCHAR(100) UNIQUE NOT NULL,
    Senha VARCHAR(30) NOT NULL,
    Apelido VARCHAR(20) UNIQUE NOT NULL
)
GO

CREATE TABLE Classes(
    IdClasse INT PRIMARY KEY IDENTITY,
    Nome VARCHAR(30) UNIQUE NOT NULL,
    Descricao VARCHAR(255)
)
GO

CREATE TABLE Personagens(
    IdPersonagem INT PRIMARY KEY IDENTITY,
    Nome VARCHAR(30) UNIQUE NOT NULL,
    Descricao VARCHAR(255),
    IdUsuario INT UNIQUE FOREIGN KEY REFERENCES Usuarios(IdUsuario),
    IdClasse INT FOREIGN KEY REFERENCES Classes(IdClasse)
)
GO

CREATE TABLE Habilidades(
    IdHabilidade INT PRIMARY KEY IDENTITY,
    Nome VARCHAR(50) UNIQUE NOT NULL,
    Descricao VARCHAR(255)
)
GO

CREATE TABLE ClassesHabilidades(
    IdClasse INT FOREIGN KEY REFERENCES Classes(IdClasse),
    IdHabilidade INT FOREIGN KEY REFERENCES Habilidades(IdHabilidade)
)
GO

--DML
INSERT INTO Usuarios(Email, Senha, Apelido) VALUES('email@email.com', 1234, 'Daniel')
INSERT INTO Classes VALUES('Bárbaro', 'Descrição do Bárbaro')
INSERT INTO Habilidades VALUES('Lança Mortal', 'Descrição da Lança Mortal'),('Escudo Supremo','Descrição do Escudo Supremo')
INSERT INTO Personagens VALUES('DeuBug', 'Descrição DeuBug', 1, 1)
INSERT INTO ClassesHabilidades VALUES(1, 1),(1, 2)

INSERT INTO Usuarios VALUES('email@email2.com', 1234, 'Rambo')
INSERT INTO Classes VALUES('Monge', 'Descrição do Monge')
INSERT INTO Habilidades VALUES('Recuperar Vida', 'Descrição Recuperar Vida')
INSERT INTO Personagens VALUES('BitBug', 'Descrição do BitBug', 2, 2)
INSERT INTO ClassesHabilidades VALUES(2, 2), (2, 3)

UPDATE Usuarios SET Senha = 123456 WHERE IdUsuario = 1


--DQL
SELECT * FROM Usuarios
SELECT * FROM Classes
SELECT * FROM Habilidades
SELECT Senha, Email FROM Usuarios

--Seleciona tudo de tudo
SELECT * FROM Personagens INNER JOIN Classes ON Personagens.IdClasse = Classes.IdClasse

--Seleciona apenas as colunas solicitadas
SELECT Personagens.Nome, Classes.Nome, Classes.Descricao FROM Personagens INNER JOIN Classes ON Personagens.IdClasse = Classes.IdClasse

SELECT P.Nome, C.Nome 'Classe', C.Descricao FROM Personagens P JOIN Classes C ON P.IdClasse = C.IdClasse

--Exemplos de JOIN
CREATE DATABASE ExemploJoin
GO

USE ExemploJoin
GO

CREATE TABLE NomeA(
    Nome VARCHAR(50) NOT NULL
)
GO

CREATE TABLE NomeB(
    Nome VARCHAR(50) NOT NULL
)
GO

INSERT INTO NomeA VALUES('Fernanda'), ('Maria'), ('Luiz'), ('Caique')
INSERT INTO NomeB VALUES('Luiz'), ('Caique'), ('Odirlei'), ('Jéssica')

--JOIN (INNER JOIN) - Traz somente onde há equivalência
SELECT * FROM NomeA JOIN NomeB ON NomeA.Nome = NomeB.Nome

--LEFT JOIN - Traz todos os elementos da primeira tabela citada e suas equivalências na segunda tabela
SELECT * FROM NomeA LEFT JOIN NomeB ON NomeA.Nome = NomeB.Nome

--RIGHT JOIN - Inverso do LEFT JOIN
SELECT * FROM NomeA RIGHT JOIN NomeB ON NomeA.Nome = NomeB.Nome

--FULL OUTER JOIN - Traz todos os elementos
SELECT * FROM NomeA FULL OUTER JOIN NomeB ON NomeA.Nome = NomeB.Nome


