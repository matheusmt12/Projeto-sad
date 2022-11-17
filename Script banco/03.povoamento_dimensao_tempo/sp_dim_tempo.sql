USE bd_frequencia_escola
GO
CREATE OR ALTER PROCEDURE SP_DIM_TEMPO(@DT_INICIAL DATETIME, @DT_FINAL DATETIME) AS 
BEGIN
     DECLARE @NIVEL VARCHAR(8), @DATA DATETIME, @DIA INT, @DIA_SEMANA VARCHAR(50), @FIM_SEMANA VARCHAR(3),
	 @MES INT, @NOME_MES VARCHAR(100), @TRIMESTRE INT, @SEMESTRE INT, @NOME_SEMESTRE VARCHAR(100), @ANO INT, 
	 @NOME_TRIMESTRE VARCHAR(100), @ANO_ATUAL INT

	 SET @ANO = (SELECT DATEPART(YY,@DT_INICIAL))
	 SET @MES = (SELECT DATEPART(mm,@DT_INICIAL))
     WHILE(@DT_INICIAL < @DT_FINAL)
	 BEGIN 
	    WHILE(@MES = (SELECT DATEPART(mm,@DT_INICIAL)))
		    BEGIN
		    SET @DIA = (SELECT DATEPART(dd,@DT_INICIAL))

			IF (@MES > 6)
		    BEGIN 
		       SET @SEMESTRE = 2
			   SET @NOME_SEMESTRE = '2 SEMESTRE/' + STR(@ANO)
		    END
		    ELSE
		       SET @SEMESTRE = 1
			   SET @NOME_SEMESTRE = '1 SEMESTRE/' + STR(@ANO)

		  SET @DIA_SEMANA = (SELECT DATENAME(dw,@DT_INICIAL))
		  SET @NOME_MES = (SELECT DATENAME(mm, @DT_INICIAL))
		  SET @TRIMESTRE = (SELECT DATEPART(qq, @DT_INICIAL))
		  SET @NOME_TRIMESTRE = (SELECT DATENAME(qq, @DT_INICIAL))
		  SET @FIM_SEMANA = 'NAO'
		  IF(@DIA_SEMANA = 'Sunday' OR @DIA_SEMANA = 'Saturday')
		     SET @FIM_SEMANA = 'SIM'

		  INSERT INTO DIM_TEMPO
		  VALUES('DIA',@DT_INICIAL,@DIA,@DIA_SEMANA,@FIM_SEMANA,@MES,@NOME_MES,@TRIMESTRE,@NOME_TRIMESTRE,@SEMESTRE, @NOME_SEMESTRE, @ANO)
		

		   SET @DT_INICIAL = (SELECT DATEADD(dd,1,@DT_INICIAL))	
		END
		SET @MES = (SELECT DATEPART(mm,@DT_INICIAL))
		INSERT INTO DIM_TEMPO
	    VALUES('MES',NULL,NULL,NULL,NULL,@MES,@NOME_MES,@TRIMESTRE,@NOME_TRIMESTRE,@SEMESTRE, @NOME_SEMESTRE, @ANO)
	   
	    SET @ANO_ATUAL = (SELECT DATEPART(YY,@DT_INICIAL))
		IF(@ANO_ATUAL > @ANO)
		  BEGIN
		   SET @ANO = @ANO_ATUAL
		    INSERT INTO DIM_TEMPO
	         VALUES('ANO',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL, NULL, @ANO)   
		END
	 END
END

EXEC SP_DIM_TEMPO '20220101', '20221231'
SELECT * FROM DIM_TEMPO

delete from DIM_TEMPO