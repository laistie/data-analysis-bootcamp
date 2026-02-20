UNWIND [
    {sku: "P001", nome: "Notebook gamer", preco: 5000},
    {sku: "P002", nome: "Mouse sem fio", preco: 120},
    {sku: "P003", nome: "Teclado mecânico", preco: 350}
] AS prod


CREATE (p:Produto {
    sku: prod.sku,
    nome: prod.nome,
    preco: prod.preco,
    criadoEm: date()
})

RETURN p