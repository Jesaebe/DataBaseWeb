/* Lógico_1 (3): */
DROP DATABASE IF EXISTS clinica_santa_clara;

CREATE DATABASE clinica_santa_clara;
USE clinica_santa_clara;

CREATE TABLE Endereco (
    codEndereco INTEGER PRIMARY KEY,
    logradouro VARCHAR(100),
    complemento VARCHAR(100),
    numero VARCHAR(20),
    CEP VARCHAR(20),
    cidade VARCHAR(150),
    bairro VARCHAR(100),
    uf CHAR(2)
);

CREATE TABLE Riscos_Ocupacionais (
    codRisco SMALLINT UNSIGNED PRIMARY KEY,
    nomeRisco VARCHAR(100)
);

CREATE TABLE Cargo (
    nomeCargo VARCHAR(100),
    codCargo SMALLINT UNSIGNED PRIMARY KEY
);

CREATE TABLE Paciente (
    CPF VARCHAR(11) PRIMARY KEY,
    nome VARCHAR(100),
    telefone VARCHAR(15),
    dtNasc DATE,
    email VARCHAR(100),
    fk_codEndereco INTEGER
);

CREATE TABLE Empresa (
    telefone VARCHAR(15),
    razaoSocial VARCHAR(100),
    CNPJ VARCHAR(14) PRIMARY KEY,
    email VARCHAR(100),
    fk_codEndereco INTEGER
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

CREATE TABLE Cargos_Riscos (
    fk_codCargo SMALLINT UNSIGNED,
    fk_codRisco SMALLINT UNSIGNED 
);

CREATE TABLE Trabalha_Para_Paciente_Empresa_Cargo (
    fk_CPF VARCHAR(11),
    fk_CNPJ VARCHAR(14),
    fk_codCargo SMALLINT UNSIGNED,
    dataEntrada DATE,
    dataSaida DATE
);


ALTER TABLE Paciente ADD CONSTRAINT FK_Paciente_2
    FOREIGN KEY (fk_codEndereco)
    REFERENCES Endereco (codEndereco)
    ON DELETE CASCADE;
 
ALTER TABLE Empresa ADD CONSTRAINT FK_Empresa_2
    FOREIGN KEY (fk_codEndereco)
    REFERENCES Endereco (codEndereco)
    ON DELETE CASCADE;
 
ALTER TABLE Agendamento ADD CONSTRAINT FK_Agendamento_2
    FOREIGN KEY (fk_Medico)
    REFERENCES Medico (CRM)
    ON DELETE CASCADE;
 
ALTER TABLE Agendamento ADD CONSTRAINT FK_Agendamento_3
    FOREIGN KEY (fk_CNPJ)
    REFERENCES Empresa (CNPJ);
 
ALTER TABLE Agendamento ADD CONSTRAINT FK_Agendamento_4
    FOREIGN KEY (fk_CPF)
    REFERENCES Paciente (CPF);
 
ALTER TABLE Cargos_Riscos ADD CONSTRAINT FK_Cargos_Riscos_1
    FOREIGN KEY (fk_codCargo)
    REFERENCES Cargo (codCargo)
    ON DELETE RESTRICT;
 
ALTER TABLE Cargos_Riscos ADD CONSTRAINT FK_Cargos_Riscos_2
    FOREIGN KEY (fk_codRisco)
    REFERENCES Riscos_Ocupacionais (codRisco)
    ON DELETE SET NULL;
 
ALTER TABLE Trabalha_Para_Paciente_Empresa_Cargo ADD CONSTRAINT FK_Trabalha_Para_Paciente_Empresa_Cargo_1
    FOREIGN KEY (fk_CPF)
    REFERENCES Paciente (CPF)
    ON DELETE NO ACTION;
 
ALTER TABLE Trabalha_Para_Paciente_Empresa_Cargo ADD CONSTRAINT FK_Trabalha_Para_Paciente_Empresa_Cargo_2
    FOREIGN KEY (fk_CNPJ)
    REFERENCES Empresa (CNPJ)
    ON DELETE NO ACTION;
 
ALTER TABLE Trabalha_Para_Paciente_Empresa_Cargo ADD CONSTRAINT FK_Trabalha_Para_Paciente_Empresa_Cargo_3
    FOREIGN KEY (fk_codCargo)
    REFERENCES Cargo (codCargo)
    ON DELETE NO ACTION;
 
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


