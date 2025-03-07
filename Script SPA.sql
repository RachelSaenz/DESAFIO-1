

CREATE VIEW spa_data AS
SELECT 'CENTRO' sucursal,CENTRO.* FROM dbo.SpaCentro_m20191007 CENTRO
UNION
SELECT 'ESCALON',ESCALON.* FROM dbo.SpaEscalon_i20191007 ESCALON
UNION
SELECT 'TECLA',TECLA.* FROM dbo.SpaSantaTecla_m20191007 TECLA;


SELECT * FROM spa_data;

SELECT 
  sucursal, 
  COUNT(*) as TotalClientes, 
  AVG(PromVisit) as PromedioVisitas, 
  SUM(Sauna) as TotalSauna, 
  SUM(Masaje) as TotalMasaje, 
  SUM(Hidro) as TotalHidro, 
  SUM(Yoga) as TotalYoga 
FROM 
  spa_data 
GROUP BY 
  sucursal;


SELECT 
  sucursal,
  CASE 
    WHEN CAST(Edad AS INT) < 25 THEN '18-24' 
    WHEN CAST(Edad AS INT) BETWEEN 25 AND 34 THEN '25-34'
    WHEN CAST(Edad AS INT) BETWEEN 35 AND 44 THEN '35-44' 
    WHEN CAST(Edad AS INT) BETWEEN 45 AND 54 THEN '45-54' 
    WHEN CAST(Edad AS INT) > 54 THEN '55+' 
  END AS RangoEdad,
  COUNT(*) as TotalClientes,
  SUM(CAST(Sauna AS INT)) as UsaSauna,
  SUM(CAST(Masaje AS INT)) as UsaMasaje,
  SUM(CAST(Hidro AS INT)) as UsaHidro,
  SUM(CAST(Yoga AS INT)) as UsaYoga
FROM 
  spa_data
GROUP BY 
  sucursal,
  CASE 
    WHEN CAST(Edad AS INT) < 25 THEN '18-24' 
    WHEN CAST(Edad AS INT) BETWEEN 25 AND 34 THEN '25-34'
    WHEN CAST(Edad AS INT) BETWEEN 35 AND 44 THEN '35-44' 
    WHEN CAST(Edad AS INT) BETWEEN 45 AND 54 THEN '45-54' 
    WHEN CAST(Edad AS INT) > 54 THEN '55+' 
  END;

  SELECT 
  sucursal, 
  Sexo,
  AVG(ingresos) as PromedioIngresos, 
  SUM(Sauna) as TotalSauna, 
  SUM(Masaje) as TotalMasaje, 
  SUM(Hidro) as TotalHidro, 
  SUM(Yoga) as TotalYoga 
FROM 
  spa_data 
GROUP BY 
  sucursal, 
  Sexo;


  SELECT 
  sucursal, 
  id, 
  Sexo, 
  Edad, 
  ingresos, 
  PromVisit, 
  Sauna, 
  Masaje, 
  Hidro, 
  Yoga 
FROM 
  spa_data 
WHERE 
  Sauna = 1 OR 
  Masaje = 1 OR 
  Hidro = 1 OR 
  Yoga = 1;



