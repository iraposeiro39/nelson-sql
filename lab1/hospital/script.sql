-- Criar e usar a base de dados hospital
CREATE DATABASE IF NOT EXISTS hospital;
USE hospital;

-- Criar tabela utente
CREATE TABLE utente (
	id_utente INT AUTO_INCREMENT PRIMARY KEY,
    nome TEXT NOT NULL,
    morada TEXT NOT NULL,
    num_telefone VARCHAR(9) NOT NULL,
    email VARCHAR(50) NOT NULL,
    sexo VARCHAR(6) NOT NULL,
    data_nascimento DATE NOT NULL,
    nif VARCHAR(20) NOT NULL,
    id_ficheiro_clinico INT, -- FK
	creation_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    modified_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
    -- FOREIGN KEY (id_ficheiro_clinico) REFERENCES ficheiro_clinico(id_ficheiro_clinico)
);

-- Criar tabela agendamento
CREATE TABLE agendamento (
	id_agendamento INT AUTO_INCREMENT PRIMARY KEY,
    id_utente INT NOT NULL, -- FK
    id_funcionario INT NOT NULL, -- FK
    tipo TEXT NOT NULL,
    data_hora DATE NOT NULL,
    creation_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    modified_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
	-- FOREIGN KEY (id_utente) REFERENCES utente(id_utente),
    -- FOREIGN KEY (id_funcionario) REFERENCES funcionario(id_funcionario)
);

-- Criar tabela ficheiro_clinico
CREATE TABLE ficheiro_clinico (
	id_ficheiro_clinico INT AUTO_INCREMENT PRIMARY KEY,
    id_utente INT NOT NULL, -- FK
    id_consulta INT, -- FK
    doencas TEXT,
    alergias TEXT,
    observacoes_gerais TEXT,
	creation_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    modified_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
	-- FOREIGN KEY (id_utente) REFERENCES utente(id_utente),
    -- FOREIGN KEY (id_consulta) REFERENCES consulta(id_consulta)
);

-- Criar tabela consulta
CREATE TABLE consulta (
	id_consulta INT AUTO_INCREMENT PRIMARY KEY,
    id_agendamento INT NOT NULL, -- FK
    id_prescricao INT NOT NULL, -- FK
    id_exame INT, -- FK
	creation_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    modified_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
    -- FOREIGN KEY (id_agendamento) REFERENCES agendamento(id_agendamento),
    -- FOREIGN KEY (id_prescricao) REFERENCES prescricao(id_prescricao),
    -- FOREIGN KEY (id_exame) REFERENCES exame(id_exame)
);

-- Criar tabela funcionarios
CREATE TABLE funcionario (
	id_funcionario INT AUTO_INCREMENT PRIMARY KEY,
	nome TEXT NOT NULL,
    data_nascimento DATE NOT NULL,
    nif VARCHAR(20) NOT NULL, 
    email VARCHAR(50) NOT NULL,
    num_telefone VARCHAR(9) NOT NULL,
	id_departamento INT NOT NULL, -- FK
	creation_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    modified_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
	-- FOREIGN KEY (id_departamento) REFERENCES departamento(id_departamento)
);

-- Criar tabela departamento
CREATE TABLE departamento (
    id_departamento INT AUTO_INCREMENT PRIMARY KEY,
    nome TEXT NOT NULL,
    id_responsavel INT NOT NULL, -- FK
	creation_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    modified_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
    -- FOREIGN KEY (id_responsavel) REFERENCES funcionario(id_funcionario)
);

-- Criar tabela internamento
CREATE TABLE internamento (
    id_internamento INT AUTO_INCREMENT PRIMARY KEY,
    id_utente INT NOT NULL, -- FK
    id_quarto INT NOT NULL, -- FK
    data_inicio DATE NOT NULL, 
    data_fim DATE NOT NULL,
	creation_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    modified_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
    -- FOREIGN KEY (id_utente) REFERENCES utente(id_utente),
    -- FOREIGN KEY (id_quarto) REFERENCES quarto(id_quarto)
);

-- Criar tabela quarto
CREATE TABLE quarto (
    id_quarto INT AUTO_INCREMENT PRIMARY KEY,
    numero VARCHAR(10) NOT NULL,
    capacidade INT NOT NULL,
    tipo VARCHAR(100) NOT NULL,
	creation_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    modified_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Criar tabela exame
CREATE TABLE exame (
    id_exame INT AUTO_INCREMENT PRIMARY KEY,
    id_agendamento INT NOT NULL, -- FK
    tipo_exame TEXT NOT NULL,
    resultado TEXT NOT NULL,
	creation_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    modified_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
    -- FOREIGN KEY (id_agendamento) REFERENCES agendamento(id_agendamento)
);

-- Criar tabela prescricao
CREATE TABLE prescricao (
    id_prescricao INT AUTO_INCREMENT PRIMARY KEY,
	id_medicamento INT NOT NULL, -- FK
	dosagem TEXT NOT NULL,
    data DATE NOT NULL,
	creation_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    modified_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
    -- FOREIGN KEY (id_medicamento) REFERENCES medicamento(id_medicamento)
);

-- Criar tabela medicamento
CREATE TABLE medicamento (
	id_medicamento INT AUTO_INCREMENT PRIMARY KEY,
    nome TEXT NOT NULL,
    stock INT NOT NULL,
	creation_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    modified_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Adicionar Foreign Keys às tabelas
ALTER TABLE utente
ADD CONSTRAINT
FOREIGN KEY (id_ficheiro_clinico) REFERENCES ficheiro_clinico(id_ficheiro_clinico);

ALTER TABLE agendamento
ADD CONSTRAINT
FOREIGN KEY (id_utente) REFERENCES utente(id_utente);

ALTER TABLE agendamento
ADD CONSTRAINT
FOREIGN KEY (id_funcionario) REFERENCES funcionario(id_funcionario);

ALTER TABLE ficheiro_clinico
ADD CONSTRAINT
FOREIGN KEY (id_utente) REFERENCES utente(id_utente);

ALTER TABLE ficheiro_clinico
ADD CONSTRAINT
FOREIGN KEY (id_consulta) REFERENCES consulta(id_consulta);

ALTER TABLE consulta
ADD CONSTRAINT
FOREIGN KEY (id_agendamento) REFERENCES agendamento(id_agendamento);

ALTER TABLE consulta
ADD CONSTRAINT
FOREIGN KEY (id_prescricao) REFERENCES prescricao(id_prescricao);

ALTER TABLE consulta
ADD CONSTRAINT
FOREIGN KEY (id_exame) REFERENCES exame(id_exame);

ALTER TABLE funcionario
ADD CONSTRAINT
FOREIGN KEY (id_departamento) REFERENCES departamento(id_departamento);

ALTER TABLE departamento
ADD CONSTRAINT
FOREIGN KEY (id_responsavel) REFERENCES funcionario(id_funcionario);

ALTER TABLE internamento
ADD CONSTRAINT
FOREIGN KEY (id_utente) REFERENCES utente(id_utente);

ALTER TABLE internamento
ADD CONSTRAINT
FOREIGN KEY (id_quarto) REFERENCES quarto(id_quarto);

ALTER TABLE exame
ADD CONSTRAINT
FOREIGN KEY (id_agendamento) REFERENCES agendamento(id_agendamento);

ALTER TABLE prescricao
ADD CONSTRAINT
FOREIGN KEY (id_medicamento) REFERENCES medicamento(id_medicamento);

-- DEBUG
-- DROP DATABASE hospital;