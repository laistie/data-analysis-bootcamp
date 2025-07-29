CREATE TABLE Cliente (
    idCliente INT PRIMARY KEY,
    nome VARCHAR(45),
    cpf VARCHAR(45),
    contato VARCHAR(45)
);

CREATE TABLE Pedido (
    idPedido INT PRIMARY KEY,
    idCliente INT,
    servico VARCHAR(45),
    descricao VARCHAR(45),
    dataSolicitacao DATE,
    liberado BOOLEAN,
    FOREIGN KEY idCliente REFERENCES Cliente(idCliente)
);

CREATE TABLE Responsavel (
    idResponsavel INT PRIMARY KEY,
    nivelHelpdesk INT,
    nome VARCHAR(45),
    departamento VARCHAR(45)
);

CREATE TABLE OrdemdeServico (
    idOS INT PRIMARY KEY,
    idResponsavel INT,
    idPedido INT,
    statusOS VARCHAR(45),
    FOREIGN KEY idResponsavel REFERENCES Responsavel(idResponsavel),
    FOREIGN KEY idPedido REFERENCES Pedido (idPedido)
);