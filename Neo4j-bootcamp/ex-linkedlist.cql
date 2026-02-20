MATCH (e:Evento)
WITH e ORDER BY e.timestamp
WITH collect(e) AS eventos
CALL apoc.nodes.link(eventos, "NEXT")
RETURN count(*) as conexoes_criadas