-- fact_salesorder
{{
  config(
    materialized='table'
  )
}}

SELECT index,
  ASIN AS asin, 
  'Courier Status' AS courier_status,
  currency,
  {{ dbt_utils.generate_surrogate_key([
				'`Sales Channel `'
			]) }} as sales_channel_id,
  {{ dbt_utils.generate_surrogate_key([
				'`ship-service-level`',
                '`ship-city`',
                '`ship-state`',
                '`ship-postal-code`',
                '`ship-country`'
			])}} AS sales_shipment_id,
  SUM(qty) AS qty,
  COALESCE(SUM(amount),0) AS amount,
FROM
    {{ source('bronze', 'amazon_sale_report') }}
group by all