view: test_mt_indicadores_medicion {
  sql_table_name: `datalake-transporte.TEST.test_mt_indicadores_medicion` ;;

  dimension: ambito {
    type: string
    sql: ${TABLE}.AMBITO ;;
  }

  dimension_group: fecha_filtro {
    type: time
    timeframes: [time, date, week, month, year,day_of_week, day_of_month, day_of_year, day_of_week_index, month_name, month_num]
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

  measure: objetivo_medio {
    type: average
    sql: ${TABLE}.objetivo ;;
    value_format: "0.00"
  }

  measure: valor_medio {
    type: average
    sql: ${TABLE}.valor ;;
    value_format: "0.00"
  }

  measure: diferencia {
    type: number
    sql: (AVG(${TABLE}.valor) - AVG(${TABLE}.objetivo)) / NULLIF(AVG(${TABLE}.objetivo), 0) ;;
    value_format: "0.00%"
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
# Indicador 3: % de Enrutamiento
# --------------------------------------
  dimension: objetivo_ind_3 {
    type: number
    sql: ${TABLE}.objetivo ;;
    link: {
      label: "Detalle"
      url: "/dashboards/17?Plaza={{ test_mt_indicadores_medicion.plaza | url_encode }}&Region={{test_mt_indicadores_medicion.region| url_encode }}&Fecha+Expediciones={{ _filters['test_mt_indicadores_medicion.fecha_filtro_date'] | url_encode }}&Fecha+Tendencias=7+day"
    }
    value_format: "\"%\"0.00"
  }

  measure: objetivo_avg_ind_3 {
    type: average
    sql: ${TABLE}.objetivo ;;
    link: {
      label: "Detalle"
      url: "/dashboards/17?Plaza={{ test_mt_indicadores_medicion.plaza | url_encode }}&Region={{test_mt_indicadores_medicion.region| url_encode }}&Fecha+Expediciones={{ _filters['test_mt_indicadores_medicion.fecha_filtro_date'] | url_encode }}&Fecha+Tendencias=7+day"
    }
    value_format: "\"%\"0.00"
  }

  dimension: valor_ind_3 {
    type: number
    sql: ${TABLE}.VALOR ;;
    link: {
      label: "Detalle"
      url: "/dashboards/17?Plaza={{ test_mt_indicadores_medicion.plaza | url_encode }}&Region={{test_mt_indicadores_medicion.region| url_encode }}&Fecha+Expediciones={{ _filters['test_mt_indicadores_medicion.fecha_filtro_date'] | url_encode }}&Fecha+Tendencias=7+day"
    }
    value_format: "\"%\"0.00"
  }

  measure: valor_avg_ind_3 {
    type: average
    sql: ${TABLE}.VALOR ;;
    link: {
      label: "Detalle"
      url: "/dashboards/17?Plaza={{ test_mt_indicadores_medicion.plaza | url_encode }}&Region={{test_mt_indicadores_medicion.region| url_encode }}&Fecha+Expediciones={{ _filters['test_mt_indicadores_medicion.fecha_filtro_date'] | url_encode }}&Fecha+Tendencias=7+day"
    }
    value_format: "\"%\"0.00"
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
    sql: ${TABLE}.VALOR ;;
    link: {
      label: "Detalle"
      url: "/dashboards/4?Plaza={{ test_mt_indicadores_medicion.plaza | url_encode }}&Region={{test_mt_indicadores_medicion.region| url_encode }}&Fecha+Expediciones={{ _filters['test_mt_indicadores_medicion.fecha_filtro_date'] | url_encode }}&Fecha+Tendencias=7+day"
    }
    value_format: "\"%\"0.00"
  }

  measure: valor_avg_ind_4 {
    type: average
    sql: ${TABLE}.VALOR ;;
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
    sql: ${TABLE}.VALOR ;;
    link: {
      label: "Detalle"
      url: "/dashboards/10?Plaza={{ test_mt_indicadores_medicion.plaza | url_encode }}&Region={{test_mt_indicadores_medicion.region| url_encode }}&Fecha+Expediciones={{ _filters['test_mt_indicadores_medicion.fecha_filtro_date'] | url_encode }}&Fecha+Tendencias=7+day"
    }
    value_format: "\"%\"0.00"
  }

  measure: valor_avg_ind_6 {
    type: average
    sql: ${TABLE}.VALOR ;;
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
    sql: ${TABLE}.VALOR ;;
    link: {
      label: "Detalle"
      url: "/dashboards/7?Plaza={{ test_mt_indicadores_medicion.plaza | url_encode }}&Region={{test_mt_indicadores_medicion.region| url_encode }}&Fecha+Expediciones={{ _filters['test_mt_indicadores_medicion.fecha_filtro_date'] | url_encode }}&Fecha+Tendencias=7+day"
    }
    value_format: "\"%\"0.00"
  }

  measure: valor_avg_ind_10 {
    type: average
    sql: ${TABLE}.VALOR  ;;
    link: {
      label: "Detalle"
      url: "/dashboards/7?Plaza={{ test_mt_indicadores_medicion.plaza | url_encode }}&Region={{test_mt_indicadores_medicion.region| url_encode }}&Fecha+Expediciones={{ _filters['test_mt_indicadores_medicion.fecha_filtro_date'] | url_encode }}&Fecha+Tendencias=7+day"
    }
    value_format: "\"%\"0.00"
  }


# --------------------------------------
# Indicador 12: % Pesaje y Volumetria
# --------------------------------------
  dimension: objetivo_ind_12 {
    type: number
    sql: ${TABLE}.objetivo ;;
    link: {
      label: "Detalle"
      url: "/dashboards/18?Plaza={{ test_mt_indicadores_medicion.plaza | url_encode }}&Region={{test_mt_indicadores_medicion.region| url_encode }}&Fecha+Expediciones={{ _filters['test_mt_indicadores_medicion.fecha_filtro_date'] | url_encode }}&Fecha+Tendencias=7+day"
    }
    value_format: "\"%\"0.00"
  }

  measure: objetivo_avg_ind_12 {
    type: average
    sql: ${TABLE}.objetivo ;;
    link: {
      label: "Detalle"
      url: "/dashboards/18?Plaza={{ test_mt_indicadores_medicion.plaza | url_encode }}&Region={{test_mt_indicadores_medicion.region| url_encode }}&Fecha+Expediciones={{ _filters['test_mt_indicadores_medicion.fecha_filtro_date'] | url_encode }}&Fecha+Tendencias=7+day"
    }
    value_format: "\"%\"0.00"
  }

  dimension: valor_ind_12 {
    type: number
    sql: ${TABLE}.VALOR;;
    link: {
      label: "Detalle"
      url: "/dashboards/18?Plaza={{ test_mt_indicadores_medicion.plaza | url_encode }}&Region={{test_mt_indicadores_medicion.region| url_encode }}&Fecha+Expediciones={{ _filters['test_mt_indicadores_medicion.fecha_filtro_date'] | url_encode }}&Fecha+Tendencias=7+day"
    }
    value_format: "\"%\"0.00"
  }

  measure: valor_avg_ind_12 {
    type: average
    sql: ${TABLE}.VALOR ;;
    link: {
      label: "Detalle"
      url: "/dashboards/18?Plaza={{ test_mt_indicadores_medicion.plaza | url_encode }}&Region={{test_mt_indicadores_medicion.region| url_encode }}&Fecha+Expediciones={{ _filters['test_mt_indicadores_medicion.fecha_filtro_date'] | url_encode }}&Fecha+Tendencias=7+day"
    }
    value_format: "\"%\"0.00"
  }


# --------------------------------------
# Indicador 13: % Salida en hora LD
# --------------------------------------
  dimension: objetivo_ind_13 {
    type: number
    sql: ${TABLE}.objetivo ;;
    link: {
      label: "Detalle"
      url: "/dashboards/19?Plaza={{ test_mt_indicadores_medicion.plaza | url_encode }}&Region={{test_mt_indicadores_medicion.region| url_encode }}&Fecha+Expediciones={{ _filters['test_mt_indicadores_medicion.fecha_filtro_date'] | url_encode }}&Fecha+Tendencias=7+day"
    }
    value_format: "\"%\"0.00"
  }

  measure: objetivo_avg_ind_13 {
    type: average
    sql: ${TABLE}.objetivo ;;
    link: {
      label: "Detalle"
      url: "/dashboards/19?Plaza={{ test_mt_indicadores_medicion.plaza | url_encode }}&Region={{test_mt_indicadores_medicion.region| url_encode }}&Fecha+Expediciones={{ _filters['test_mt_indicadores_medicion.fecha_filtro_date'] | url_encode }}&Fecha+Tendencias=7+day"
    }
    value_format: "\"%\"0.00"
  }

  dimension: valor_ind_13 {
    type: number
    sql: ${TABLE}.VALOR;;
    link: {
      label: "Detalle"
      url: "/dashboards/19?Plaza={{ test_mt_indicadores_medicion.plaza | url_encode }}&Region={{test_mt_indicadores_medicion.region| url_encode }}&Fecha+Expediciones={{ _filters['test_mt_indicadores_medicion.fecha_filtro_date'] | url_encode }}&Fecha+Tendencias=7+day"
    }
    value_format: "\"%\"0.00"
  }

  measure: valor_avg_ind_13 {
    type: average
    sql: ${TABLE}.VALOR ;;
    link: {
      label: "Detalle"
      url: "/dashboards/19?Plaza={{ test_mt_indicadores_medicion.plaza | url_encode }}&Region={{test_mt_indicadores_medicion.region| url_encode }}&Fecha+Expediciones={{ _filters['test_mt_indicadores_medicion.fecha_filtro_date'] | url_encode }}&Fecha+Tendencias=7+day"
    }
    value_format: "\"%\"0.00"
  }


# --------------------------------------
# Indicador 15: % Digitalización PODs
# --------------------------------------
  dimension: objetivo_ind_15 {
    type: number
    sql: ${TABLE}.objetivo ;;
    link: {
      label: "Detalle"
      url: "/dashboards/20?Plaza={{ test_mt_indicadores_medicion.plaza | url_encode }}&Region={{test_mt_indicadores_medicion.region| url_encode }}&Fecha+Expediciones={{ _filters['test_mt_indicadores_medicion.fecha_filtro_date'] | url_encode }}&Fecha+Tendencias=7+day"
    }
    value_format: "\"%\"0.00"
  }

  measure: objetivo_avg_ind_15 {
    type: average
    sql: ${TABLE}.objetivo ;;
    link: {
      label: "Detalle"
      url: "/dashboards/20?Plaza={{ test_mt_indicadores_medicion.plaza | url_encode }}&Region={{test_mt_indicadores_medicion.region| url_encode }}&Fecha+Expediciones={{ _filters['test_mt_indicadores_medicion.fecha_filtro_date'] | url_encode }}&Fecha+Tendencias=7+day"
    }
    value_format: "\"%\"0.00"
  }

  dimension: valor_ind_15 {
    type: number
    sql: ${TABLE}.VALOR;;
    link: {
      label: "Detalle"
      url: "/dashboards/20?Plaza={{ test_mt_indicadores_medicion.plaza | url_encode }}&Region={{test_mt_indicadores_medicion.region| url_encode }}&Fecha+Expediciones={{ _filters['test_mt_indicadores_medicion.fecha_filtro_date'] | url_encode }}&Fecha+Tendencias=7+day"
    }
    value_format: "\"%\"0.00"
  }

  measure: valor_avg_ind_15 {
    type: average
    sql: ${TABLE}.VALOR ;;
    link: {
      label: "Detalle"
      url: "/dashboards/20?Plaza={{ test_mt_indicadores_medicion.plaza | url_encode }}&Region={{test_mt_indicadores_medicion.region| url_encode }}&Fecha+Expediciones={{ _filters['test_mt_indicadores_medicion.fecha_filtro_date'] | url_encode }}&Fecha+Tendencias=7+day"
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
    sql: ${TABLE}.VALOR ;;
    link: {
      label: "Detalle"
      url: "/dashboards/13?Plaza={{ test_mt_indicadores_medicion.plaza | url_encode }}&Region={{test_mt_indicadores_medicion.region| url_encode }}&Fecha+Expediciones={{ _filters['test_mt_indicadores_medicion.fecha_filtro_date'] | url_encode }}&Fecha+Tendencias=7+day"
    }
    value_format: "\"%\"0.00"
  }

  measure: valor_avg_ind_17 {
    type: average
    sql: ${TABLE}.VALOR ;;
    link: {
      label: "Detalle"
      url: "/dashboards/13?Plaza={{ test_mt_indicadores_medicion.plaza | url_encode }}&Region={{test_mt_indicadores_medicion.region| url_encode }}&Fecha+Expediciones={{ _filters['test_mt_indicadores_medicion.fecha_filtro_date'] | url_encode }}&Fecha+Tendencias=7+day"
    }
    value_format: "\"%\"0.00"
  }


# ------------------------------------
# parametro dinamico para indicadores
# ------------------------------------

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
      label: "% de Enrutamiento"
      # value: "valor_ind_3"
      value: "17"
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
      label: "% Pesaje y Volumetria"
      # value: "valor_ind_12"
      value: "18"
    }
    allowed_value: {
      label: "% Salida en hora LD"
      # value: "valor_ind_13"
      value: "19"
    }
    allowed_value: {
      label: "% Digitalización PODs"
      # value: "valor_ind_15"
      value: "20"
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
      WHEN {% parameter filtro_indicador %} = '17' AND ${TABLE}.id_indicador = 3 THEN ${TABLE}.VALOR
      WHEN {% parameter filtro_indicador %} = '4' AND ${TABLE}.id_indicador = 4 THEN ${TABLE}.VALOR
      WHEN {% parameter filtro_indicador %} = '9' AND ${TABLE}.id_indicador = 5 THEN ${TABLE}.VALOR
      WHEN {% parameter filtro_indicador %} = '10' AND ${TABLE}.id_indicador = 6 THEN ${TABLE}.VALOR
      WHEN {% parameter filtro_indicador %} = '11' AND ${TABLE}.id_indicador = 7 THEN ${TABLE}.VALOR
      WHEN {% parameter filtro_indicador %} = '12' AND ${TABLE}.id_indicador = 9 THEN ${TABLE}.VALOR
      WHEN {% parameter filtro_indicador %} = '7' AND ${TABLE}.id_indicador = 10 THEN ${TABLE}.VALOR
      WHEN {% parameter filtro_indicador %} = '18' AND ${TABLE}.id_indicador = 12 THEN ${TABLE}.VALOR
      WHEN {% parameter filtro_indicador %} = '19' AND ${TABLE}.id_indicador = 13 THEN ${TABLE}.VALOR
      WHEN {% parameter filtro_indicador %} = '20' AND ${TABLE}.id_indicador = 15 THEN ${TABLE}.VALOR
      WHEN {% parameter filtro_indicador %} = '13' AND ${TABLE}.id_indicador = 17 THEN ${TABLE}.VALOR
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
      WHEN {% parameter filtro_indicador %} = '17' AND ${TABLE}.id_indicador = 3 THEN ${TABLE}.VALOR
      WHEN {% parameter filtro_indicador %} = '4' AND ${TABLE}.id_indicador = 4 THEN ${TABLE}.VALOR
      WHEN {% parameter filtro_indicador %} = '9' AND ${TABLE}.id_indicador = 5 THEN ${TABLE}.VALOR
      WHEN {% parameter filtro_indicador %} = '10' AND ${TABLE}.id_indicador = 6 THEN ${TABLE}.VALOR
      WHEN {% parameter filtro_indicador %} = '11' AND ${TABLE}.id_indicador = 7 THEN ${TABLE}.VALOR
      WHEN {% parameter filtro_indicador %} = '12' AND ${TABLE}.id_indicador = 9 THEN ${TABLE}.VALOR
      WHEN {% parameter filtro_indicador %} = '7' AND ${TABLE}.id_indicador = 10 THEN ${TABLE}.VALOR
      WHEN {% parameter filtro_indicador %} = '18' AND ${TABLE}.id_indicador = 12 THEN ${TABLE}.VALOR
      WHEN {% parameter filtro_indicador %} = '19' AND ${TABLE}.id_indicador = 13 THEN ${TABLE}.VALOR
      WHEN {% parameter filtro_indicador %} = '20' AND ${TABLE}.id_indicador = 15 THEN ${TABLE}.VALOR
      WHEN {% parameter filtro_indicador %} = '13' AND ${TABLE}.id_indicador = 17 THEN ${TABLE}.VALOR
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
      WHEN {% parameter filtro_indicador %} = '17' AND ${TABLE}.id_indicador = 3 THEN ${TABLE}.objetivo
      WHEN {% parameter filtro_indicador %} = '4' AND ${TABLE}.id_indicador = 4 THEN ${TABLE}.objetivo
      WHEN {% parameter filtro_indicador %} = '9' AND ${TABLE}.id_indicador = 5 THEN ${TABLE}.objetivo
      WHEN {% parameter filtro_indicador %} = '10' AND ${TABLE}.id_indicador = 6 THEN ${TABLE}.objetivo
      WHEN {% parameter filtro_indicador %} = '11' AND ${TABLE}.id_indicador = 7 THEN ${TABLE}.objetivo
      WHEN {% parameter filtro_indicador %} = '12' AND ${TABLE}.id_indicador = 9 THEN ${TABLE}.objetivo
      WHEN {% parameter filtro_indicador %} = '7' AND ${TABLE}.id_indicador = 10 THEN ${TABLE}.objetivo
      WHEN {% parameter filtro_indicador %} = '18' AND ${TABLE}.id_indicador = 12 THEN ${TABLE}.objetivo
      WHEN {% parameter filtro_indicador %} = '19' AND ${TABLE}.id_indicador = 13 THEN ${TABLE}.objetivo
      WHEN {% parameter filtro_indicador %} = '20' AND ${TABLE}.id_indicador = 15 THEN ${TABLE}.objetivo
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
      WHEN {% parameter filtro_indicador %} = '17' AND ${TABLE}.id_indicador = 3 THEN "% de Enrutamiento"
      WHEN {% parameter filtro_indicador %} = '4' AND ${TABLE}.id_indicador = 4 THEN "% Lecturas (Descarga)"
      WHEN {% parameter filtro_indicador %} = '9' AND ${TABLE}.id_indicador = 5 THEN "% Confirmación Entrega"
      WHEN {% parameter filtro_indicador %} = '10' AND ${TABLE}.id_indicador = 6 THEN "% Plazo y Ventana Horaria"
      WHEN {% parameter filtro_indicador %} = '11' AND ${TABLE}.id_indicador = 7 THEN "€ Tonelada Arrastre"
      WHEN {% parameter filtro_indicador %} = '12' AND ${TABLE}.id_indicador = 9 THEN "Índice de Ocupación"
      WHEN {% parameter filtro_indicador %} = '7' AND ${TABLE}.id_indicador = 10 THEN "% Lecturas (Carga)"
      WHEN {% parameter filtro_indicador %} = '18' AND ${TABLE}.id_indicador = 12 THEN "% Pesaje y Volumetria"
      WHEN {% parameter filtro_indicador %} = '19' AND ${TABLE}.id_indicador = 13 THEN "% Salida en hora LD"
      WHEN {% parameter filtro_indicador %} = '20' AND ${TABLE}.id_indicador = 15 THEN "% Digitalización PODs"
      WHEN {% parameter filtro_indicador %} = '13' AND ${TABLE}.id_indicador = 17 THEN "% Cierres de O.T."
      ELSE NULL
    END ;;
  }

  measure: diferencia_indicador_dinamico {
    type: number
    sql: (
          CASE
            WHEN {% parameter filtro_indicador %} = '3' AND ${TABLE}.id_indicador = 1 THEN -1
            WHEN {% parameter filtro_indicador %} = '8' AND ${TABLE}.id_indicador = 2 THEN -1
            WHEN {% parameter filtro_indicador %} = '11' AND ${TABLE}.id_indicador = 7 THEN -1
            ELSE 1
          END
        ) * (
          (
            AVG(
              CASE
                WHEN {% parameter filtro_indicador %} = '3' AND ${TABLE}.id_indicador = 1 THEN ${TABLE}.VALOR
                WHEN {% parameter filtro_indicador %} = '8' AND ${TABLE}.id_indicador = 2 THEN ${TABLE}.VALOR
                WHEN {% parameter filtro_indicador %} = '17' AND ${TABLE}.id_indicador = 3 THEN ${TABLE}.VALOR
                WHEN {% parameter filtro_indicador %} = '4' AND ${TABLE}.id_indicador = 4 THEN ${TABLE}.VALOR
                WHEN {% parameter filtro_indicador %} = '9' AND ${TABLE}.id_indicador = 5 THEN ${TABLE}.VALOR
                WHEN {% parameter filtro_indicador %} = '10' AND ${TABLE}.id_indicador = 6 THEN ${TABLE}.VALOR
                WHEN {% parameter filtro_indicador %} = '11' AND ${TABLE}.id_indicador = 7 THEN ${TABLE}.VALOR
                WHEN {% parameter filtro_indicador %} = '12' AND ${TABLE}.id_indicador = 9 THEN ${TABLE}.VALOR
                WHEN {% parameter filtro_indicador %} = '7' AND ${TABLE}.id_indicador = 10 THEN ${TABLE}.VALOR
                WHEN {% parameter filtro_indicador %} = '18' AND ${TABLE}.id_indicador = 12 THEN ${TABLE}.VALOR
                WHEN {% parameter filtro_indicador %} = '19' AND ${TABLE}.id_indicador = 13 THEN ${TABLE}.VALOR
                WHEN {% parameter filtro_indicador %} = '20' AND ${TABLE}.id_indicador = 15 THEN ${TABLE}.VALOR
                WHEN {% parameter filtro_indicador %} = '13' AND ${TABLE}.id_indicador = 17 THEN ${TABLE}.VALOR
                ELSE NULL
              END
            ) -
            AVG(
              CASE
                WHEN {% parameter filtro_indicador %} = '3' AND ${TABLE}.id_indicador = 1 THEN ${TABLE}.objetivo
                WHEN {% parameter filtro_indicador %} = '8' AND ${TABLE}.id_indicador = 2 THEN ${TABLE}.objetivo
                WHEN {% parameter filtro_indicador %} = '17' AND ${TABLE}.id_indicador = 3 THEN ${TABLE}.objetivo
                WHEN {% parameter filtro_indicador %} = '4' AND ${TABLE}.id_indicador = 4 THEN ${TABLE}.objetivo
                WHEN {% parameter filtro_indicador %} = '9' AND ${TABLE}.id_indicador = 5 THEN ${TABLE}.objetivo
                WHEN {% parameter filtro_indicador %} = '10' AND ${TABLE}.id_indicador = 6 THEN ${TABLE}.objetivo
                WHEN {% parameter filtro_indicador %} = '11' AND ${TABLE}.id_indicador = 7 THEN ${TABLE}.objetivo
                WHEN {% parameter filtro_indicador %} = '12' AND ${TABLE}.id_indicador = 9 THEN ${TABLE}.objetivo
                WHEN {% parameter filtro_indicador %} = '7' AND ${TABLE}.id_indicador = 10 THEN ${TABLE}.objetivo
                WHEN {% parameter filtro_indicador %} = '18' AND ${TABLE}.id_indicador = 12 THEN ${TABLE}.objetivo
                WHEN {% parameter filtro_indicador %} = '19' AND ${TABLE}.id_indicador = 13 THEN ${TABLE}.objetivo
                WHEN {% parameter filtro_indicador %} = '20' AND ${TABLE}.id_indicador = 15 THEN ${TABLE}.objetivo
                WHEN {% parameter filtro_indicador %} = '13' AND ${TABLE}.id_indicador = 17 THEN ${TABLE}.objetivo
                ELSE NULL
              END
            )
          ) / NULLIF(
            AVG(
              CASE
                WHEN {% parameter filtro_indicador %} = '3' AND ${TABLE}.id_indicador = 1 THEN ${TABLE}.objetivo
                WHEN {% parameter filtro_indicador %} = '8' AND ${TABLE}.id_indicador = 2 THEN ${TABLE}.objetivo
                WHEN {% parameter filtro_indicador %} = '17' AND ${TABLE}.id_indicador = 3 THEN ${TABLE}.objetivo
                WHEN {% parameter filtro_indicador %} = '4' AND ${TABLE}.id_indicador = 4 THEN ${TABLE}.objetivo
                WHEN {% parameter filtro_indicador %} = '9' AND ${TABLE}.id_indicador = 5 THEN ${TABLE}.objetivo
                WHEN {% parameter filtro_indicador %} = '10' AND ${TABLE}.id_indicador = 6 THEN ${TABLE}.objetivo
                WHEN {% parameter filtro_indicador %} = '11' AND ${TABLE}.id_indicador = 7 THEN ${TABLE}.objetivo
                WHEN {% parameter filtro_indicador %} = '12' AND ${TABLE}.id_indicador = 9 THEN ${TABLE}.objetivo
                WHEN {% parameter filtro_indicador %} = '7' AND ${TABLE}.id_indicador = 10 THEN ${TABLE}.objetivo
                WHEN {% parameter filtro_indicador %} = '18' AND ${TABLE}.id_indicador = 12 THEN ${TABLE}.objetivo
                WHEN {% parameter filtro_indicador %} = '19' AND ${TABLE}.id_indicador = 13 THEN ${TABLE}.objetivo
                WHEN {% parameter filtro_indicador %} = '20' AND ${TABLE}.id_indicador = 15 THEN ${TABLE}.objetivo
                WHEN {% parameter filtro_indicador %} = '13' AND ${TABLE}.id_indicador = 17 THEN ${TABLE}.objetivo
                ELSE NULL
              END
            ), 0
          )
        ) ;;
    value_format: "0.00%"
  }


# ------------------
# pop nativo looker
# ------------------
  measure: pop_indicador_ano_pasado {
    type: period_over_period
    label: "Pop indicador año pasado"
    description: "Indicador año pasado"
    based_on: valor_medio
    based_on_time: fecha_filtro_year
    period: year
    kind: previous
    value_format: "0.00"
  }

  measure: pop_indicador_mes_pasado {
    type: period_over_period
    description: "Indicador mes pasado"
    based_on: valor_medio
    based_on_time: fecha_filtro_year
    period: month
    kind: previous
    value_format: "0.00"
  }

# ------
# pop 1
# ------
  parameter: elegir_agrupacion {
    label: "2. Elegir Agrupación (Filas)"
    view_label: "_PoP"
    type: unquoted
    default_value: "Month"
    allowed_value: {label: "Nombre del Mes" value:"Month"}
    allowed_value: {label: "Día del Año" value: "DOY"}
    allowed_value: {label: "Día del Mes" value: "DOM"}
    allowed_value: {label: "Día de la Semana" value: "DOW"}
    allowed_value: {label: "Semana" value: "Week"}
    allowed_value: {value: "Date"}
  }

  parameter: elegir_comparacion {
    label: "1. Elegir Comparación (Pivote)"
    view_label: "_PoP"
    type: unquoted
    default_value: "Year"
    allowed_value: {value: "Ano" label: "Año"}
    allowed_value: {value: "Mes"}
    allowed_value: {value: "Semana"}
  }


  dimension: pop_fila  {
    view_label: "_PoP"
    label_from_parameter: elegir_agrupacion
    type: string
    order_by_field: sort_by1
    sql:
      {% if elegir_agrupacion._parameter_value == 'Month' %} ${fecha_filtro_month_name}
      {% elsif elegir_agrupacion._parameter_value == 'DOY' %} ${fecha_filtro_day_of_year}
      {% elsif elegir_agrupacion._parameter_value == 'DOM' %} ${fecha_filtro_day_of_month}
      {% elsif elegir_agrupacion._parameter_value == 'DOW' %} ${fecha_filtro_day_of_week}
      {% elsif elegir_agrupacion._parameter_value == 'Date' %} ${fecha_filtro_date}
      {% elsif elegir_agrupacion._parameter_value == 'Week' %} ${fecha_filtro_week}
      {% else %}NULL{% endif %} ;;
  }

  dimension: pop_pivote {
    view_label: "_PoP"
    label_from_parameter: elegir_comparacion
    type: string
    order_by_field: sort_by2
    sql:
      {% if elegir_comparacion._parameter_value == 'Ano' %} ${fecha_filtro_year}
      {% elsif elegir_comparacion._parameter_value == 'Mes' %} ${fecha_filtro_month_name}
      {% elsif elegir_comparacion._parameter_value == 'Semana' %} ${fecha_filtro_week}
      {% else %}NULL{% endif %} ;;
  }

  dimension: sort_by1 {
    hidden: yes
    type: number
    sql:
      {% if elegir_agrupacion._parameter_value == 'Month' %} ${fecha_filtro_month_num}
      {% elsif elegir_agrupacion._parameter_value == 'DOY' %} ${fecha_filtro_day_of_year}
      {% elsif elegir_agrupacion._parameter_value == 'DOM' %} ${fecha_filtro_day_of_month}
      {% elsif elegir_agrupacion._parameter_value == 'DOW' %} ${fecha_filtro_day_of_week_index}
      {% elsif elegir_agrupacion._parameter_value == 'Date' %} ${fecha_filtro_date}
      {% else %}NULL{% endif %} ;;
  }

  dimension: sort_by2 {
    hidden: yes
    type: string
    sql:
      {% if elegir_comparacion._parameter_value == 'Ano' %} ${fecha_filtro_year}
      {% elsif elegir_comparacion._parameter_value == 'Mes' %} ${fecha_filtro_month_num}
      {% elsif elegir_comparacion._parameter_value == 'Semana' %} ${fecha_filtro_week}
      {% else %}NULL{% endif %} ;;
  }


  }
