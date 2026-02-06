INSERT INTO oficina.Pessoa (idPessoa, pnome, snome, CPF, telefone, endereco) VALUES
    (1, 'João', 'Silva', '123456789', '11999999999', 'Rua das Flores, 123'),
    (2, 'Maria', 'Oliveira', '987654321', '11988888888', 'Av. Brasil, 456'),
    (3, 'Carlos', 'Santos', '456123789', '11977777777', 'Rua Central, 789'),
    (4, 'Ana', 'Pereira', '321654987', '11966666666', 'Travessa das Árvores, 12'),
    (5, 'Paulo', 'Costa', '159753486', '11955555555', 'Rua do Comércio, 89'),
    (6, 'Helena', 'Noir', '321312325', '11977777733','Av. Mato Grosso, 3213'),
    (7, 'Murilo', 'Neves', '343444621', '11988888282', 'Rua dos Aflitos, 211');

INSERT INTO oficina.Cliente (idCliente, idPessoa) VALUES
    (1, 1),
    (2, 2);

INSERT INTO oficina.Veiculo (idVeiculo, idCliente, tipo, descricao) VALUES
    (1, 1, 'Carro', 'Fiat Uno 2010 - Prata'),
    (2, 2, 'Moto', 'Honda CG 160 2018 - Vermelha');

INSERT INTO oficina.Equipe (idEquipe, nome) VALUES
    (1, 'Equipe Terra-616'),
    (2, 'Equipe 701306');

INSERT INTO oficina.Mecanico (idMecanico, idPessoa, idEquipe, codigo, espMecanico) VALUES
    (1, 3, 1, 'M001', 'Mecânica Geral'),
    (2, 4, 1, 'M002', 'Elétrica'),
    (3, 5, 2, 'M003', 'Mecânica Geral'),
    (4, 6, 2, 'M004', 'Pintura'),
    (5, 7, 1, 'M005', 'Funilaria');

INSERT INTO oficina.Servico (idServico, descricao, valor) VALUES
    (1, 'Troca de óleo', 150.00),
    (2, 'Alinhamento e balanceamento', 120.00),
    (3, 'Pintura de porta', 500.00),
    (4, 'Reparo no sistema elétrico', 300.00);

INSERT INTO oficina.OS (idOS, idVeiculo, idEquipe, codigo, valor, statusOS, dataEmissao, dataConclusao) VALUES
    (1, 1, 1, '00001', 270.00, 'Em análise', '2025-07-01', NULL),
    (2, 2, 2, '00002', 500.00, 'Trabalhando', '2025-07-15', NULL),
    (3, 1, 1, '00003', 150.00, 'Concluído', '2025-06-10', '2025-06-12');