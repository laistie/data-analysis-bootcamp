CREATE TABLE Pessoa (
    idPessoa INT PRIMARY KEY,
    nome VARCHAR(45),
    cpf VARCHAR(45),
    endereco VARCHAR(45)
);

CREATE TABLE Departamento (
    idDepartamento INT PRIMARY KEY,
    nome VARCHAR(45),
    campus VARCHAR(45)
);

CREATE TABLE Aluno (
    idAluno INT PRIMARY KEY,
    idPessoa INT,
    matricula VARCHAR(45),
    FOREIGN KEY (idPessoa) REFERENCES Pessoa(idPessoa)
);

CREATE TABLE Professor (
    idProfessor INT PRIMARY KEY,
    idDepartamento INT,
    idPessoa INT,
    FOREIGN KEY (idDepartamento) REFERENCES Departamento(idDepartamento),
    FOREIGN KEY (idPessoa) REFERENCES Pessoa(idPessoa)
);

CREATE TABLE Disciplina (
    idDisciplina INT PRIMARY KEY,
    idProfessor INT,
    FOREIGN KEY (idProfessor) REFERENCES Professor(idProfessor)
);

CREATE TABLE Curso (
    idCurso INT PRIMARY KEY,
    idDepartamento INT,
    FOREIGN KEY (idDepartamento) REFERENCES Departamento(idDepartamento)
);

CREATE TABLE DisciplinaDeCurso (
    idDisciplina INT,
    idCurso INT,
    PRIMARY KEY (idDisciplina, idCurso),
    FOREIGN KEY (idDisciplina) REFERENCES Disciplina(idDisciplina),
    FOREIGN KEY (idCurso) REFERENCES Curso(idCurso)
);

CREATE TABLE Matriculado (
    idAluno INT,
    idDisciplina INT,
    PRIMARY KEY (idAluno, idDisciplina),
    FOREIGN KEY (idAluno) REFERENCES Aluno(idAluno),
    FOREIGN KEY (idDisciplina) REFERENCES Disciplina(idDisciplina)
);

CREATE TABLE Periodo (
    idPeriodo INT PRIMARY KEY,
    ano VARCHAR(45),
    semestre VARCHAR(45)
);

CREATE TABLE OfertaDeDisciplina (
    idDisciplina INT,
    idProfessor INT,
    idPeriodo INT,
    PRIMARY KEY (idDisciplina, idPeriodo),
    FOREIGN KEY (idDisciplina) REFERENCES Disciplina(idDisciplina),
    FOREIGN KEY (idProfessor) REFERENCES Professor(idProfessor),
    FOREIGN KEY (idPeriodo) REFERENCES Periodo(idPeriodo)
);

CREATE TABLE PrerequisitoDeDisciplina (
    idDisciplina INT,
    idPrerequisito INT,
    PRIMARY KEY (idDisciplina, idPrerequisito),
    FOREIGN KEY (idDisciplina) REFERENCES Disciplina(idDisciplina),
    FOREIGN KEY (idPrerequisito) REFERENCES Disciplina(idDisciplina)
);
