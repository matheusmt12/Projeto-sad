use bd_frequencia_escola

CREATE OR ALTER PROCEDURE SP_DIM_ESCOLA
AS
BEGIN
	DECLARE @COD INT, @NOME VARCHAR(20)
	DECLARE C_ESCOLA CURSOR FOR SELECT COD_ESCOLA,NOME_ESCOLA FROM TB_AUX_ESCOLA
	OPEN C_ESCOLA
	FETCH C_ESCOLA INTO @COD, @NOME
	WHILE @@FETCH_STATUS = 0
	BEGIN
		IF NOT EXISTS (SELECT COD_ESCOLA,NOME_ESCOLA FROM DIM_ESCOLA WHERE COD_ESCOLA = @COD)
			INSERT INTO DIM_ESCOLA(COD_ESCOLA,NOME_ESCOLA)VALUES(@COD,@NOME)
			FETCH C_ESCOLA INTO @COD, @NOME
	END
	CLOSE C_ESCOLA
	DEALLOCATE C_ESCOLA
END

EXEC SP_DIM_ESCOLA

SELECT * FROM DIM_ESCOLA