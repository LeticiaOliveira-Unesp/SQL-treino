-- Databricks notebook source
SELECT * FROM silver_olist.pedido

-- leia-se: selecion tudo da tabela silver_olist.pedido

-- COMMAND ----------

SELECT idPedido

FROM silver_olist.pedido

-- leia-se: selecion a coluna idPrdido da tabela silver_olist.pedido

-- COMMAND ----------

SELECT idPedido,
       descSituacao

FROM silver_olist.pedido

-- leia-se: selecion as colunas idPedido e descSituacao da tabela silver_olist.pedido

-- COMMAND ----------

SELECT idPedido,
       descSituacao

FROM silver_olist.pedido

LIMIT 5

-- leia-se: selecion as colunas idPedido e descSituacao da tabela silver_olist.pedido e retorna 5 linhas (não confiar se são os primeiros ou últimos)


-- COMMAND ----------

SELECT *,
      DATEDIFF(dtEstimativaEntrega, dtEntregue) AS qtDiasPromessaEntrega

FROM silver_olist.pedido

-- cria uma nova coluna com a diferença entre datas (data de estimativa de entrega - data de entrega) -> contabiliza os dias

-- função AS muda a nomenclatura da variável (AS é opcional)

-- COMMAND ----------


