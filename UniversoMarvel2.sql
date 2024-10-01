
CREATE DATABASE UniversoMarvel2;

USE UniversoMarvel2;

-- Criando tabela Herois
CREATE TABLE Herois (
	ID_Heroi INT PRIMARY KEY IDENTITY(1,1),
	Nome_Heroi VARCHAR(255) NOT NULL,
	Nome_Real VARCHAR(255),
	Ano_Criacao INT,
	Planeta_Origem VARCHAR(255),
	Habilidades VARCHAR (Max)
);

CREATE TABLE Equipes (
	ID_Equipe INT PRIMARY KEY IDENTITY(1,1),
	Nome_Equipe VARCHAR(255) NOT NULL,
	Base_Operacoes VARCHAR(255)
);

CREATE TABLE Herois_Equipes (
	ID_Heroi INT,
	ID_Equipe INT,
	PRIMARY KEY (ID_Heroi, ID_Equipe),
	FOREIGN KEY (ID_Heroi) REFERENCES Herois(ID_Heroi),
	FOREIGN KEY (ID_Equipe) REFERENCES Equipes(ID_Equipe)
);

-- Criando Tabela de Viloes
CREATE TABLE Viloes (
	ID_Vilao INT PRIMARY KEY IDENTITY(1,1),
	Nome_Vilao VARCHAR(255) NOT NULL,
	Habilidades VARCHAR (MAX),
	Ano_Criacao INT
);

-- Tabela de Herois e Viloes
CREATE TABLE Herois_Viloes (
	ID_Heroi INT,
	ID_Vilao INT,
	PRIMARY KEY (ID_Heroi, ID_Vilao),
	FOREIGN KEY (ID_Heroi) REFERENCES Herois(ID_Heroi),
	FOREIGN KEY (ID_Vilao) REFERENCES Viloes(ID_Vilao)
);

--Criando tabela Batalhas
CREATE TABLE Batalhas (
	ID_Batalha INT PRIMARY KEY IDENTITY (1,1),
	Local VARCHAR(255) NOT NULL,
	Ano INT
);


-- Criando a tabela Herois_Batalhas
CREATE TABLE Herois_Batalhas (
	ID_Heroi INT, 
	ID_Batalha INT,
	PRIMARY KEY (ID_Heroi, ID_Batalha),
	FOREIGN KEY (ID_Heroi) REFERENCES Herois(ID_Heroi),
	FOREIGN KEY (ID_Batalha) REFERENCES Batalhas(ID_Batalha)
);

-- Criando tabela Viloes_Batalhas
CREATE TABLE Viloes_Batalhas ( 
	ID_Vilao INT,
	ID_Batalha INT,
	PRIMARY KEY (ID_Vilao, ID_Batalha),
	FOREIGN KEY (ID_Vilao) REFERENCES Viloes (ID_Vilao),
	FOREIGN KEY (ID_Batalha) REFERENCES Batalhas(ID_Batalha)
);


INSERT INTO Herois (Nome_Heroi, Nome_Real, Ano_Criacao, Planeta_Origem, Habilidades) VALUES 
('Homem-Aranha', 'Peter Parker', 1962, 'Terra','Super força, Agilidade, Sentido Aranha'),
('Capitão América', 'Steve Rogers', 1941, 'Terra','Super força, Agilidade, Escudo Vibranium'),
('Homem de Ferro','Tony Stark',1963, 'Terra', 'Armadura tecnologica, Voo, Inteligencia genial');


SELECT * FROM Herois

INSERT INTO Herois (Nome_Heroi, Nome_Real, Ano_Criacao, Planeta_Origem, Habilidades) VALUES 
-- para inserir dados do tipo texto, é preciso ter aspas simples no início e no final de cada inserção 
('Thor','Thor Odinson', 1962,'Asgard','Controle do trovão, Super força, Longividade'),
('Hulk', 'Bruce Benner', 1962, 'Terra', 'Super força, Fator de Cura'),
('Viúva Negra', 'Natasha Romanoff', 1964,'Terra','Espionagem, Combate corpo-a-corpo, Acrobacias'),
('Gavião Arqueiro' , 'Clint Barton' , 1964 , 'Terra' , 'Arqueria, Combate tático');


INSERT INTO Equipes (Nome_Equipe, Base_Operacoes) VALUES
('Vingadores', 'Torre dos Vingadores'),
('X-Men', 'Mansão X');

INSERT INTO Herois_Equipes (ID_Heroi, ID_Equipe) VALUES
(1, 1),  -- Homem-Aranha nos Vingadores
(2, 1),  -- Capitão América nos Vingadores
(3, 1),  -- Homem de Ferro nos Vingadores 
(4, 1);  -- Thor nos Vingadores

INSERT INTO Viloes (Nome_Vilao, Habilidades, Ano_Criacao) VALUES
('Thanos', 'Super força, Inteligência, Manopla do Infinito', 1973),
('Caveira Vermelha', 'Força, Liderança, Cubo Cósmico', 1947),
('Duende Verde', 'Força, Gênio da química, Equipamento do Duende', 1964),
('Loki', 'Ilusões, Feitiçaria, Manipulação', 1949); 

-- Conectando Heróis e seus Arqui-inimigos
INSERT INTO Herois_Viloes (ID_Heroi, ID_Vilao) VALUES
(1, 3),  -- Homem-Aranha x Duende Verde
(2, 2),  -- Capitão América x Caveira Vermelha 
(3, 4),  -- Homem de Ferro x Loki
(4, 1);  -- Thor x Thanos 
	
	
INSERT INTO Batalhas (Local, ANO) VALUES
('Nova York', 2012), --Batalha de Nova York
('Sokovia', 2015); --Batalha de Sokovia

SELECT * FROM Batalhas

-- Quem lutou em Cada Batalha?
INSERT INTO Herois_Batalhas (ID_Heroi, ID_Batalha) VALUES
(1,1),(2,1),(3,1),(4,1),(6,1), -- Herois na Batalha de Nova York
(1,2),(2,2),(3,2),(4,2),(5,2),(6,2),(7,2); -- Herois na Batalha de Sokovia

-- Os Vilões por trás das Batalhas
INSERT INTO Viloes_Batalhas (ID_Vilao, ID_Batalha) VALUES
(4,1), -- Loki na Batalha de Nova York
(1,2); -- Thanos na Batalha de Sokovia

SELECT
	Viloes.Nome_Vilao,
	Viloes.Habilidades
FROM
	Viloes
JOIN Herois_Viloes ON Viloes.ID_Vilao = Herois_Viloes.ID_Vilao -- Pesquisando na tabela Herois e Viloes onde os IDs de Vilões sejam iguais aos Vilões da Tabela Herois e Viloes
WHERE
	Herois_Viloes.ID_Heroi = (SELECT ID_Heroi FROM Herois WHERE Herois.Nome_Heroi = 'Homem de Ferro');

DELETE FROM Herois WHERE ID_Heroi = 3;

-- Criar e apagar colunas
ALTER TABLE Herois DROP COLUMN Nome_Real; -- Apaga columa
ALTER TABLE Herois ADD Nascionalidade VARCHAR (200); --Adiciona uma coluna na tabela Herois
UPDATE Herois SET Planeta_Origem = 'Planeta X', Habilidades = 'Super Força Gama' WHERE Nome_Herois = 'Hulk';

-- É possível transformar um registro em Primary Key, ele tem que ser NOT NUll

sp_rename 'Herois.Planeta_Origem', 'PlanetaNatal';

sp_rename 'Viloes', 'Antagonistas';

SELECT v.Nome_Vilao
FROM Viloes v 
JOIN Herois_Viloes hv ON v.Nome_Vilao = hv.ID_Vilao
JOIN Herois h ON hv.ID_Heroi = h.ID_Heroi

INSERT INTO Herois (Nome_Heroi, Nome_Real, Ano_Criacao, Planeta_Origem, Habilidades) VALUES
('Wolverine', 'Logan', 1974, 'Terra', 'Fator cura acelerado, Garras retráteis de adamantium, sentidos aguçados');

SELECT * FROM Herois

INSERT INTO Equipes (Nome_Equipe, Base_Operacoes) VALUES
('Quarteto Fantástico', 'Edifício Baxter');

SELECT * FROM Equipes

INSERT INTO Viloes (Nome_Vilao, Ano_Criacao, Habilidades) VALUES 
('Magneto', 1963, 'Controle do magnetismo');

-- Descobrindo o ID do Wolverine e dos X-Men

INSERT INTO Herois_Equipes (ID_Heroi, ID_Equipe) VALUES
(8,2);

-- 1.4. Associando o Wolverine aos X-Men na tabela Herois_Equipes:
DECLARE @WolverineID INT;
SELECT @WolverineID = ID_HEROI FROM Herois WHERE Nome_Heroi = 'Wolverine';
DECLARE @XMenID INT;
SELECT @XMenID = ID_Equipe FROM Equipes WHERE Nome_Equipe = 'X-Men';

BEGIN
--1.5. Relacionando o Wolverine ao Magneto na tabela Herois_Viloes (ou Inimigos, caso tenha renomeado a tabela):
-- Obter os IDs do Wolverine e do Magneto:
-- Declara a Variável WolverineID
DECLARE @WolverineID1 INT; 
-- Seleciona a variável e atribui o valor de ID_Herois que fica na tabela heróis onde o nome do heroi na tabela é igual a Wolverine
SELECT @WolverineID1 = ID_Heroi FROM Herois WHERE Nome_Heroi = 'Wolverine'
PRINT @WoverineID;

DECLARE @MagnetoID INT;
SELECT @MagnetoID = ID_Vilao FROM Viloes WHERE Nome_Vilao = 'Magneto';

-- Inserir a relação na tabela
INSERT INTO Herois_Viloes (ID_Heroi, ID_Vilao) VALUES (@WolverineID, @MagnetoID);

END