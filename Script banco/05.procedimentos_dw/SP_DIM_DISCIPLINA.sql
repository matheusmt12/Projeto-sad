use bd_frequencia_escola

CREATE OR ALTER PROCEDURE SP_DIM_DISCIPLINA
AS
BEGIN
	DECLARE @COD INT, @NOME VARCHAR(20)
	DECLARE C_DISCIPLINA CURSOR FOR SELECT COD_DISCIPLINA,NOME_DISCIPLINA FROM TB_AUX_DISCIPLINA
	OPEN C_DISCIPLINA
	FETCH C_DISCIPLINA INTO @COD,@NOME
	WHILE @@FETCH_STATUS = 0
	BEGIN
		IF NOT EXISTS(SELECT COD_DISCIPLINA,NOME_DISCIPLINA FROM DIM_DISCIPLINA WHERE COD_DISCIPLINA = @COD)
			INSERT INTO DIM_DISCIPLINA (COD_DISCIPLINA,NOME_DISCIPLINA)VALUES(@COD,@NOME)
		FETCH C_DISCIPLINA INTO @COD,@NOME
	END
	CLOSE C_DISCIPLINA
	DEALLOCATE C_DISCIPLINA
END

EXEC SP_DIM_DISCIPLINA

SELECT * FROM DIM_DISCIPLINA