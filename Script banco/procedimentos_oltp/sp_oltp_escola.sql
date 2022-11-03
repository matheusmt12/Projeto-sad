use bd_frequencia_escola

CREATE OR ALTER PROCEDURE SP_OLTP_ESCOLA @DATA_CARGA DATE
AS
BEGIN
	DELETE TB_AUX_ESCOLA
	WHERE DATA_CARGA = @DATA_CARGA
	INSERT INTO TB_AUX_ESCOLA(COD_TURMA,DATA_CARGA,NOME_TURMA) SELECT ID_ESCOLA, @DATA_CARGA, NOME FROM TB_ESCOLA
END

DECLARE @DATA DATE

SET @DATA = GETDATE()

EXEC SP_OLTP_ESCOLA @DATA