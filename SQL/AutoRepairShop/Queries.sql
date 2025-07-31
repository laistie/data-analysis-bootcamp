-- Lista relação cliente, tipo de veículo e descrição
SELECT c.idCliente, p.pnome || ' ' || p.snome AS cliente, v.tipo, v.descricao
FROM oficina.Cliente c
NATURAL JOIN oficina.Pessoa p
LEFT JOIN oficina.Veiculo v ON v.idCliente = c.idCliente;

-- Lista mecânicos e suas especialidades
SELECT m.idMecanico, p.pnome || ' ' || p.snome AS mecanico, e.nome AS equipe, m.espMecanico
FROM oficina.Mecanico m
NATURAL JOIN oficina.Pessoa p
LEFT JOIN oficina.Equipe e ON m.idEquipe = e.idEquipe;

-- Lista informações básicas sobre as Ordens de Serviço, ordenadas por data de emissão decrescente
SELECT os.idOS, os.codigo AS codigo_os, p.pnome || ' ' || p.snome AS cliente, v.descricao AS veiculo, os.statusOS, os.valor, os.dataEmissao, os.dataConclusao
FROM oficina.OS os
NATURAL JOIN oficina.Veiculo v
NATURAL JOIN oficina.Cliente c
NATURAL JOIN oficina.Pessoa p
ORDER BY os.dataEmissao DESC;

-- Calcula a receita total da oficina
SELECT SUM(valor) AS receita_total
FROM oficina.OS
WHERE statusOS = 'Concluído';

-- Calcula a média de valor dos serviços
SELECT AVG(valor) AS media_valor_servico
FROM oficina.Servico;