  use bd_frequencia_escola

CREATE OR ALTER PROCEDURE SP_OLTP_TURMA @DATA_CARGA DATE
AS
BEGIN
	DELETE TB_AUX_TURMA
	WHERE DATA_CARGA = @DATA_CARGA
	INSERT INTO TB_AUX_TURMA(COD_TURMA,DATA_CARGA,NOME_TURMA)
	SELECT ID_TURMA,@DATA_CARGA,NOME FROM TB_TURMA
	
END

DECLARE @DATA DATE
SET @DATA = GETDATE()

EXEC SP_OLTP_TURMA @DATA

SELECT * FROM TB_AUX_TURMA