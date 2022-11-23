use bd_frequencia_escola


SELECT SUM(QUANTIDADE), E.NOME_ESCOLA FROM FATO_FREQUENCIA FQ JOIN DIM_ESCOLA E ON (FQ.ID_ESCOLA = E.ID_ESCOLA)
				JOIN DIM_STATUS_FREQUENCIA SF ON (FQ.ID_STATUS_FREQUENCIA = SF.ID_STATUS_FREQUENCIA)
				WHERE SF.STATUS_FREQUENCIA = 'F'
GROUP BY E.NOME_ESCOLA

SELECT SUM(QUANTIDADE), A.NOME_ALUNO FROM FATO_FREQUENCIA FQ JOIN DIM_ALUNO A ON (FQ.ID_ALUNO = A.ID_ALUNO)
				JOIN DIM_STATUS_FREQUENCIA SF ON (FQ.ID_STATUS_FREQUENCIA = SF.ID_STATUS_FREQUENCIA)
				WHERE SF.STATUS_FREQUENCIA = 'F'
GROUP BY A.NOME_ALUNO


SELECT SUM(QUANTIDADE), D.NOME_DISCIPLINA FROM FATO_FREQUENCIA FQ JOIN DIM_DISCIPLINA D ON (FQ.ID_DISCIPLINA = D.ID_DISCIPLINA)
				JOIN DIM_STATUS_FREQUENCIA SF ON (FQ.ID_STATUS_FREQUENCIA = SF.ID_STATUS_FREQUENCIA)
				WHERE SF.STATUS_FREQUENCIA = 'F'
GROUP BY D.NOME_DISCIPLINA


SELECT SUM(QUANTIDADE), T.NOME_TURMA FROM FATO_FREQUENCIA FQ JOIN DIM_TURMA T ON (FQ.ID_TURMA = T.ID_TURMA)
				JOIN DIM_STATUS_FREQUENCIA SF ON (FQ.ID_STATUS_FREQUENCIA = SF.ID_STATUS_FREQUENCIA)
				WHERE SF.STATUS_FREQUENCIA = 'P'
GROUP BY T.NOME_TURMA
