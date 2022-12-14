use bd_frequencia_escola

DROP PROCEDURE IF EXISTS SP_OLTP_STATUS_FREQUENCIA

CREATE OR ALTER PROCEDURE SP_OLTP_STATUS_FREQUENCIA @DATA_CARGA DATE
AS
BEGIN
	DELETE TB_AUX_STATUS_FREQUENCIA
	WHERE DATA_CARGA = @DATA_CARGA

	INSERT INTO TB_AUX_STATUS_FREQUENCIA(DATA_CARGA,FREQUENCIA,COD_FREQUENCIA) SELECT @DATA_CARGA,FREQUENCIA,ID_FREQUENCIA_STATUS  FROM FREQUENCIA_STATUS
END

DECLARE @DATE DATE 
SET @DATE = GETDATE()

EXEC SP_OLTP_STATUS_FREQUENCIA @DATE

SELECT * FROM TB_AUX_STATUS_FREQUENCIA

