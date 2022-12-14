use bd_frequencia_escola

CREATE OR ALTER PROCEDURE SP_DIM_STATUS_FREQUENCIA
AS
BEGIN
	DECLARE @COD INT ,@FREQUENCIA CHAR(2)
	DECLARE C_STATUS CURSOR FOR SELECT COD_FREQUENCIA,FREQUENCIA FROM TB_AUX_STATUS_FREQUENCIA
	OPEN C_STATUS
	FETCH C_STATUS INTO @COD , @FREQUENCIA

	WHILE @@FETCH_STATUS = 0
		BEGIN
			IF NOT EXISTS(SELECT * FROM DIM_STATUS_FREQUENCIA WHERE ID_STATUS_FREQUENCIA = @COD)
				INSERT INTO DIM_STATUS_FREQUENCIA(COD_FREQUENCIA,STATUS_FREQUENCIA)VALUES(@COD,@FREQUENCIA)
			FETCH C_STATUS INTO @COD,@FREQUENCIA
		END
		CLOSE C_STATUS
		DEALLOCATE C_STATUS

END

EXEC SP_DIM_STATUS_FREQUENCIA

SELECT * FROM DIM_STATUS_FREQUENCIA

