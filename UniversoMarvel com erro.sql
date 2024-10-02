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

-- Revisar
-- Tabela de Herois e Viloes
CREATE TABLE Herois_Viloes (
	ID_Heroi INT,
	id_Vilao INT,
	PRIMARY KEY (ID_Heroi, ID_Vilao),
	FOREIGN KEY (ID_Heroi) REFERENCES Herois (ID_Heroi),
	FOREIGN KEY (ID_Vilao) REFERENCES Viloes (ID_Vilao)
);
--Depois vou ter que alterar o volume para singular
--Criando Tabela Batalhas
CREATE TABLE Batalhas (
	ID_Batalhas INT PRIMARY KEY IDENTITY (1,1),
	Local VARCHAR(40) NOT NULL,
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

INSERT INTO Herois_Viloes (ID_Heroi, ID_Vilao) VALUES
(1,3), -- Homem-Aranha x Duende Verde
(2,2), -- Capit�o Am�rica x Duende Verde
(3,4), -- Homem de Ferro x Loki
(4,1); -- Thor x Thanos

SELECT * FROM Batalhas

INSERT INTO Batalhas (Local, ANO) VALUES
('Nova York', 2012), --Batalha de Nova York
('Sokovia', 2015); --Batalha de Sokovia

-- Alterando o valor de VARCHAR porque errei o valor l� em cima
ALTER TABLE Batalhas ALTER COLUMN Local VARCHAR(40);

-- Quem lutou em Cada Batalha?
INSERT INTO Herois_Batalhas (ID_Heroi, ID_Batalha) VALUES
(1,1),(2,1),(3,1),(4,1),(6,1), -- Herois na Batalha de Nova York
(1,2),(2,2),(3,2),(4,2),(5,2),(6,2),(7,2); -- Herois na Batalha de Sokovia

-- Os Vil�es por tr�s das Batalhas
INSERT INTO Vil�es_Batalhas (ID_Vilao, ID_Batalha) VALUES
(4,1), -- Loki na Batalha de Nova York
(1,2); -- Thanos na Batalha de Sokovia

SELECT * FROM Herois_Batalhas

SELECT * FROM Vil�es_Batalhas

SELECT * FROM Herois WHERE Ano_Criacao = 1962;

-- Selecione todos os vi��es e ordene pela coluna Nome_Vilao
SELECT * FROM Viloes ORDER BY Nome_Vilao;
-- Selecione todos os vil�es que o ano de cria�ao seja menor que 1980
SELECT * FROM Viloes WHERE Ano_Criacao < 1980;

SELECT DISTINCT Planeta_Origem FROM Herois; -- Os nomes distintos

SELECT Nome_Heroi, Habilidades FROM Herois WHERE Habilidades LIKE '%Super for�a%'; -- Com determinado conte�do

SELECT Nome_Heroi, Planeta_Origem FROM Herois WHERE Planeta_Origem <> 'Terra'; -- Diferen�a

SELECT * FROM Viloes ORDER BY Ano_Criacao ASC; -- Ordem Crescente - Ordenar uma tabela por ordem ascendente

SELECT * FROM Viloes ORDER BY Ano_Criacao DESC; -- Ordem Descrescente - Ordenar uma table apor ordem descendente

