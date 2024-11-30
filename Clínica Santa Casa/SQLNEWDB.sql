/* Lógico_1 (3): */
DROP DATABASE IF EXISTS clinica_santa_clara;

CREATE DATABASE clinica_santa_clara;
USE clinica_santa_clara;


CREATE TABLE Empresa (
    CNPJ VARCHAR(14) PRIMARY KEY,
    telefone VARCHAR(15),
    razaoSocial VARCHAR(100),
    email VARCHAR(100),
	endereco JSON CHECK (JSON_VALID(endereco))
);

CREATE TABLE Paciente (
    CPF VARCHAR(11) PRIMARY KEY,
    nome VARCHAR(100),
    telefone VARCHAR(15),
    dtNasc DATE,
    email VARCHAR(100),
	endereco JSON CHECK (JSON_VALID(endereco))
);

CREATE TABLE Cargo (
    nomeCargo VARCHAR(100),
    codCargo SMALLINT UNSIGNED PRIMARY KEY
);

CREATE TABLE Exame (
    codExame SMALLINT PRIMARY KEY,
    especialidade VARCHAR(50)
);

CREATE TABLE Medico (
    CRM VARCHAR(12) PRIMARY KEY,
    nome VARCHAR(100),
    telefone VARCHAR(15),
    email VARCHAR(100)
);

CREATE TABLE Agendamento (
    fk_CNPJ VARCHAR(14),
    fk_CPF VARCHAR(11),
    dataSolicitacao DATE,
    observacoes TEXT,
    dataAvaliacao DATE,
    parecer ENUM('apto', 'inapto'),
    dataRealizacaoExame DATE,
    status ENUM('agendado', 'exames_realizados', 'aguardando_resultados', 'aguardando_parecer_médico', 'cancelado', 'finalizado'),
    tipoExame ENUM('admissional', 'demissional', 'periodico'),
    dataAgendamento DATE,
    fk_Medico VARCHAR(12),
    PRIMARY KEY (dataSolicitacao, fk_CNPJ, fk_CPF)
);

CREATE TABLE Riscos_Ocupacionais (
    codRisco SMALLINT UNSIGNED PRIMARY KEY,
    nomeRisco VARCHAR(100)
);

CREATE TABLE Cargos_Riscos (
	fk_CPF VARCHAR(11),
    fk_CNPJ VARCHAR(14),
    fk_codCargo SMALLINT UNSIGNED,
    fk_codRisco SMALLINT UNSIGNED
);


ALTER TABLE Agendamento ADD CONSTRAINT FK_Agendamento_Medico
    FOREIGN KEY (fk_Medico)
    REFERENCES Medico (CRM)
    ON DELETE CASCADE;
   
ALTER TABLE Agendamento ADD CONSTRAINT FK_Agendamento_CNPJ
    FOREIGN KEY (fk_CNPJ)
    REFERENCES Empresa (CNPJ);
  
ALTER TABLE Agendamento ADD CONSTRAINT FK_Agendamento_CPF
    FOREIGN KEY (fk_CPF)
    REFERENCES Paciente (CPF);

ALTER TABLE Cargos_Riscos ADD CONSTRAINT FK_Cargos_Riscos_CPF
    FOREIGN KEY (fk_CPF)
    REFERENCES Paciente (CPF)
    ON DELETE SET NULL;

ALTER TABLE Cargos_Riscos ADD CONSTRAINT FK_Cargos_Riscos_CNPJ
    FOREIGN KEY (fk_CNPJ)
    REFERENCES Empresa (CNPJ)
    ON DELETE SET NULL;
   
ALTER TABLE Cargos_Riscos ADD CONSTRAINT FK_Cargos_Riscos_Cargo
    FOREIGN KEY (fk_codCargo)
    REFERENCES Cargo (codCargo)
    ON DELETE RESTRICT;
 
ALTER TABLE Cargos_Riscos ADD CONSTRAINT FK_Cargos_Riscos_Riscos_Ocupacionais
    FOREIGN KEY (fk_codRisco)
    REFERENCES Riscos_Ocupacionais (codRisco)
    ON DELETE SET NULL;
   
CREATE TABLE Exames_Realizados (
    fk_codExame SMALLINT,
    ULR_resultado_Laboratorial VARCHAR(255),
    fk_CPF VARCHAR(11),
    fk_CNPJ VARCHAR(14),
    fk_dataSolicitacao DATE,
    PRIMARY KEY (fk_codExame, fk_CPF, fk_CNPJ, fk_dataSolicitacao),
    FOREIGN KEY (fk_codExame) REFERENCES Exame(codExame),
    FOREIGN KEY (fk_CPF) REFERENCES Agendamento(fk_CPF),
    FOREIGN KEY (fk_CNPJ) REFERENCES Agendamento(fk_CNPJ),
    FOREIGN KEY (fk_dataSolicitacao) REFERENCES Agendamento(dataSolicitacao)
);

INSERT INTO Empresa (telefone, razaoSocial, CNPJ, email, endereco)
VALUES
('1134567890', 'Empresa ABC', '12345678000195', 'contato@empresaabc.com', 
 '{"logradouro": "Rua das Flores", "complemento": "Apto 101", "numero": "123", "CEP": "12345-678", "cidade": "São Paulo", "bairro": "Centro", "uf": "SP"}'),
('2145678901', 'Empresa XYZ', '98765432000182', 'contato@empresaxyz.com', 
 '{"logradouro": "Avenida Paulista", "complemento": "", "numero": "987", "CEP": "98765-432", "cidade": "São Paulo", "bairro": "Bela Vista", "uf": "SP"}'),
('3156789012', 'Empresa 123', '23456789000145', 'contato@empresa123.com', 
 '{"logradouro": "Rua das Oliveiras", "complemento": "Casa", "numero": "45", "CEP": "54321-678", "cidade": "Rio de Janeiro", "bairro": "Botafogo", "uf": "RJ"}'),
('3234567890', 'Empresa DEF', '34567890000196', 'contato@empresadef.com', 
 '{"logradouro": "Rua das Palmeiras", "complemento": "Apto 202", "numero": "678", "CEP": "67890-123", "cidade": "São Paulo", "bairro": "Jardim Paulista", "uf": "SP"}'),
('4245678901', 'Empresa GHI', '45678901000197', 'contato@empresaghi.com', 
 '{"logradouro": "Avenida Brasil", "complemento": "", "numero": "654", "CEP": "54321-876", "cidade": "Rio de Janeiro", "bairro": "Laranjeiras", "uf": "RJ"}'),
('5334567890', 'Empresa JKL', '56789012000198', 'contato@empresajkl.com', 
 '{"logradouro": "Rua das Acácias", "complemento": "Bloco A", "numero": "321", "CEP": "67890-456", "cidade": "São Paulo", "bairro": "Vila Mariana", "uf": "SP"}'),
('6445678901', 'Empresa MNO', '67890123000199', 'contato@empresamno.com', 
 '{"logradouro": "Avenida Atlântica", "complemento": "", "numero": "222", "CEP": "98765-123", "cidade": "Rio de Janeiro", "bairro": "Copacabana", "uf": "RJ"}'),
('6445678902', 'Empresa PQR', '78945612000199', 'contato@empresapqr.com', 
 '{"logradouro": "Rua das Palmeiras", "complemento": "Apto 303", "numero": "789", "CEP": "67890-321", "cidade": "São Paulo", "bairro": "Jardim Paulista", "uf": "SP"}'),
('7556789012', 'Empresa STU', '89012345000191', 'contato@empresastu.com', 
 '{"logradouro": "Rua das Andorinhas", "complemento": "Casa 12", "numero": "456", "CEP": "23456-789", "cidade": "Rio de Janeiro", "bairro": "Ipanema", "uf": "RJ"}'),
('1122335566', 'Empresa VWX', '89012345000156', 'contato@empresavwx.com', 
 '{"logradouro": "Rua da Esperança", "complemento": "Apto 404", "numero": "345", "CEP": "12345-789", "cidade": "São Paulo", "bairro": "Vila Nova", "uf": "SP"}');

INSERT INTO Paciente (CPF, nome, telefone, dtNasc, email, endereco)
VALUES
('12345678901', 'Maria Silva', '11987654321', '1980-05-10', 'maria.silva@example.com', 
 '{"logradouro": "Rua das Flores", "complemento": "Apto 101", "numero": "123", "CEP": "12345-678", "cidade": "São Paulo", "bairro": "Centro", "uf": "SP"}'),
('98765432100', 'João Souza', '11987654322', '1975-11-22', 'joao.souza@example.com', 
 '{"logradouro": "Avenida Paulista", "complemento": "", "numero": "987", "CEP": "98765-432", "cidade": "São Paulo", "bairro": "Bela Vista", "uf": "SP"}'),
('23456789012', 'Ana Oliveira', '11987654323', '1990-02-15', 'ana.oliveira@example.com', 
 '{"logradouro": "Rua das Oliveiras", "complemento": "Casa", "numero": "45", "CEP": "54321-678", "cidade": "Rio de Janeiro", "bairro": "Botafogo", "uf": "RJ"}'),
('34567890123', 'Pedro Almeida', '11987654327', '1985-03-10', 'pedro.almeida@example.com', 
 '{"logradouro": "Rua das Palmeiras", "complemento": "Apto 202", "numero": "678", "CEP": "67890-123", "cidade": "São Paulo", "bairro": "Jardim Paulista", "uf": "SP"}'),
('45678901234', 'Laura Costa', '11987654328', '1992-07-25', 'laura.costa@example.com', 
 '{"logradouro": "Avenida Brasil", "complemento": "", "numero": "654", "CEP": "54321-876", "cidade": "Rio de Janeiro", "bairro": "Laranjeiras", "uf": "RJ"}'),
('56789012345', 'Cláudia Rodrigues', '11987654329', '1988-09-15', 'claudia.rodrigues@example.com', 
 '{"logradouro": "Rua das Acácias", "complemento": "Bloco A", "numero": "321", "CEP": "67890-456", "cidade": "São Paulo", "bairro": "Vila Mariana", "uf": "SP"}'),
('67890123456', 'Juliana Silva', '11987654330', '1984-12-05', 'juliana.silva@example.com', 
 '{"logradouro": "Avenida Atlântica", "complemento": "", "numero": "222", "CEP": "98765-123", "cidade": "Rio de Janeiro", "bairro": "Copacabana", "uf": "RJ"}'),
('78945612300', 'Carlos Santos', '11987654331', '1978-01-20', 'carlos.santos@example.com', 
 '{"logradouro": "Rua das Palmeiras", "complemento": "Apto 303", "numero": "789", "CEP": "67890-321", "cidade": "São Paulo", "bairro": "Jardim Paulista", "uf": "SP"}'),
('89012345678', 'Luciana Martins', '11987654332', '1985-04-12', 'luciana.martins@example.com', 
 '{"logradouro": "Rua das Andorinhas", "complemento": "Casa 12", "numero": "456", "CEP": "23456-789", "cidade": "Rio de Janeiro", "bairro": "Ipanema", "uf": "RJ"}'),
('87654321098', 'Gustavo Pereira', '11987654333', '1989-04-20', 'gustavo.pereira@example.com', 
 '{"logradouro": "Rua da Esperança", "complemento": "Apto 404", "numero": "345", "CEP": "12345-789", "cidade": "São Paulo", "bairro": "Vila Nova", "uf": "SP"}'),
('98712365400', 'Juliana Costa', '11987654334', '1994-12-30', 'juliana.costa@example.com', 
 '{"logradouro": "Avenida Liberdade", "complemento": "Bloco B", "numero": "567", "CEP": "98765-678", "cidade": "São Paulo", "bairro": "Liberdade", "uf": "SP"}'),
('11223344556', 'Fernanda Lima', '11987654335', '1982-06-17', 'fernanda.lima@example.com', 
 '{"logradouro": "Rua do Sol", "complemento": "Casa", "numero": "100", "CEP": "11222-333", "cidade": "São Paulo", "bairro": "Moema", "uf": "SP"}'),
('22334455667', 'Roberto Costa', '11987654336', '1979-04-22', 'roberto.costa@example.com', 
 '{"logradouro": "Rua da Lua", "complemento": "Apto 505", "numero": "111", "CEP": "44556-789", "cidade": "Rio de Janeiro", "bairro": "Barra", "uf": "RJ"}');

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

INSERT INTO Medico (CRM, nome, telefone, email)
VALUES
('CRM001', 'Dr. Carlos Alberto', '11987654324', 'dr.carlos@example.com'),
('CRM002', 'Dra. Beatriz Costa', '11987654325', 'dra.beatriz@example.com'),
('CRM003', 'Dr. Eduardo Lima', '11987654326', 'dr.eduardo@example.com'),
('CRM004', 'Dr. Fernanda Silva', '11987654327', 'dr.fernanda@example.com');

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
('89012345000191', '98712365400', '2024-08-16', 'Paciente com anemia.', '2024-08-18', 'inapto', '2024-08-17', 'aguardando_resultados', 'periodico', '2024-08-16', 'CRM003'),
('56789012000198', '11223344556', '2024-08-10', 'Paciente com sintomas de dor.', '2024-08-12', 'apto', '2024-08-11', 'finalizado', 'admissional', '2024-08-10', 'CRM004');


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

INSERT INTO Cargos_Riscos (fk_CPF, fk_CNPJ, fk_codCargo, fk_codRisco)
VALUES
('12345678901', '12345678000195', 1, 1),
('98765432100', '98765432000182', 2, 2),
('23456789012', '23456789000145', 3, 3),
('34567890123', '34567890000196', 4, 4),
('45678901234', '45678901000197', 5, 5),
('56789012345', '56789012000198', 6, 6),
('67890123456', '67890123000199', 7, 7),
('78945612300', '78945612000199', 8, 8),
('89012345678', '89012345000191', 9, 9),
('87654321098', '89012345000156', 10, 10),
('98712365400', '23456789000145', 11, 11),
('11223344556', '56789012000198', 12, 12),
('22334455667', '67890123000199', 13, 13);


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
(11, 'http://resultados.lab.com/exame11', '98712365400', '89012345000156', '2024-08-16'),
(12, 'http://resultados.lab.com/exame12', '11223344556', '56789012000198', '2024-08-10');

