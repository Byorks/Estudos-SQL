https://dontpad.com/senai234banco
--------------------------------------------------


CREATE DATABASE UniversoMarvel;

USE UniversoMarvel;

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

SELECT * FROM Herois_Batalhas

-- Adicionando Batalhas Épicas
INSERT INTO Batalhas (Local, Ano) VALUES
('Nova York', 2012), -- Batalha de Nova York 
('Sokovia', 2015); -- Batalha de Sokovia 


-- Quem Lutou em Cada Batalha?
INSERT INTO Herois_Batalhas (ID_Heroi, ID_Batalha) VALUES
(1, 1), (2, 1), (3, 1), (4, 1), (6, 1), -- Heróis na Batalha de Nova York
(1, 2), (2, 2), (3, 2), (4, 2), (5, 2), (6, 2), (7, 2); -- Heróis na Batalha de Sokovia

-- Os Vilões por trás das Batalhas
INSERT INTO Viloes_Batalhas (ID_Vilao, ID_Batalha) VALUES
(4, 1), -- Loki na Batalha de Nova York
(1, 2); -- Thanos na Batalha de Sokovia

SELECT * FROM Viloes ORDER BY Nome_Vilao;

SELECT * FROM Viloes WHERE Ano_Criacao < 1980;

SELECT DISTINCT Planeta_Origem FROM Herois; -- 

SELECT Nome_Heroi, Habilidades FROM Herois WHERE Habilidades LIKE '%Super força%'; --com determinado conteúdo

SELECT Nome_Heroi, Planeta_Origem FROM Herois WHERE Planeta_Origem <> 'Terra'; -- diferença

SELECT * FROM Viloes ORDER BY Ano_Criacao ASC; --Ordenar uma tabela por ordem ascendente 
SELECT * FROM Viloes ORDER BY Ano_Criacao DESC; -- Ordenar uma tabela por ordem descendente 

-- Salvar esse arquivo localmente no seu pc, na pasta com seu nome, use o nome de "DB_UniversoMarvel_V2.sql" 
-- Anexar e entregar no classroom no dia de ontem e de hoje, dias 25 e 26 de setembro/24
-- fim da aula 26/09






								