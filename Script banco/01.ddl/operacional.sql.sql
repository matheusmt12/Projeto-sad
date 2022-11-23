use bd_frequencia_escola;

DROP TABLE IF EXISTS TB_ALUNO
DROP TABLE IF EXISTS TB_DISCIPLINA
DROP TABLE IF EXISTS TB_ESCOLA
DROP TABLE IF EXISTS TB_FREQUENCIA
DROP TABLE IF EXISTS TB_TURMA
DROP TABLE IF EXISTS TB_TURMA_DISCIPLINA
DROP TABLE IF EXISTS FREQUENCIA_STATUS

CREATE TABLE TB_ESCOLA (
	ID_ESCOLA INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
	NOME VARCHAR(20) NOT NULL)




CREATE TABLE TB_TURMA(
	ID_TURMA INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
	NOME VARCHAR(50) NOT NULL,
	ANO_LETIVO INT NOT NULL,
	ID_ESCOLA INT REFERENCES TB_ESCOLA)



CREATE TABLE TB_ALUNO(
	ID_ALUNO INT IDENTITY (1,1) NOT NULL PRIMARY KEY,
	NOME VARCHAR(50) NOT NULL,
	ID_TURMA INT REFERENCES TB_TURMA(ID_TURMA))





CREATE TABLE TB_DISCIPLINA(
	ID_DISCIPLINA INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
	NOME VARCHAR(20) NOT NULL)


CREATE TABLE TB_TURMA_DISCIPLINA(
	ID_TURMA INT NOT NULL,
	ID_DISCIPLINA INT NOT NULL,
	CONSTRAINT FK_TURMA FOREIGN KEY (ID_TURMA) REFERENCES TB_TURMA (ID_TURMA),
	CONSTRAINT FK_DISCIPLINA FOREIGN KEY (ID_DISCIPLINA) REFERENCES TB_DISCIPLINA (ID_DISCIPLINA)
				)



CREATE TABLE FREQUENCIA_STATUS(
	ID_FREQUENCIA_STATUS INT NOT NULL PRIMARY KEY,
	FREQUENCIA CHAR(5) CHECK ( FREQUENCIA IN('P','F')),
	)


CREATE TABLE TB_FREQUENCIA(
	ID_FREQUENCIA INT NOT NULL IDENTITY (1,1) PRIMARY KEY,
	ID_TURMA INT NOT NULL,
	ID_DISCIPLINA INT NOT NULL,
	ID_ALUNO INT NOT NULL,
	ID_FREQUENCIA_STATUS INT NOT NULL,
	DATA DATETIME NOT NULL
	CONSTRAINT FK_TURMA1 FOREIGN KEY (ID_TURMA) REFERENCES TB_TURMA (ID_TURMA),
	CONSTRAINT FK_DISCIPLINA2 FOREIGN KEY (ID_DISCIPLINA) REFERENCES TB_DISCIPLINA (ID_DISCIPLINA),
	CONSTRAINT FK_ALUNO FOREIGN KEY (ID_ALUNO) REFERENCES TB_ALUNO (ID_ALUNO),
	CONSTRAINT FK_FREQUENCIA_STATUS FOREIGN KEY (ID_FREQUENCIA_STATUS) REFERENCES FREQUENCIA_STATUS(ID_FREQUENCIA_STATUS)
	)



	