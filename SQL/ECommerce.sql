CREATE TABLE Produto (
    idProduto INT PRIMARY KEY,
    categoria VARCHAR(45),
    descricao VARCHAR(45),
    valor VARCHAR(45)
);

CREATE TABLE Fornecedor (
    idFornecedor INT PRIMARY KEY,
    razaoSocial VARCHAR(45),
    cnpj VARCHAR(45)
);

CREATE TABLE Cliente (
    idCliente INT PRIMARY KEY,
    nome VARCHAR(45),
    identificacao VARCHAR(45),
    endereco VARCHAR(45)
);

CREATE TABLE ContaCliente (
    idConta INT PRIMARY KEY,
    idCliente INT,
    numeroDoc VARCHAR(45)
    tipoCliente INT, -- 1: PJ | 2: PF
    FOREIGN KEY idCliente REFERENCES Cliente(idCliente)
);

CREATE TABLE Pagamento (
    idPagamento INT PRIMARY KEY,
    idPedido INT,
    tipo INT,
    FOREIGN KEY idPedido REFERENCES Pedido(idPedido)
);

CREATE TABLE Pedido (
    idPedido INT PRIMARY KEY,
    idCliente INT,
    statusPedido VARCHAR(45),
    descricao VARCHAR(45),
    frete FLOAT,
    FOREIGN KEY idCliente REFERENCES Cliente(idCliente)
);

CREATE TABLE Entrega (
    idEntrega INT PRIMARY KEY,
    statusEntrega VARCHAR(45),
    codigo VARCHAR(45)
);

CREATE TABLE Produto (
    idProduto INT,
    idPedido INT,
    quantidade VARCHAR(45)
);

CREATE TABLE Estoque (
    idEstoque INT PRIMARY KEY,
    localizacao VARCHAR(45)
);

CREATE TABLE ProdutoTemEstoque (
    idProduto INT,
    idEstoque INT,
    quantidade INT,
    PRIMARY KEY (idProduto, idEstoque)
);