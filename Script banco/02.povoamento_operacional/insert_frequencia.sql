use bd_frequencia_escola
	DELETE TB_FREQUENCIA
	INSERT INTO TB_FREQUENCIA(ID_TURMA,ID_DISCIPLINA,ID_ALUNO,ID_FREQUENCIA_STATUS,DATA) VALUES (1,1,1,1,GETDATE())
	INSERT INTO TB_FREQUENCIA(ID_TURMA,ID_DISCIPLINA,ID_ALUNO,ID_FREQUENCIA_STATUS,DATA) VALUES (1,1,1,2,GETDATE())
	INSERT INTO TB_FREQUENCIA(ID_TURMA,ID_DISCIPLINA,ID_ALUNO,ID_FREQUENCIA_STATUS,DATA) VALUES (1,1,1,1,GETDATE())
	INSERT INTO TB_FREQUENCIA(ID_TURMA,ID_DISCIPLINA,ID_ALUNO,ID_FREQUENCIA_STATUS,DATA) VALUES (1,1,1,2,GETDATE())
	INSERT INTO TB_FREQUENCIA(ID_TURMA,ID_DISCIPLINA,ID_ALUNO,ID_FREQUENCIA_STATUS,DATA) VALUES (1,1,1,1,GETDATE())

	SELECT * FROM TB_FREQUENCIA

