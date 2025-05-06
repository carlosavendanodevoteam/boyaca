view: test_mt_indicadores_medicion {
  sql_table_name: `datalake-transporte.TEST.test_mt_indicadores_medicion` ;;

  dimension: ambito {
    type: string
    sql: ${TABLE}.AMBITO ;;
  }

  dimension_group: fecha_filtro {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.FECHA_FILTRO ;;
  }

  dimension: id_indicador {
    type: number
    sql: ${TABLE}.id_indicador ;;
  }

  measure: count {
    type: count
  }

  dimension: plaza {
    type: string
    sql: ${TABLE}.plaza ;;
  }

  dimension: region {
    type: string
    sql: ${TABLE}.region ;;
  }

  dimension: cod_provincia {
    type: string
    sql: ${TABLE}.cod_provincia ;;
    map_layer_name: provincias
  }




# --------------------------------------
# Indicador 1: € Tonelada de Reparto y Recogida
# --------------------------------------
  dimension: objetivo_ind_1 {
    type: number
    sql: ${TABLE}.objetivo ;;
    link: {
      label: "Detalle "
      url: "/dashboards/3?Plaza={{ test_mt_indicadores_medicion.plaza | url_encode }}&Region={{test_mt_indicadores_medicion.region| url_encode }}&Fecha+Expediciones={{ _filters['test_mt_indicadores_medicion.fecha_filtro_date'] | url_encode }}&Fecha+Tendencias=7+day"
    }
    value_format: "\"€/T \"0.00"
  }

  measure: objetivo_avg_ind_1 {
    type: average
    sql: ${TABLE}.objetivo ;;
    link: {
      label: "Detalle"
      url: "/dashboards/3?Plaza={{ test_mt_indicadores_medicion.plaza | url_encode }}&Region={{test_mt_indicadores_medicion.region| url_encode }}&Fecha+Expediciones={{ _filters['test_mt_indicadores_medicion.fecha_filtro_date'] | url_encode }}&Fecha+Tendencias=7+day"
    }
    value_format: "\"€/T \"0.00"
  }

  dimension: valor_ind_1 {
    type: number
    sql: ${TABLE}.VALOR ;;
    link: {
      label: "Detalle "
      url: "/dashboards/3?Plaza={{ test_mt_indicadores_medicion.plaza | url_encode }}&Region={{test_mt_indicadores_medicion.region| url_encode }}&Fecha+Expediciones={{ _filters['test_mt_indicadores_medicion.fecha_filtro_date'] | url_encode }}&Fecha+Tendencias=7+day"
    }
    value_format: "\"€/T \"0.00"
  }

  measure: valor_avg_ind_1 {
    type: average
    sql: ${TABLE}.VALOR ;;
    link: {
      label: "Detalle "
      url: "/dashboards/3?Plaza={{ test_mt_indicadores_medicion.plaza | url_encode }}&Region={{test_mt_indicadores_medicion.region| url_encode }}&Fecha+Expediciones={{ _filters['test_mt_indicadores_medicion.fecha_filtro_date'] | url_encode }}&Fecha+Tendencias=7+day"
    }
    value_format: "\"€/T \"0.00"
  }




# --------------------------------------
# Indicador 2: € Expedición
# --------------------------------------
  dimension: objetivo_ind_2 {
    type: number
    sql: ${TABLE}.objetivo ;;
    link: {
      label: "Detalle"
      url: "/dashboards/8?Plaza={{ test_mt_indicadores_medicion.plaza | url_encode }}&Region={{test_mt_indicadores_medicion.region| url_encode }}&Fecha+Expediciones={{ _filters['test_mt_indicadores_medicion.fecha_filtro_date'] | url_encode }}&Fecha+Tendencias=7+day"
    }
    value_format: "\"€\"0.00"
  }

  measure: objetivo_avg_ind_2 {
    type: average
    sql: ${TABLE}.objetivo ;;
    link: {
      label: "Detalle"
      url: "/dashboards/8?Plaza={{ test_mt_indicadores_medicion.plaza | url_encode }}&Region={{test_mt_indicadores_medicion.region| url_encode }}&Fecha+Expediciones={{ _filters['test_mt_indicadores_medicion.fecha_filtro_date'] | url_encode }}&Fecha+Tendencias=7+day"
    }
    value_format: "\"€\"0.00"
  }

  dimension: valor_ind_2 {
    type: number
    sql: ${TABLE}.VALOR ;;
    link: {
      label: "Detalle"
      url: "/dashboards/8?Plaza={{ test_mt_indicadores_medicion.plaza | url_encode }}&Region={{test_mt_indicadores_medicion.region| url_encode }}&Fecha+Expediciones={{ _filters['test_mt_indicadores_medicion.fecha_filtro_date'] | url_encode }}&Fecha+Tendencias=7+day"
    }
    value_format: "\"€\"0.00"
  }

  measure: valor_avg_ind_2 {
    type: average
    sql: ${TABLE}.VALOR ;;
    link: {
      label: "Detalle"
      url: "/dashboards/8?Plaza={{ test_mt_indicadores_medicion.plaza | url_encode }}&Region={{test_mt_indicadores_medicion.region| url_encode }}&Fecha+Expediciones={{ _filters['test_mt_indicadores_medicion.fecha_filtro_date'] | url_encode }}&Fecha+Tendencias=7+day"
    }
    value_format: "\"€\"0.00"
  }



# --------------------------------------
# Indicador 4: % Lecturas (Descarga)
# --------------------------------------
  dimension: objetivo_ind_4 {
    type: number
    sql: ${TABLE}.objetivo ;;
    link: {
      label: "Detalle"
      url: "/dashboards/4?Plaza={{ test_mt_indicadores_medicion.plaza | url_encode }}&Region={{test_mt_indicadores_medicion.region| url_encode }}&Fecha+Expediciones={{ _filters['test_mt_indicadores_medicion.fecha_filtro_date'] | url_encode }}&Fecha+Tendencias=7+day"
    }
    value_format: "\"%\"0.00"
  }

  measure: objetivo_avg_ind_4 {
    type: average
    sql: ${TABLE}.objetivo ;;
    link: {
      label: "Detalle"
      url: "/dashboards/4?Plaza={{ test_mt_indicadores_medicion.plaza | url_encode }}&Region={{test_mt_indicadores_medicion.region| url_encode }}&Fecha+Expediciones={{ _filters['test_mt_indicadores_medicion.fecha_filtro_date'] | url_encode }}&Fecha+Tendencias=7+day"
    }
    value_format: "\"%\"0.00"
  }

  dimension: valor_ind_4 {
    type: number
    sql: ${TABLE}.VALOR * 100;;
    link: {
      label: "Detalle"
      url: "/dashboards/4?Plaza={{ test_mt_indicadores_medicion.plaza | url_encode }}&Region={{test_mt_indicadores_medicion.region| url_encode }}&Fecha+Expediciones={{ _filters['test_mt_indicadores_medicion.fecha_filtro_date'] | url_encode }}&Fecha+Tendencias=7+day"
    }
    value_format: "\"%\"0.00"
  }

  measure: valor_avg_ind_4 {
    type: average
    sql: ${TABLE}.VALOR * 100;;
    link: {
      label: "Detalle"
      url: "/dashboards/4?Plaza={{ test_mt_indicadores_medicion.plaza | url_encode }}&Region={{test_mt_indicadores_medicion.region| url_encode }}&Fecha+Expediciones={{ _filters['test_mt_indicadores_medicion.fecha_filtro_date'] | url_encode }}&Fecha+Tendencias=7+day"
    }
    value_format: "\"%\"0.00"
  }



# --------------------------------------
# Indicador 5: % Confirmación Entrega
# --------------------------------------
  dimension: objetivo_ind_5 {
    type: number
    sql: ${TABLE}.objetivo ;;
    link: {
      label: "Detalle"
      url: "/dashboards/9?Plaza={{ test_mt_indicadores_medicion.plaza | url_encode }}&Region={{test_mt_indicadores_medicion.region| url_encode }}&Fecha+Expediciones={{ _filters['test_mt_indicadores_medicion.fecha_filtro_date'] | url_encode }}&Fecha+Tendencias=7+day"
    }
    value_format: "\"%\"0.00"
  }

  measure: objetivo_avg_ind_5 {
    type: average
    sql: ${TABLE}.objetivo ;;
    link: {
      label: "Detalle"
      url: "/dashboards/9?Plaza={{ test_mt_indicadores_medicion.plaza | url_encode }}&Region={{test_mt_indicadores_medicion.region| url_encode }}&Fecha+Expediciones={{ _filters['test_mt_indicadores_medicion.fecha_filtro_date'] | url_encode }}&Fecha+Tendencias=7+day"
    }
    value_format: "\"%\"0.00"
  }

  dimension: valor_ind_5 {
    type: number
    sql: ${TABLE}.VALOR ;;
    link: {
      label: "Detalle"
      url: "/dashboards/9?Plaza={{ test_mt_indicadores_medicion.plaza | url_encode }}&Region={{test_mt_indicadores_medicion.region| url_encode }}&Fecha+Expediciones={{ _filters['test_mt_indicadores_medicion.fecha_filtro_date'] | url_encode }}&Fecha+Tendencias=7+day"
    }
    value_format: "\"%\"0.00"
  }

  measure: valor_avg_ind_5 {
    type: average
    sql: ${TABLE}.VALOR ;;
    link: {
      label: "Detalle"
      url: "/dashboards/9?Plaza={{ test_mt_indicadores_medicion.plaza | url_encode }}&Region={{test_mt_indicadores_medicion.region| url_encode }}&Fecha+Expediciones={{ _filters['test_mt_indicadores_medicion.fecha_filtro_date'] | url_encode }}&Fecha+Tendencias=7+day"
    }
    value_format: "\"%\"0.00"
  }


# --------------------------------------
# Indicador 6: % Plazo y Ventana Horaria
# --------------------------------------
  dimension: objetivo_ind_6 {
    type: number
    sql: ${TABLE}.objetivo ;;
    link: {
      label: "Detalle"
      url: "/dashboards/10?Plaza={{ test_mt_indicadores_medicion.plaza | url_encode }}&Region={{test_mt_indicadores_medicion.region| url_encode }}&Fecha+Expediciones={{ _filters['test_mt_indicadores_medicion.fecha_filtro_date'] | url_encode }}&Fecha+Tendencias=7+day"
    }
    value_format: "\"%\"0.00"
  }

  measure: objetivo_avg_ind_6 {
    type: average
    sql: ${TABLE}.objetivo ;;
    link: {
      label: "Detalle"
      url: "/dashboards/10?Plaza={{ test_mt_indicadores_medicion.plaza | url_encode }}&Region={{test_mt_indicadores_medicion.region| url_encode }}&Fecha+Expediciones={{ _filters['test_mt_indicadores_medicion.fecha_filtro_date'] | url_encode }}&Fecha+Tendencias=7+day"
    }
    value_format: "\"%\"0.00"
  }

  dimension: valor_ind_6 {
    type: number
    sql: ${TABLE}.VALOR * 100;;
    link: {
      label: "Detalle"
      url: "/dashboards/10?Plaza={{ test_mt_indicadores_medicion.plaza | url_encode }}&Region={{test_mt_indicadores_medicion.region| url_encode }}&Fecha+Expediciones={{ _filters['test_mt_indicadores_medicion.fecha_filtro_date'] | url_encode }}&Fecha+Tendencias=7+day"
    }
    value_format: "\"%\"0.00"
  }

  measure: valor_avg_ind_6 {
    type: average
    sql: ${TABLE}.VALOR * 100;;
    link: {
      label: "Detalle"
      url: "/dashboards/10?Plaza={{ test_mt_indicadores_medicion.plaza | url_encode }}&Region={{test_mt_indicadores_medicion.region| url_encode }}&Fecha+Expediciones={{ _filters['test_mt_indicadores_medicion.fecha_filtro_date'] | url_encode }}&Fecha+Tendencias=7+day"
    }
    value_format: "\"%\"0.00"
  }



# --------------------------------------
# Indicador 7: € Tonelada Arrastre
# --------------------------------------
  dimension: objetivo_ind_7 {
    type: number
    sql: ${TABLE}.objetivo ;;
    link: {
      label: "Detalle"
      url: "/dashboards/11?Plaza={{ test_mt_indicadores_medicion.plaza | url_encode }}&Region={{test_mt_indicadores_medicion.region| url_encode }}&Fecha+Expediciones={{ _filters['test_mt_indicadores_medicion.fecha_filtro_date'] | url_encode }}&Fecha+Tendencias=7+day"
    }
    value_format: "\"€\"0.00"
  }

  measure: objetivo_avg_ind_7 {
    type: average
    sql: ${TABLE}.objetivo ;;
    link: {
      label: "Detalle"
      url: "/dashboards/11?Plaza={{ test_mt_indicadores_medicion.plaza | url_encode }}&Region={{test_mt_indicadores_medicion.region| url_encode }}&Fecha+Expediciones={{ _filters['test_mt_indicadores_medicion.fecha_filtro_date'] | url_encode }}&Fecha+Tendencias=7+day"
    }
    value_format: "\"€\"0.00"
  }

  dimension: valor_ind_7 {
    type: number
    sql: ${TABLE}.VALOR ;;
    link: {
      label: "Detalle"
      url: "/dashboards/11?Plaza={{ test_mt_indicadores_medicion.plaza | url_encode }}&Region={{test_mt_indicadores_medicion.region| url_encode }}&Fecha+Expediciones={{ _filters['test_mt_indicadores_medicion.fecha_filtro_date'] | url_encode }}&Fecha+Tendencias=7+day"
    }
    value_format: "\"€\"0.00"
  }

  measure: valor_avg_ind_7 {
    type: average
    sql: ${TABLE}.VALOR ;;
    link: {
      label: "Detalle"
      url: "/dashboards/11?Plaza={{ test_mt_indicadores_medicion.plaza | url_encode }}&Region={{test_mt_indicadores_medicion.region| url_encode }}&Fecha+Expediciones={{ _filters['test_mt_indicadores_medicion.fecha_filtro_date'] | url_encode }}&Fecha+Tendencias=7+day"
    }
    value_format: "\"€\"0.00"
  }



# --------------------------------------
# Indicador 9: Índice de Ocupación
# --------------------------------------
  dimension: objetivo_ind_9 {
    type: number
    sql: ${TABLE}.objetivo ;;
    link: {
      label: "Detalle"
      url: "/dashboards/12?Plaza={{ test_mt_indicadores_medicion.plaza | url_encode }}&Region={{test_mt_indicadores_medicion.region| url_encode }}&Fecha+Expediciones={{ _filters['test_mt_indicadores_medicion.fecha_filtro_date'] | url_encode }}&Fecha+Tendencias=7+day"
    }
  }

  measure: objetivo_avg_ind_9 {
    type: average
    sql: ${TABLE}.objetivo ;;
    link: {
      label: "Detalle"
      url: "/dashboards/12?Plaza={{ test_mt_indicadores_medicion.plaza | url_encode }}&Region={{test_mt_indicadores_medicion.region| url_encode }}&Fecha+Expediciones={{ _filters['test_mt_indicadores_medicion.fecha_filtro_date'] | url_encode }}&Fecha+Tendencias=7+day"
    }
  }

  dimension: valor_ind_9 {
    type: number
    sql: ${TABLE}.VALOR ;;
    link: {
      label: "Detalle"
      url: "/dashboards/12?Plaza={{ test_mt_indicadores_medicion.plaza | url_encode }}&Region={{test_mt_indicadores_medicion.region| url_encode }}&Fecha+Expediciones={{ _filters['test_mt_indicadores_medicion.fecha_filtro_date'] | url_encode }}&Fecha+Tendencias=7+day"
    }
  }

  measure: valor_avg_ind_9 {
    type: average
    sql: ${TABLE}.VALOR ;;
    link: {
      label: "Detalle"
      url: "/dashboards/12?Plaza={{ test_mt_indicadores_medicion.plaza | url_encode }}&Region={{test_mt_indicadores_medicion.region| url_encode }}&Fecha+Expediciones={{ _filters['test_mt_indicadores_medicion.fecha_filtro_date'] | url_encode }}&Fecha+Tendencias=7+day"
    }
  }

# --------------------------------------
# Indicador 10: % Lecturas (Carga)
# --------------------------------------
  dimension: objetivo_ind_10 {
    type: number
    sql: ${TABLE}.objetivo ;;
    link: {
      label: "Detalle"
      url: "/dashboards/7?Plaza={{ test_mt_indicadores_medicion.plaza | url_encode }}&Region={{test_mt_indicadores_medicion.region| url_encode }}&Fecha+Expediciones={{ _filters['test_mt_indicadores_medicion.fecha_filtro_date'] | url_encode }}&Fecha+Tendencias=7+day"
    }
    value_format: "\"%\"0.00"
  }

  measure: objetivo_avg_ind_10 {
    type: average
    sql: ${TABLE}.objetivo ;;
    link: {
      label: "Detalle"
      url: "/dashboards/7?Plaza={{ test_mt_indicadores_medicion.plaza | url_encode }}&Region={{test_mt_indicadores_medicion.region| url_encode }}&Fecha+Expediciones={{ _filters['test_mt_indicadores_medicion.fecha_filtro_date'] | url_encode }}&Fecha+Tendencias=7+day"
    }
    value_format: "\"%\"0.00"
  }

  dimension: valor_ind_10 {
    type: number
    sql: ${TABLE}.VALOR * 100;;
    link: {
      label: "Detalle"
      url: "/dashboards/7?Plaza={{ test_mt_indicadores_medicion.plaza | url_encode }}&Region={{test_mt_indicadores_medicion.region| url_encode }}&Fecha+Expediciones={{ _filters['test_mt_indicadores_medicion.fecha_filtro_date'] | url_encode }}&Fecha+Tendencias=7+day"
    }
    value_format: "\"%\"0.00"
  }

  measure: valor_avg_ind_10 {
    type: average
    sql: ${TABLE}.VALOR * 100 ;;
    link: {
      label: "Detalle"
      url: "/dashboards/7?Plaza={{ test_mt_indicadores_medicion.plaza | url_encode }}&Region={{test_mt_indicadores_medicion.region| url_encode }}&Fecha+Expediciones={{ _filters['test_mt_indicadores_medicion.fecha_filtro_date'] | url_encode }}&Fecha+Tendencias=7+day"
    }
    value_format: "\"%\"0.00"
  }

# --------------------------------------
# Indicador 17: % Cierres de O.T.
# --------------------------------------
  dimension: objetivo_ind_17 {
    type: number
    sql: ${TABLE}.objetivo ;;
    link: {
      label: "Detalle"
      url: "/dashboards/13?Plaza={{ test_mt_indicadores_medicion.plaza | url_encode }}&Region={{test_mt_indicadores_medicion.region| url_encode }}&Fecha+Expediciones={{ _filters['test_mt_indicadores_medicion.fecha_filtro_date'] | url_encode }}&Fecha+Tendencias=7+day"
    }
    value_format: "\"%\"0.00"
  }

  measure: objetivo_avg_ind_17 {
    type: average
    sql: ${TABLE}.objetivo ;;
    link: {
      label: "Detalle"
      url: "/dashboards/13?Plaza={{ test_mt_indicadores_medicion.plaza | url_encode }}&Region={{test_mt_indicadores_medicion.region| url_encode }}&Fecha+Expediciones={{ _filters['test_mt_indicadores_medicion.fecha_filtro_date'] | url_encode }}&Fecha+Tendencias=7+day"
    }
    value_format: "\"%\"0.00"
  }

  dimension: valor_ind_17 {
    type: number
    sql: ${TABLE}.VALOR * 100;;
    link: {
      label: "Detalle"
      url: "/dashboards/13?Plaza={{ test_mt_indicadores_medicion.plaza | url_encode }}&Region={{test_mt_indicadores_medicion.region| url_encode }}&Fecha+Expediciones={{ _filters['test_mt_indicadores_medicion.fecha_filtro_date'] | url_encode }}&Fecha+Tendencias=7+day"
    }
    value_format: "\"%\"0.00"
  }

  measure: valor_avg_ind_17 {
    type: average
    sql: ${TABLE}.VALOR * 100;;
    link: {
      label: "Detalle"
      url: "/dashboards/13?Plaza={{ test_mt_indicadores_medicion.plaza | url_encode }}&Region={{test_mt_indicadores_medicion.region| url_encode }}&Fecha+Expediciones={{ _filters['test_mt_indicadores_medicion.fecha_filtro_date'] | url_encode }}&Fecha+Tendencias=7+day"
    }
    value_format: "\"%\"0.00"
  }

  parameter: filtro_indicador {
    label: "Elige indicador"
    type: string
    allowed_value: {
      label: "€ Tonelada de Reparto y Recogida"
      # value: "valor_ind_1"
      value: "3"
    }
    allowed_value: {
      label: "€ Expedición"
      # value: "valor_ind_2"
      value: "8"
    }
    allowed_value: {
      label: "% Lecturas (Descarga)"
      # value: "valor_ind_4"
      value: "4"
    }
    allowed_value: {
      label: "% Confirmación Entrega"
      # value: "valor_ind_5"
      value: "9"
    }
    allowed_value: {
      label: "% Plazo y Ventana Horaria"
      # value: "valor_ind_6"
      value: "10"
    }
    allowed_value: {
      label: "€ Tonelada Arrastre"
      # value: "valor_ind_7"
      value: "11"
    }
    allowed_value: {
      label: "Índice de Ocupación"
      # value: "valor_ind_9"
      value: "12"
    }
    allowed_value: {
      label: "% Lecturas (Carga)"
      # value: "valor_ind_10"
      value: "7"
    }
    allowed_value: {
      label: "% Cierres de O.T."
      # value: "valor_ind_17"
      value: "13"
    }
  }



  dimension: valor_indicador_dinamico {
    type: number
    sql:
    CASE
      WHEN {% parameter filtro_indicador %} = '3' AND ${TABLE}.id_indicador = 1 THEN ${TABLE}.VALOR
      WHEN {% parameter filtro_indicador %} = '8' AND ${TABLE}.id_indicador = 2 THEN ${TABLE}.VALOR
      WHEN {% parameter filtro_indicador %} = '4' AND ${TABLE}.id_indicador = 4 THEN ${TABLE}.VALOR * 100
      WHEN {% parameter filtro_indicador %} = '9' AND ${TABLE}.id_indicador = 5 THEN ${TABLE}.VALOR
      WHEN {% parameter filtro_indicador %} = '10' AND ${TABLE}.id_indicador = 6 THEN ${TABLE}.VALOR * 100
      WHEN {% parameter filtro_indicador %} = '11' AND ${TABLE}.id_indicador = 7 THEN ${TABLE}.VALOR
      WHEN {% parameter filtro_indicador %} = '12' AND ${TABLE}.id_indicador = 9 THEN ${TABLE}.VALOR
      WHEN {% parameter filtro_indicador %} = '7' AND ${TABLE}.id_indicador = 10 THEN ${TABLE}.VALOR * 100
      WHEN {% parameter filtro_indicador %} = '13' AND ${TABLE}.id_indicador = 17 THEN ${TABLE}.VALOR * 100
      ELSE NULL
    END ;;
    link: {
      label: "Detalle"
      url: "/dashboards/{{ filtro_indicador._parameter_value | remove: \"'\" }}?Plaza={{ test_mt_indicadores_medicion.plaza | url_encode }}&Region={{test_mt_indicadores_medicion.region| url_encode }}&Fecha+Expediciones={{ _filters['test_mt_indicadores_medicion.fecha_filtro_date'] | url_encode }}&Fecha+Tendencias=7+day"
    }
    value_format: "0.00"
  }

  measure: media_valor_indicador_dinamico {
    type: average
    sql:
    CASE
      WHEN {% parameter filtro_indicador %} = '3' AND ${TABLE}.id_indicador = 1 THEN ${TABLE}.VALOR
      WHEN {% parameter filtro_indicador %} = '8' AND ${TABLE}.id_indicador = 2 THEN ${TABLE}.VALOR
      WHEN {% parameter filtro_indicador %} = '4' AND ${TABLE}.id_indicador = 4 THEN ${TABLE}.VALOR * 100
      WHEN {% parameter filtro_indicador %} = '9' AND ${TABLE}.id_indicador = 5 THEN ${TABLE}.VALOR
      WHEN {% parameter filtro_indicador %} = '10' AND ${TABLE}.id_indicador = 6 THEN ${TABLE}.VALOR * 100
      WHEN {% parameter filtro_indicador %} = '11' AND ${TABLE}.id_indicador = 7 THEN ${TABLE}.VALOR
      WHEN {% parameter filtro_indicador %} = '12' AND ${TABLE}.id_indicador = 9 THEN ${TABLE}.VALOR
      WHEN {% parameter filtro_indicador %} = '7' AND ${TABLE}.id_indicador = 10 THEN ${TABLE}.VALOR * 100
      WHEN {% parameter filtro_indicador %} = '13' AND ${TABLE}.id_indicador = 17 THEN ${TABLE}.VALOR * 100
      ELSE NULL
    END ;;
    link: {
      label: "Detalle"
      url: "/dashboards/{{ filtro_indicador._parameter_value | remove: \"'\" }}?Plaza={{ test_mt_indicadores_medicion.plaza | url_encode }}&Region={{test_mt_indicadores_medicion.region| url_encode }}&Fecha+Expediciones={{ _filters['test_mt_indicadores_medicion.fecha_filtro_date'] | url_encode }}&Fecha+Tendencias=7+day"
    }
    value_format: "0.00"
  }


  dimension: objetivo_indicador_dinamico {
    type: number
    sql:
    CASE
      WHEN {% parameter filtro_indicador %} = '3' AND ${TABLE}.id_indicador = 1 THEN ${TABLE}.objetivo
      WHEN {% parameter filtro_indicador %} = '8' AND ${TABLE}.id_indicador = 2 THEN ${TABLE}.objetivo
      WHEN {% parameter filtro_indicador %} = '4' AND ${TABLE}.id_indicador = 4 THEN ${TABLE}.objetivo
      WHEN {% parameter filtro_indicador %} = '9' AND ${TABLE}.id_indicador = 5 THEN ${TABLE}.objetivo
      WHEN {% parameter filtro_indicador %} = '10' AND ${TABLE}.id_indicador = 6 THEN ${TABLE}.objetivo
      WHEN {% parameter filtro_indicador %} = '11' AND ${TABLE}.id_indicador = 7 THEN ${TABLE}.objetivo
      WHEN {% parameter filtro_indicador %} = '12' AND ${TABLE}.id_indicador = 9 THEN ${TABLE}.objetivo
      WHEN {% parameter filtro_indicador %} = '7' AND ${TABLE}.id_indicador = 10 THEN ${TABLE}.objetivo
      WHEN {% parameter filtro_indicador %} = '13' AND ${TABLE}.id_indicador = 17 THEN ${TABLE}.objetivo
      ELSE NULL
    END ;;
    value_format: "0.00"
  }

  dimension: nombre_indicador_dinamico {
    type: string
    sql:
    CASE
      WHEN {% parameter filtro_indicador %} = '3' AND ${TABLE}.id_indicador = 1 THEN "€ Tonelada de Reparto y Recogida"
      WHEN {% parameter filtro_indicador %} = '8' AND ${TABLE}.id_indicador = 2 THEN "€ Expedición"
      WHEN {% parameter filtro_indicador %} = '4' AND ${TABLE}.id_indicador = 4 THEN "% Lecturas (Descarga)"
      WHEN {% parameter filtro_indicador %} = '9' AND ${TABLE}.id_indicador = 5 THEN "% Confirmación Entrega"
      WHEN {% parameter filtro_indicador %} = '10' AND ${TABLE}.id_indicador = 6 THEN "% Plazo y Ventana Horaria"
      WHEN {% parameter filtro_indicador %} = '11' AND ${TABLE}.id_indicador = 7 THEN "€ Tonelada Arrastre"
      WHEN {% parameter filtro_indicador %} = '12' AND ${TABLE}.id_indicador = 9 THEN "Índice de Ocupación"
      WHEN {% parameter filtro_indicador %} = '7' AND ${TABLE}.id_indicador = 10 THEN "% Lecturas (Carga)"
      WHEN {% parameter filtro_indicador %} = '13' AND ${TABLE}.id_indicador = 17 THEN "% Cierres de O.T."
      ELSE NULL
    END ;;
  }



  }
