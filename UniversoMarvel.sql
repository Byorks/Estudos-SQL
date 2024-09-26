CREATE DATABASE UniversoMavel; 

-- Criando Tabela Herois
CREATE TABLE Herois (
	-- Contagem vai de um em um 1,1, come�a 1 e depois passa para 2
	ID_Heroi INT PRIMARY KEY IDENTITY(1,1),
	Nome_Heroi VARCHAR(255) NOT NULL,
	Nome_Real VARCHAR(255),
	Ano_Criacao INT,
	Planeta_Origem VARCHAR(255),
	-- Max utiliza todo o espa�o dispon�vel
	Habilidades VARCHAR (Max)
);

CREATE TABLE Equipes (
	ID_Equipe INT PRIMARY KEY IDENTITY(1,1),
	Nome_Equipe VARCHAR(255) NOT NULL,
	Base_Operacoes VARCHAR(255)
);

CREATE TABLE Herois_Equipes (
	-- Tabela que relaciona os herois e as equipes
	ID_Heroi INT ,
	ID_Equipe INT,
	PRIMARY KEY ( ID_Heroi, ID_Equipe),
	FOREIGN KEY ( ID_Heroi) REFERENCES Herois(ID_Heroi),
	FOREIGN KEY (ID_Equipe) REFERENCES Equipes (ID_Equipe)
);

-- Criando Tabela de Viloes
CREATE TABLE Viloes (
	ID_Vilao INT PRIMARY KEY IDENTITY (1,1),
	Nome_Vilao VARCHAR(255) NOT NULL,
	Habilidades VARCHAR (MAX),
	Ano_Criacao INT
);

-- Tabela de Herois e Viloes
CREATE TABLE Herois_Viloes (
	ID_Heroi INT,
	id_Vilao INT,
	PRIMARY KEY (ID_Heroi, ID_Vilao),
	FOREIGN KEY (ID_Heroi) REFERENCES Herois (ID_Heroi),
	FOREIGN KEY (ID_Vilao) REFERENCES Viloes (ID_Vilao)
);

--Criando Tabela Batalhas
CREATE TABLE Batalhas (
	--Depois vou ter que alterar o volume para singular
	ID_Batalhas INT PRIMARY KEY IDENTITY (1,1),
	Local VARCHAR NOT NULL,
	ANO INT
);

-- Criando a tabela Herois_Batalhas
CREATE TABLE Herois_Batalhas (
	ID_Heroi INT,
	ID_Batalha INT,
	PRIMARY KEY (ID_Heroi, ID_Batalha),
	FOREIGN KEY (ID_Heroi) REFERENCES Herois(ID_Heroi),
	FOREIGN KEY (ID_Batalha) REFERENCES Batalhas(ID_Batalhas)
);

-- Criando tabela Viloes_Batalhas 
CREATE TABLE Vil�es_Batalhas (
	ID_Vilao INT,
	ID_Batalha INT,
	PRIMARY KEY (ID_Vilao, ID_Batalha),
	FOREIGN KEY (ID_Vilao) REFERENCES Viloes (ID_Vilao),
	FOREIGN KEY (ID_Batalha) REFERENCES Batalhas (ID_Batalhas)
);

INSERT INTO Herois (Nome_Heroi, Nome_Real, Ano_Criacao, Planeta_Origem, Habilidades) VALUES
('Homem-Aranha', 'Peter Parker', 1962, 'Terra', 'Super for�a, Agilidade, Sentido Aranha'),
('Capt�o Am�rica', 'Steve Rogers', 1941,'Terra', 'Super for�a, Agilidade, Escudo Vibranium'),
('Homem de Ferro', 'Tony Stark', 1963, 'Terra', 'Armadura tecnologica, Voo, Inteligencia genial');

SELECT * FROM Herois

INSERT INTO Herois (Nome_Heroi,Nome_Real,Ano_Criacao,Planeta_Origem,Habilidades) VALUES
-- Para inserir dados do tipo texto, � preciso ter aspas simples no in�cio e no final de cada inser��o
('Thor', 'Thor Odinson', 1962, 'Asgard','Controle do trov�o, Super for�a, Longividade'),
('Hulk', 'Bruce Banner', 1962, 'Terra', 'Super For�a, Fator de Cura'),
('Vi�va Negra', 'Natasha Romanoff', 1964, 'Terra', 'Espionagem, Combate corpo-a-corpo, Acrobacias'),
('Gavi�o Arqueiro', 'Clint Barton', 1964, 'Terra', 'Arqueria, Combate t�tico');


INSERT INTO Equipes (Nome_Equipe, Base_Operacoes) VALUES 
('Vingadores', 'Torre dos Vingadores'),
('X-Men', 'Mans�o X');

INSERT INTO Herois_Equipes (ID_Heroi, ID_Equipe) VALUES
(1,1), -- Homem Aranha nos Vingadores
(2,1), -- Capit�o Am�rica nos Vingadores
(3,1), -- Homem de Ferro nos Vingadores
(4,1); -- Thor nos Vingadores

SELECT * FROM Herois_Equipes

INSERT INTO Viloes (Nome_Vilao, Habilidades, Ano_Criacao) VALUES
('Thanos', 'Super for�a, Intelig�ncia, Manopla do Infinito', 1973),
('Caveira', 'For�a, Lideran�a, Cubo C�smico', 1947),
('Duende Verde', 'For�a, G�nio da qu�mica, Equipamento do Duende', 1964),
('Loki', 'Ilus�es, Feiti�aria, Manipula��o', 1949);


SELECT * FROM Viloes