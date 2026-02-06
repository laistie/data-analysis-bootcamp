CREATE TYPE oficina.veiculotipo AS ENUM ('Carro', 'Moto', 'Outro');
CREATE TYPE oficina.especialidade AS ENUM ('Mecânica Geral', 'Elétrica', 'Funilaria', 'Pintura', 'Diagnóstico');
CREATE TYPE oficina.servicostatus AS ENUM ('Em análise', 'Aguardando equipe', 'Trabalhando', 'Concluído');

CREATE TABLE oficina.Pessoa (
    idPessoa INT PRIMARY KEY,
    pnome VARCHAR(20) NOT NULL,
    snome VARCHAR(20) NOT NULL,
    CPF CHAR(9) NOT NULL,
    telefone CHAR(11) NOT NULL,
    endereco VARCHAR(50)
);

CREATE TABLE oficina.Cliente (
    idCliente INT PRIMARY KEY,
    idPessoa INT,
    CONSTRAINT fk_cliente_pessoa FOREIGN KEY (idPessoa)
        REFERENCES oficina.Pessoa(idPessoa)
);

CREATE TABLE oficina.Veiculo (
    idVeiculo INT PRIMARY KEY,
    idCliente INT,
    tipo oficina.veiculotipo,
    descricao VARCHAR(50),
    CONSTRAINT fk_veiculo_cliente FOREIGN KEY (idCliente)
        REFERENCES oficina.Cliente(idCliente)
);

CREATE TABLE oficina.Equipe (
    idEquipe INT PRIMARY KEY,
    nome VARCHAR(25)
);

CREATE TABLE oficina.Mecanico (
    idMecanico INT PRIMARY KEY,
    idPessoa INT,
    idEquipe INT,
    codigo CHAR(5),
    espMecanico oficina.especialidade,
    CONSTRAINT fk_mecanico_pessoa FOREIGN KEY (idPessoa)
        REFERENCES oficina.Pessoa(idPessoa),
    CONSTRAINT fk_mecanico_equipe FOREIGN KEY (idEquipe) 
        REFERENCES oficina.Equipe(idEquipe)
);

CREATE TABLE oficina.Servico (
    idServico INT PRIMARY KEY,
    descricao VARCHAR(50),
    valor FLOAT
);

CREATE TABLE oficina.OS (
    idOS INT PRIMARY KEY,
    idVeiculo INT,
    idEquipe INT,
    codigo CHAR(6),
    valor FLOAT,
    statusOS oficina.servicostatus,
    dataEmissao DATE,
    dataConclusao DATE,
    CONSTRAINT fk_os_veiculo FOREIGN KEY (idVeiculo)
        REFERENCES oficina.Veiculo(idVeiculo),
    CONSTRAINT fk_os_equipe FOREIGN KEY (idEquipe)
        REFERENCES oficina.Equipe(idEquipe)
);