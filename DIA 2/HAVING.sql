-- Databricks notebook source
SELECT descUF,
      COUNT(idVendedor) AS qtVendedoUF

FROM silver_olist.vendedor

WHERE descUF IN ('SP','MG', 'RJ', 'ES ')

GROUP BY descUF

HAVING qtVendedoUF >= 100

ORDER BY qtVendedoUF DESC
