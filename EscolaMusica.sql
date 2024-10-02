CREATE DATABASE EscolaDeMusica;

USE EscolaDeMusica;

CREATE TABLE Alunos (
 Matricula INT PRIMARY KEY,
 Nome VARCHAR(255) NOT NULL,
 Telefone VARCHAR(15),
 Endereco VARCHAR(255),
 DataNascimento DATE,
 InstrumentoPrincipal VARCHAR(50)
);

CREATE TABLE Professores (
 ID_Professor INT PRIMARY KEY,
 Nome VARCHAR(255) NOT NULL,
 Especialidade VARCHAR(100),
 Telefone VARCHAR(15)
);

-- Aluno 1
INSERT INTO Alunos (Matricula, Nome, Telefone, Endereco, DataNascimento, InstrumentoPrincipal)
VALUES (1, 'João Silva', '(11) 98765-4321', 'Rua A, 123', '2005-08-15', 'Violão');
-- Aluno 2
INSERT INTO Alunos (Matricula, Nome, Telefone, Endereco, DataNascimento, InstrumentoPrincipal)
VALUES (2, 'Maria Oliveira', '(11) 97654-3210', 'Rua B, 456', '2002-03-28', 'Piano');
-- Aluno 3
INSERT INTO Alunos (Matricula, Nome, Telefone, Endereco, DataNascimento, InstrumentoPrincipal)
VALUES (3, 'Pedro Santos', '(11) 96543-2109', 'Rua C, 789', '2004-11-02', 'Bateria');
-- Aluno 4
INSERT INTO Alunos (Matricula, Nome, Telefone, Endereco, DataNascimento, InstrumentoPrincipal)
VALUES (4, 'Ana Pereira', '(11) 95432-1098', 'Rua D, 1011', '2006-06-20', 'Violino');
-- Aluno 5
INSERT INTO Alunos (Matricula, Nome, Telefone, Endereco, DataNascimento, InstrumentoPrincipal)
VALUES (5, 'Lucas Souza', '(11) 94321-0987', 'Rua E, 1213', '2003-09-05', 'Violão');

-- Professor 1
INSERT INTO Professores (ID_Professor, Nome, Especialidade, Telefone)
VALUES (1, 'Carlos Martins', 'Violão', '(11) 91111-2222');
-- Professor 2
INSERT INTO Professores (ID_Professor, Nome, Especialidade, Telefone)
VALUES (2, 'Laura Almeida', 'Piano', '(11) 92222-3333');
-- Professor 3
INSERT INTO Professores (ID_Professor, Nome, Especialidade, Telefone)
VALUES (3, 'Ricardo Pereira', 'Bateria', '(11) 93333-4444');

SELECT * FROM Alunos;

SELECT Nome, Telefone FROM Professores;SELECT * FROM Alunos WHERE InstrumentoPrincipal = 'Violão';

SELECT * FROM Professores WHERE Especialidade = 'Piano';
