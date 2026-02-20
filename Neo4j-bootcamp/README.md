# Neo4j - Data Analysis with Graphs Bootcamp

## Part One: Neo4j Fundamentals
Setups and best practices for Graph Data Modeling.

## Part Two: First Steps with Cypher and Neo4j

In this section, we worked on basic queries such as CREATE, SET, REMOVE, DELETE, among others. Given my prior experience with SQL and graph theory, adapting to graph queries felt quite intuitive. That said, a few topics stood out as particularly noteworthy, since I wasn’t familiar with them before the bootcamp:

- UNWIND: very similar to the idea of matrices transposition — it expands lists into rows, making batch operations and list processing much easier within Cypher pipelines;

- CALL: used to invoke subqueries and procedures (so glad I learned these at uni) within Cypher. This improves readability, enables scoped variable handling, and supports more complex data transformations;

- APOC: a powerful procedures and functions library that extends native Cypher capabilities — especially useful for data import/export, transformations, graph refactoring, and automation tasks;

- QPP (Query Plan/Profile): tools for analyzing how Cypher executes queries — helps inspect operators, index usage, cardinality, and performance bottlenecks to optimize graph queries effectively.

## Part Three: Data Modeling with Graph Databases

I really enjoyed the first classes of this part, since there were many examples of how data modeling can be used to "evolve" a schema. It was also introduced hierarchy polymorphism - luckly I had Java/OOP classes at uni, so it wasn't my first contact with that concept.

After that, it was discussed navigation structures - such as linked lists 💀 which I was also familiar with, from my uni time.