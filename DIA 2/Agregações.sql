-- Databricks notebook source
SELECT COUNT(*) AS nrLinhasNaoNulas
FROM silver_olist.cliente

-- conta o número de linhas (linhas não nulas)

-- COMMAND ----------

SELECT COUNT(*) AS nrLinhasNaoNulas,
       COUNT (idCliente) AS nrIdClienteNaoNulo

FROM silver_olist.cliente


-- COMMAND ----------

SELECT COUNT(*) AS nrLinhasNaoNulas,
       COUNT(idCliente) AS nrIdClienteNaoNulo,
       COUNT(DISTINCT idCliente) AS nrIdClienteDistinto -- quantos valores distintos tem na coluna

FROM silver_olist.cliente

-- COMMAND ----------

SELECT COUNT(*) AS nrLinhasNaoNulas,
       COUNT(idCliente) AS nrIdClienteNaoNulo,
       COUNT(DISTINCT idCliente) AS nrIdClienteDistinto,
       
       COUNT(idClienteUnico) AS nrIdClienteUnico, -- 
       COUNT(DISTINCT idClienteUnico) AS nrIdClienteUnicoDistinto -- conta id de clientes únicos distintos
       
FROM silver_olist.cliente

-- COMMAND ----------

-- quantos clientes são de presidente prudente

SELECT COUNT(*) AS qtLinhas,
       COUNT (DISTINCT idCliente) AS qtClientes,
       COUNT(DISTINCT idClienteUnico) AS qtClientesUnicos
       
FROM silver_olist.cliente
WHERE descCidade IN ('presidente prudente', 'curitiba')


-- COMMAND ----------

SELECT 
      AVG(vlPreco) AS avgPreco, -- média da coluna vlPreco (preço médio dos produtos)
      MAX(vlPreco) AS maxPreco,
      
      PERCENTILE(vlPreco, 0.5) AS medianPreco, -- mediana do preço
      
      AVG(vlFrete) AS avgFrete,
      MAX(vlFrete) AS maxFrete,
      MIN(vlFrete) AS minFrete

FROM silver_olist.item_pedido

-- COMMAND ----------

SELECT 
      ROUND(AVG(vlPreco), 2) AS avgPreco, 
      MAX(vlPreco) AS maxPreco,
      ROUND(PERCENTILE(vlPreco, 0.5), 2) AS medianPreco, 
      
      ROUND(AVG(vlFrete), 2) AS avgFrete,
      MAX(vlFrete) AS maxFrete,
      MIN(vlFrete) AS minFrete

FROM silver_olist.item_pedido

-- COMMAND ----------

SELECT 
      INT(AVG(vlPreco)) AS avgPreco,
      MAX(vlPreco) AS maxPreco,
      INT(PERCENTILE(vlPreco, 0.5)) AS medianPreco, 
      
      AVG(vlFrete) AS avgFrete,
      MAX(vlFrete) AS maxFrete,
      MIN(vlFrete) AS minFrete

FROM silver_olist.item_pedido

-- COMMAND ----------

SELECT COUNT(*)
FROM silver_olist.cliente
WHERE descUF = 'SP'
