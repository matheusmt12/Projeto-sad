-- Scripts ddl para o ambiente dimensional

USE bd_frequencia_escola

DROP TABLE IF EXISTS FATO_FREQUENCIA
DROP TABLE IF EXISTS DIM_ALUNO
DROP TABLE IF EXISTS DIM_ESCOLA
DROP TABLE IF EXISTS DIM_TURMA
DROP TABLE IF EXISTS DIM_DISCIPLINA
DROP TABLE IF EXISTS DIM_STATUS_FREQUENCIA
DROP TABLE IF EXISTS DIM_TEMPO



CREATE TABLE DIM_ALUNO (
   ID_ALUNO INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
   COD_ALUNO INT NOT NULL,
   NOME_ALUNO VARCHAR(100) NOT NULL,
)

CREATE INDEX IX_DIM_ALUNO_COD_ALUNO ON DIM_ALUNO(COD_ALUNO)

CREATE TABLE DIM_ESCOLA (
   ID_ESCOLA INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
   COD_ESCOLA INT NOT NULL,
   NOME_ESCOLA VARCHAR(100) NOT NULL,
)

CREATE INDEX IX_DIM_ESCOLA_COD_ESCOLA ON DIM_ESCOLA(COD_ESCOLA)

CREATE TABLE DIM_TURMA (
   ID_TURMA INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
   COD_TURMA INT NOT NULL,
   NOME_TURMA VARCHAR(100) NOT NULL,
)

CREATE INDEX IX_DIM_TURMA_COD_TURMA ON DIM_TURMA(COD_TURMA)

CREATE TABLE DIM_DISCIPLINA (
   ID_DISCIPLINA INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
   COD_DISCIPLINA INT NOT NULL,
   NOME_DISCIPLINA VARCHAR(100) NOT NULL,
)

CREATE INDEX IX_DIM_DISCIPLINA_COD_DISCIPLINA ON DIM_DISCIPLINA(COD_DISCIPLINA)

CREATE TABLE DIM_STATUS_FREQUENCIA (
   ID_STATUS_FREQUENCIA INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
   STATUS_FREQUENCIA CHAR(1) NOT NULL CHECK (STATUS_FREQUENCIA IN ('P', 'F')),
)

CREATE TABLE DIM_TEMPO (
	ID_TEMPO BIGINT NOT NULL IDENTITY(1,1) PRIMARY KEY,
	NIVEL VARCHAR(8) NOT NULL CHECK (NIVEL IN ('DIA','MES','ANO')),
	DATA DATETIME NULL,
	DIA INT  NULL,
	DIA_SEMANA VARCHAR(50)  NULL,
	FIM_SEMANA VARCHAR(3)  NULL CHECK (FIM_SEMANA IN ('SIM','NAO')),
	MES INT  NULL,
	NOME_MES VARCHAR(100)  NULL,
	TRIMESTRE INT  NULL,
	NOME_TRIMESTRE VARCHAR(100)  NULL,
	SEMESTRE INT  NULL,
	NOME_SEMESTRE VARCHAR(100)  NULL,
	ANO INT NOT NULL
)

CREATE INDEX IX_DIM_TEMPO_DATA ON DIM_TEMPO (DATA)
CREATE INDEX IX_DIM_TEMPO_DATA_MES ON DIM_TEMPO (NIVEL, MES)
CREATE INDEX IX_DIM_TEMPO_DATA_ANO ON DIM_TEMPO (NIVEL, ANO)

create table FATO_FREQUENCIA (
	ID_FREQUENCIA BIGINT NOT NULL IDENTITY(1,1) PRIMARY KEY,
	ID_TEMPO BIGINT NOT NULL,
	ID_DISCIPLINA INT NOT NULL,
	ID_TURMA INT NOT NULL,
	ID_ALUNO INT NOT NULL,
	ID_ESCOLA INT NOT NULL,
	ID_STATUS_FREQUENCIA INT NOT NULL,
	QUANTIDADE INT NOT NULL DEFAULT (1)
	CONSTRAINT FK_DIM_DISCIPLINA FOREIGN KEY (ID_DISCIPLINA) REFERENCES DIM_DISCIPLINA (ID_DISCIPLINA),
	CONSTRAINT FK_DIM_TURMA FOREIGN KEY (ID_TURMA) REFERENCES DIM_TURMA(ID_TURMA),
	CONSTRAINT FK_DIM_ALUNO FOREIGN KEY (ID_ALUNO) REFERENCES DIM_ALUNO (ID_ALUNO),
	CONSTRAINT FK_DIM_ESCOLA FOREIGN KEY (ID_ESCOLA) REFERENCES DIM_ESCOLA (ID_ESCOLA),
	CONSTRAINT FK_DIM_STATUS_FREQUENCIA FOREIGN KEY (ID_STATUS_FREQUENCIA) REFERENCES DIM_STATUS_FREQUENCIA (ID_STATUS_FREQUENCIA)
)

CREATE INDEX IX_FATO_FREQUENCIA_TEMPO ON FATO_FREQUENCIA(ID_TEMPO)
CREATE INDEX IX_FATO_FREQUENCIA_ALUNO ON FATO_FREQUENCIA(ID_ALUNO)
CREATE INDEX IX_FATO_FREQUENCIA_ESCOLA ON FATO_FREQUENCIA(ID_ESCOLA)
CREATE INDEX IX_FATO_FREQUENCIA_TURMA ON FATO_FREQUENCIA(ID_TURMA)
CREATE INDEX IX_FATO_FREQUENCIA_DISCIPLINA ON FATO_FREQUENCIA(ID_DISCIPLINA)
CREATE INDEX IX_FATO_FREQUENCIA_STATUS_FREQUENCIA ON FATO_FREQUENCIA(ID_STATUS_FREQUENCIA)