CREATE DATABASE UniversoMavel; 

-- Criando Tabela Herois
CREATE TABLE Herois (
	-- Contagem vai de um em um 1,1, começa 1 e depois passa para 2
	ID_Heroi INT PRIMARY KEY IDENTITY(1,1),
	Nome_Heroi VARCHAR(255) NOT NULL,
	Nome_Real VARCHAR(255),
	Ano_Criacao INT,
	Planeta_Origem VARCHAR(255),
	-- Max utiliza todo o espaço disponível
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