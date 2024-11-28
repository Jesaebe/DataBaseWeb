-- Inserindo valores na tabela Endereco
INSERT INTO Endereco (codEndereco, logradouro, complemento, numero, CEP, cidade, bairro, uf)
VALUES
(1, 'Rua das Flores', 'Apto 101', '123', '12345-678', 'São Paulo', 'Centro', 'SP'),
(2, 'Avenida Paulista', '', '987', '98765-432', 'São Paulo', 'Bela Vista', 'SP'),
(3, 'Rua das Oliveiras', 'Casa', '45', '54321-678', 'Rio de Janeiro', 'Botafogo', 'RJ'),
(4, 'Rua das Palmeiras', 'Apto 202', '678', '67890-123', 'São Paulo', 'Jardim Paulista', 'SP'),
(5, 'Avenida Brasil', '', '654', '54321-876', 'Rio de Janeiro', 'Laranjeiras', 'RJ'),
(6, 'Rua das Acácias', 'Bloco A', '321', '67890-456', 'São Paulo', 'Vila Mariana', 'SP'),
(7, 'Avenida Atlântica', '', '222', '98765-123', 'Rio de Janeiro', 'Copacabana', 'RJ'),
(8, 'Rua das Palmeiras', 'Apto 303', '789', '67890-321', 'São Paulo', 'Jardim Paulista', 'SP'),
(9, 'Rua das Andorinhas', 'Casa 12', '456', '23456-789', 'Rio de Janeiro', 'Ipanema', 'RJ'),
(10, 'Rua da Esperança', 'Apto 404', '345', '12345-789', 'São Paulo', 'Vila Nova', 'SP'),
(11, 'Avenida Liberdade', 'Bloco B', '567', '98765-678', 'São Paulo', 'Liberdade', 'SP'),
(12, 'Rua do Sol', 'Casa', '100', '11222-333', 'São Paulo', 'Moema', 'SP'),
(13, 'Rua da Lua', 'Apto 505', '111', '44556-789', 'Rio de Janeiro', 'Barra', 'RJ'),
(14, 'Rua dos Jacarandás', 'Apto 303', '202', '11223-334', 'São Paulo', 'Vila Mariana', 'SP'),
(15, 'Rua das Flores', 'Casa', '78', '22334-445', 'Rio de Janeiro', 'Jardim Botânico', 'RJ'),
(16, 'Avenida Central', 'Bloco 5', '56', '33445-556', 'São Paulo', 'Vila Nova', 'SP'),
(17, 'Rua das Acácias', 'Apto 505', '85', '44556-667', 'Rio de Janeiro', 'Zona Sul', 'RJ'),
(18, 'Rua do Comércio', 'Loja 1', '99', '55667-778', 'São Paulo', 'Bela Vista', 'SP'),
(19, 'Rua do Sol', 'Apto 202', '45', '66778-889', 'São Paulo', 'Vila Madalena', 'SP'),
(20, 'Avenida das Palmeiras', 'Casa', '22', '77889-990', 'Rio de Janeiro', 'Copacabana', 'RJ');


-- Inserindo valores na tabela Riscos_Ocupacionais
INSERT INTO Riscos_Ocupacionais (codRisco, nomeRisco)
VALUES
(1, 'Ruído'),
(2, 'Produtos Químicos'),
(3, 'Ergonomia'),
(4, 'Radiação'),
(5, 'Máquinas Pesadas'),
(6, 'Queda de Altura'),
(7, 'Incêndio'),
(8, 'Exposição ao Calor'),
(9, 'Vibrações'),
(10, 'Exposição a Ruído'),
(11, 'Radiação Ionizante'),
(12, 'Trabalho Noturno'),
(13, 'Pressão Alta'),
(14, 'Sobrecarga de Trabalho'),
(15, 'Falta de Equipamento de Proteção'),
(16, 'Ambiente Insalubre'),
(17, 'Vibrações Excessivas'),
(18, 'Estresse Ocupacional'),
(19, 'Trabalho em Altura'),
(20, 'Ruído Excessivo'),
(21, 'Perigos Químicos'),
(22, 'Trabalho com Máquinas');



-- Inserindo valores na tabela Cargo
INSERT INTO Cargo (codCargo, nomeCargo)
VALUES
(1, 'Enfermeiro'),
(2, 'Técnico de Segurança'),
(3, 'Administrador'),
(4, 'Técnico de Enfermagem'),
(5, 'Auxiliar Administrativo'),
(6, 'Técnico de Laboratório'),
(7, 'Gerente de Projetos'),
(8, 'Coordenador de Saúde'),
(9, 'Analista de Segurança'),
(10, 'Especialista em TI'),
(11, 'Supervisor de Produção'),
(12, 'Assistente Administrativo'),
(13, 'Consultor de TI'),
(14, 'Supervisor de Saúde'),
(15, 'Técnico de Manutenção'),
(16, 'Especialista em Segurança'),
(17, 'Analista de Qualidade'),
(18, 'Consultor de Projetos'),
(19, 'Coordenador Administrativo'),
(20, 'Assistente de RH'),
(21, 'Consultor de Processos'),
(22, 'Gerente de TI');



-- Inserindo valores na tabela Paciente
INSERT INTO Paciente (CPF, nome, telefone, dtNasc, email, fk_codEndereco)
VALUES
('12345678901', 'Maria Silva', '11987654321', '1980-05-10', 'maria.silva@example.com', 1),
('98765432100', 'João Souza', '11987654322', '1975-11-22', 'joao.souza@example.com', 2),
('23456789012', 'Ana Oliveira', '11987654323', '1990-02-15', 'ana.oliveira@example.com', 3),
('34567890123', 'Pedro Almeida', '11987654327', '1985-03-10', 'pedro.almeida@example.com', 4),
('45678901234', 'Laura Costa', '11987654328', '1992-07-25', 'laura.costa@example.com', 5),
('56789012345', 'Cláudia Rodrigues', '11987654329', '1988-09-15', 'claudia.rodrigues@example.com', 6),
('67890123456', 'Juliana Silva', '11987654330', '1984-12-05', 'juliana.silva@example.com', 7),
('78945612300', 'Carlos Santos', '11987654331', '1978-01-20', 'carlos.santos@example.com', 8),
('89012345678', 'Luciana Martins', '11987654332', '1985-04-12', 'luciana.martins@example.com', 9),
('87654321098', 'Gustavo Pereira', '11987654333', '1989-04-20', 'gustavo.pereira@example.com', 10),
('98712365400', 'Juliana Costa', '11987654334', '1994-12-30', 'juliana.costa@example.com', 11),
('11223344556', 'Fernanda Lima', '11987654335', '1982-06-17', 'fernanda.lima@example.com', 12),
('22334455667', 'Roberto Costa', '11987654336', '1979-04-22', 'roberto.costa@example.com', 13);



-- Inserindo valores na tabela Empresa
INSERT INTO Empresa (telefone, razaoSocial, CNPJ, email, fk_codEndereco)
VALUES
('1134567890', 'Empresa ABC', '12345678000195', 'contato@empresaabc.com', 1),
('2145678901', 'Empresa XYZ', '98765432000182', 'contato@empresaxyz.com', 2),
('3156789012', 'Empresa 123', '23456789000145', 'contato@empresa123.com', 3),
('3234567890', 'Empresa DEF', '34567890000196', 'contato@empresadef.com', 4),
('4245678901', 'Empresa GHI', '45678901000197', 'contato@empresaghi.com', 5),
('5334567890', 'Empresa JKL', '56789012000198', 'contato@empresajkl.com', 6),
('6445678901', 'Empresa MNO', '67890123000199', 'contato@empresamno.com', 7),
('6445678902', 'Empresa PQR', '78945612000199', 'contato@empresapqr.com', 8),
('7556789012', 'Empresa STU', '89012345000191', 'contato@empresastu.com', 9),
('1122335566', 'Empresa VWX', '89012345000156', 'contato@empresavwx.com', 10),
('2233446677', 'Empresa YZ', '90123456000167', 'contato@empresayz.com', 11),
('1145678901', 'Empresa UVW', '56789012000100', 'contato@empresauv.com', 12),
('2256789012', 'Empresa RST', '67890123000101', 'contato@empresarst.com', 13),
('1145678902', 'Empresa STV', '67890123000102', 'contato@empresastv.com', 14),
('2256789013', 'Empresa UVW', '78901234000103', 'contato@empresauv.com', 15),
('3367890123', 'Empresa WXY', '89012345000104', 'contato@empresawxy.com', 16),
('4478901234', 'Empresa ZAB', '90123456000105', 'contato@empresa.zab.com', 17),
('5589012345', 'Empresa CDE', '01234567000106', 'contato@empresacde.com', 18),
('6690123456', 'Empresa EFG', '12345678000107', 'contato@empresaefg.com', 19),
('7701234567', 'Empresa HIJ', '23456789000108', 'contato@empresa.hij.com', 20);

-- Inserindo valores na tabela Exame
INSERT INTO Exame (codExame, especialidade)
VALUES
(1, 'Cardiologia'),
(2, 'Oftalmologia'),
(3, 'Ortopedia'),
(4, 'Dermatologia'),
(5, 'Gastroenterologia'),
(6, 'Neurologia'),
(7, 'Pneumologia'),
(8, 'Otorinolaringologia'),
(9, 'Urologia'),
(10, 'Reumatologia'),
(11, 'Hematologia'),
(12, 'Oftalmologia Pediátrica'),
(13, 'Endocrinologia'),
(14, 'Cardiologia Pediátrica'),
(15, 'Nefrologia'),
(16, 'Alergologia'),
(17, 'Imunologia'),
(18, 'Pneumologia Pediátrica'),
(19, 'Oftalmologia Avançada'),
(20, 'Geriatria'),
(21, 'Medicina de Família'),
(22, 'Hematologia Pediátrica');



-- Inserindo valores na tabela Medico
INSERT INTO Medico (CRM, nome, telefone, email)
VALUES
('CRM001', 'Dr. Carlos Alberto', '11987654324', 'dr.carlos@example.com'),
('CRM002', 'Dra. Beatriz Costa', '11987654325', 'dra.beatriz@example.com'),
('CRM003', 'Dr. Eduardo Lima', '11987654326', 'dr.eduardo@example.com'),
('CRM004', 'Dr. Fernanda Silva', '11987654327', 'dr.fernanda@example.com');



-- Tabela Agendamento
INSERT INTO Agendamento 
(fk_CNPJ, fk_CPF, dataSolicitacao, observacoes, dataAvaliacao, parecer, dataRealizacaoExame, status, tipoExame, dataAgendamento, fk_Medico)
VALUES
('12345678000195', '12345678901', '2024-08-01', 'Paciente apresenta tosse leve.', '2024-08-03', 'apto', '2024-08-02', 'finalizado', 'admissional', '2024-04-01', 'CRM001'),
('12345678000195', '98765432100', '2024-08-02', 'Paciente diabético.', '2024-08-04', 'apto', '2024-08-03', 'aguardando_parecer_médico', 'periodico', '2024-04-02', 'CRM001'),
('98765432000182', '23456789012', '2024-08-03', 'Pressão alta observada.', '2024-08-05', 'inapto', '2024-08-04', 'finalizado', 'demissional', '2024-08-03', 'CRM002'),
('34567890000196', '34567890123', '2024-08-05', 'Paciente com dor nas costas.', '2024-08-07', 'apto', '2024-08-06', 'finalizado', 'admissional', '2024-08-05', 'CRM001'),
('45678901000197', '45678901234', '2024-08-06', 'Paciente com histórico de alergias.', '2024-08-08', 'apto', '2024-08-07', 'aguardando_resultados', 'periodico', '2024-08-06', 'CRM002'),
('56789012000198', '56789012345', '2023-11-01', 'Paciente com dor de cabeça crônica.', '2023-11-03', 'apto', '2023-11-02', 'finalizado', 'admissional', '2023-11-01', 'CRM002'),
('67890123000199', '67890123456', '2023-11-02', 'Paciente com tosse persistente.', '2023-11-04', 'apto', '2023-11-03', 'aguardando_resultados', 'periodico', '2023-11-02', 'CRM001'),
('78945612000199', '78945612300', '2024-08-08', 'Paciente com histórico de doenças respiratórias.', '2024-08-10', 'apto', '2024-08-09', 'finalizado', 'admissional', '2024-08-08', 'CRM003'),
('89012345000191', '89012345678', '2024-08-09', 'Paciente com sintomas de febre.', '2024-08-11', 'inapto', '2024-08-10', 'aguardando_resultados', 'periodico', '2024-08-09', 'CRM001'),
('89012345000156', '87654321098', '2024-08-15', 'Paciente com dores articulares.', '2024-08-17', 'apto', '2024-08-16', 'finalizado', 'admissional', '2024-08-15', 'CRM003'),
('90123456000167', '98712365400', '2024-08-16', 'Paciente com anemia.', '2024-08-18', 'inapto', '2024-08-17', 'aguardando_resultados', 'periodico', '2024-08-16', 'CRM003'),
('56789012000100', '11223344556', '2024-08-10', 'Paciente com sintomas de dor.', '2024-08-12', 'apto', '2024-08-11', 'finalizado', 'admissional', '2024-08-10', 'CRM004');

-- Inserindo valores na tabela Cargos_Riscos
INSERT INTO Cargos_Riscos (fk_codCargo, fk_codRisco)
VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10),
(11, 11),
(12, 12),
(13, 13),
(14, 14),
(15, 15),
(16, 16),
(17, 17),
(18, 18),
(19, 19),
(20, 20),
(21, 21),
(22, 22);




-- Inserindo valores na tabela Trabalha_Para_Paciente_Empresa_Cargo
INSERT INTO Trabalha_Para_Paciente_Empresa_Cargo (fk_CPF, fk_CNPJ, fk_codCargo, dataEntrada, dataSaida)
VALUES
('12345678901', '12345678000195', 1, '2020-01-01', '2024-08-01'),
('98765432100', '98765432000182', 2, '2019-06-01', '2024-08-02'),
('23456789012', '23456789000145', 3, '2021-03-15', '2024-08-03'),
('34567890123', '34567890000196', 4, '2022-01-01', NULL),
('45678901234', '45678901000197', 5, '2023-01-01', NULL),
('56789012345', '56789012000198', 6, '2023-05-01', NULL),
('67890123456', '67890123000199', 7, '2023-06-01', NULL),
('78945612300', '78945612000199', 8, '2022-02-01', NULL),
('89012345678', '89012345000191', 9, '2022-05-01', NULL),
('87654321098', '89012345000156', 10, '2024-03-01', NULL),
('98712365400', '90123456000167', 11, '2024-04-01', NULL),
('11223344556', '56789012000100', 12, '2024-07-01', NULL),
('22334455667', '67890123000101', 13, '2024-08-01', NULL);



-- Inserindo valores na tabela Exames_Realizados
INSERT INTO Exames_Realizados (fk_codExame, ULR_resultado_Laboratorial, fk_CPF, fk_CNPJ, fk_dataSolicitacao)
VALUES
(1, NULL, '12345678901', '12345678000195', '2024-08-01'),
(2, null, '98765432100', '98765432000182', '2024-08-02'),
(2, null, '23456789012', '98765432000182', '2024-08-03'),
(3, 'http://resultados.lab.com/exame3', '23456789012', '98765432000182', '2024-08-03'),
(4, 'http://resultados.lab.com/exame4', '34567890123', '34567890000196', '2024-08-05'),
(5, 'http://resultados.lab.com/exame5', '45678901234', '45678901000197', '2024-08-06'),
(2, 'http://resultados.lab.com/exame6', '67890123456', '67890123000199', '2023-11-02'),
(1, NULL, '56789012345', '56789012000198', '2023-11-01'),
(8, 'http://resultados.lab.com/exame8', '78945612300', '78945612000199', '2024-08-08'),
(9, 'http://resultados.lab.com/exame9', '89012345678', '89012345000191', '2024-08-09'),
(10, 'http://resultados.lab.com/exame10', '87654321098', '89012345000156', '2024-08-15'),
(11, 'http://resultados.lab.com/exame11', '98712365400', '90123456000167', '2024-08-16'),
(12, 'http://resultados.lab.com/exame12', '11223344556', '56789012000100', '2024-08-10');


