-- Inserir departamentos
INSERT INTO departamento (nome, id_responsavel) VALUES
('Cardiologia', NULL),
('Pediatria', NULL),
('Urgência', NULL);

-- Inserir funcionários
INSERT INTO funcionario (nome, data_nascimento, nif, email, num_telefone, id_departamento) VALUES
('Doutor João Silva', '1975-03-12', '123456789', 'joao.silva@hospital.pt', '912345678', 1),
('Doutora Ana Costa', '1982-07-01', '987654321', 'ana.costa@hospital.pt', '913456789', 2),
('Enfermeira Rita Lopes', '1990-11-15', '456123789', 'rita.lopes@hospital.pt', '914567890', 3);

-- Atualizar responsáveis de departamento
UPDATE departamento SET id_responsavel = 1 WHERE id_departamento = 1;
UPDATE departamento SET id_responsavel = 2 WHERE id_departamento = 2;
UPDATE departamento SET id_responsavel = 3 WHERE id_departamento = 3;

-- Inserir utentes
INSERT INTO utente (nome, morada, num_telefone, email, sexo, data_nascimento, nif) VALUES
('Carlos Ferreira', 'Rua das Flores 123', '921234567', 'carlos.ferreira@gmail.com', 'Masculino', '1980-05-20', '123456789'),
('Maria Silva', 'Av. Liberdade 45', '922345678', 'maria.silva@gmail.com', 'Feminino', '1992-10-03', '987654321');

-- Inserir quartos
INSERT INTO quarto (numero, capacidade, tipo) VALUES
('101A', 2, 'Enfermaria'),
('202B', 1, 'Privado');

-- Inserir internamentos
INSERT INTO internamento (id_utente, id_quarto, data_inicio, data_fim) VALUES
(1, 1, '2025-04-01', '2025-04-10'),
(2, 2, '2025-04-05', '2025-04-15');

-- Inserir agendamentos
INSERT INTO agendamento (id_utente, id_funcionario, tipo, data_hora) VALUES
(1, 1, 'Consulta Cardiologia', '2025-04-20'),
(2, 2, 'Consulta Pediatria', '2025-04-21');

-- Inserir exames
INSERT INTO exame (id_agendamento, tipo_exame, resultado) VALUES
(1, 'ECG', 'Normal'),
(2, 'Raio-X', 'Sem alterações');

-- Inserir medicamentos
INSERT INTO medicamento (nome, stock) VALUES
('Paracetamol', 100),
('Ibuprofeno', 200);

-- Inserir prescrições
INSERT INTO prescricao (id_medicamento, dosagem, data) VALUES
(1, '500mg 2x ao dia', '2025-04-20'),
(2, '400mg 3x ao dia', '2025-04-21');

-- Inserir consultas
INSERT INTO consulta (id_agendamento, id_prescricao, id_exame) VALUES
(1, 1, 1),
(2, 2, 2);

-- Inserir ficheiros clínicos
INSERT INTO ficheiro_clinico (id_utente, id_consulta, doencas, alergias, observacoes_gerais) VALUES
(1, 1, 'Hipertensão', 'Penicilina', 'Paciente estável'),
(2, 2, 'Asma', 'Nenhuma', 'Recomenda-se acompanhamento');

-- Atualizar utentes com id_ficheiro_clinico
UPDATE utente SET id_ficheiro_clinico = 1 WHERE id_utente = 1;
UPDATE utente SET id_ficheiro_clinico = 2 WHERE id_utente = 2;
