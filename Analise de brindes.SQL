SELECT 
    CODFILIAL,
    (COUNT(DISTINCT CASE WHEN VLTOTAL < 1000 THEN CODCLI END)) AS MENOS_DE_1000,
    (COUNT(DISTINCT CASE WHEN VLTOTAL >= 1000 AND VLTOTAL < 2000 THEN CODCLI END)) AS ENTRE_1000_E_2000,
    (COUNT(DISTINCT CASE WHEN VLTOTAL >= 2000 AND VLTOTAL < 3000 THEN CODCLI END)) AS ENTRE_2000_E_3000,
    (COUNT(DISTINCT CASE WHEN VLTOTAL >= 3000 THEN CODCLI END)) AS MAIOR_DE_3000
FROM 
    PCNFSAID
WHERE 
    DTSAIDA BETWEEN TO_DATE(:DATAINICIAL, 'DD-MM-YYYY') AND TO_DATE(:DATAFINAL, 'DD-MM-YYYY')
GROUP BY 
    CODFILIAL
ORDER BY 
    CODFILIAL;
