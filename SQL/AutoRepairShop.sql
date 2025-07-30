CREATE TABLE Cliente (
    idCliente INT PRIMARY KEY,
    nome VARCHAR(50),
    telefone VARCHAR(15)
);

CREATE TABLE Veiculo (
    idCarro INT PRIMARY KEY,
    idCliente INT,
    tipo INT,
    descricao VARCHAR(50),
    FOREIGN KEY idCliente REFERENCES Cliente(idCliente)
);

CREATE TABLE Equipe (
    idEquipe INT PRIMARY KEY,
    nome VARCHAR(25)
);

CREATE TABLE Mecanico (
    idMecanico INT PRIMARY KEY,
    idEquipe INT,
    codigo VARCHAR(10),
    nome VARCHAR(50),
    endereco VARCHAR(50),
    especialidade INT,
    FOREIGN KEY idEquipe REFERENCES Equipe(idEquipe)
);

CREATE TABLE Servico (
    idServico INT PRIMARY KEY,
    descricao VARCHAR(50),
    valor FLOAT
);

CREATE TABLE OS (
    idOS INT PRIMARY KEY,
    idVeiculo INT,
    idEquipe INT,
    numero INT,
    dataEmissao DATE,
    valor FLOAT,
    statusOS INT,
    dataConclusao DATE,
    FOREIGN KEY idVeiculo REFERENCES Veiculo(idVeiculo),
    FOREIGN KEY idEquipe REFERENCES Equipe(idEquipe)
);