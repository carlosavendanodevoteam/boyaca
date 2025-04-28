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
    value_format: "\"€\"0.00"
  }

  measure: objetivo_avg_ind_1 {
    type: average
    sql: ${TABLE}.objetivo ;;
    link: {
      label: "Detalle"
      url: "/dashboards/3?Plaza={{ test_mt_indicadores_medicion.plaza | url_encode }}&Region={{test_mt_indicadores_medicion.region| url_encode }}&Fecha+Expediciones={{ _filters['test_mt_indicadores_medicion.fecha_filtro_date'] | url_encode }}&Fecha+Tendencias=7+day"
    }
    value_format: "\"€\"0.00"
  }

  dimension: valor_ind_1 {
    type: number
    sql: ${TABLE}.VALOR ;;
    link: {
      label: "Detalle "
      url: "/dashboards/3?Plaza={{ test_mt_indicadores_medicion.plaza | url_encode }}&Region={{test_mt_indicadores_medicion.region| url_encode }}&Fecha+Expediciones={{ _filters['test_mt_indicadores_medicion.fecha_filtro_date'] | url_encode }}&Fecha+Tendencias=7+day"
    }
    value_format: "\"€\"0.00"
  }

  measure: valor_avg_ind_1 {
    type: average
    sql: ${TABLE}.VALOR ;;
    link: {
      label: "Detalle "
      url: "/dashboards/3?Plaza={{ test_mt_indicadores_medicion.plaza | url_encode }}&Region={{test_mt_indicadores_medicion.region| url_encode }}&Fecha+Expediciones={{ _filters['test_mt_indicadores_medicion.fecha_filtro_date'] | url_encode }}&Fecha+Tendencias=7+day"
    }
    value_format: "\"€\"0.00"
  }




# --------------------------------------
# Indicador 2: € Expedición
# --------------------------------------
  dimension: objetivo_ind_2 {
    type: number
    sql: ${TABLE}.objetivo ;;
    link: {
      label: "Detalle"
      url: "/dashboards/8?Plaza={{ test_mt_indicadores_medicion.plaza | url_encode }}&Region={{test_mt_indicadores_medicion.region| url_encode }}&Fecha={{ _filters['test_mt_indicadores_medicion.fecha_filtro_date'] | url_encode }}"
    }
    value_format: "\"€\"0.00"
  }

  measure: objetivo_avg_ind_2 {
    type: average
    sql: ${TABLE}.objetivo ;;
    link: {
      label: "Detalle"
      url: "/dashboards/8?Plaza={{ test_mt_indicadores_medicion.plaza | url_encode }}&Region={{test_mt_indicadores_medicion.region| url_encode }}&Fecha={{ _filters['test_mt_indicadores_medicion.fecha_filtro_date'] | url_encode }}"
    }
    value_format: "\"€\"0.00"
  }

  dimension: valor_ind_2 {
    type: number
    sql: ${TABLE}.VALOR ;;
    link: {
      label: "Detalle"
      url: "/dashboards/8?Plaza={{ test_mt_indicadores_medicion.plaza | url_encode }}&Region={{test_mt_indicadores_medicion.region| url_encode }}&Fecha={{ _filters['test_mt_indicadores_medicion.fecha_filtro_date'] | url_encode }}"
    }
    value_format: "\"€\"0.00"
  }

  measure: valor_avg_ind_2 {
    type: average
    sql: ${TABLE}.VALOR ;;
    link: {
      label: "Detalle"
      url: "/dashboards/8?Plaza={{ test_mt_indicadores_medicion.plaza | url_encode }}&Region={{test_mt_indicadores_medicion.region| url_encode }}&Fecha={{ _filters['test_mt_indicadores_medicion.fecha_filtro_date'] | url_encode }}"
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
      url: "/dashboards/4?Plaza={{ test_mt_indicadores_medicion.plaza | url_encode }}&Region={{test_mt_indicadores_medicion.region| url_encode }}&Fecha={{ _filters['test_mt_indicadores_medicion.fecha_filtro_date'] | url_encode }}"
    }
    value_format: "\"%\"0.00"
  }

  measure: objetivo_avg_ind_4 {
    type: average
    sql: ${TABLE}.objetivo ;;
    link: {
      label: "Detalle"
      url: "/dashboards/4?Plaza={{ test_mt_indicadores_medicion.plaza | url_encode }}&Region={{test_mt_indicadores_medicion.region| url_encode }}&Fecha={{ _filters['test_mt_indicadores_medicion.fecha_filtro_date'] | url_encode }}"
    }
    value_format: "\"%\"0.00"
  }

  dimension: valor_ind_4 {
    type: number
    sql: ${TABLE}.VALOR ;;
    link: {
      label: "Detalle"
      url: "/dashboards/4?Plaza={{ test_mt_indicadores_medicion.plaza | url_encode }}&Region={{test_mt_indicadores_medicion.region| url_encode }}&Fecha={{ _filters['test_mt_indicadores_medicion.fecha_filtro_date'] | url_encode }}"
    }
    value_format: "\"%\"0.00"
  }

  measure: valor_avg_ind_4 {
    type: average
    sql: ${TABLE}.VALOR ;;
    link: {
      label: "Detalle"
      url: "/dashboards/4?Plaza={{ test_mt_indicadores_medicion.plaza | url_encode }}&Region={{test_mt_indicadores_medicion.region| url_encode }}&Fecha={{ _filters['test_mt_indicadores_medicion.fecha_filtro_date'] | url_encode }}"
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
      url: "/dashboards/9?Plaza={{ test_mt_indicadores_medicion.plaza | url_encode }}&Region={{test_mt_indicadores_medicion.region| url_encode }}&Fecha={{ _filters['test_mt_indicadores_medicion.fecha_filtro_date'] | url_encode }}"
    }
    value_format: "\"%\"0.00"
  }

  measure: objetivo_avg_ind_5 {
    type: average
    sql: ${TABLE}.objetivo ;;
    link: {
      label: "Detalle"
      url: "/dashboards/9?Plaza={{ test_mt_indicadores_medicion.plaza | url_encode }}&Region={{test_mt_indicadores_medicion.region| url_encode }}&Fecha={{ _filters['test_mt_indicadores_medicion.fecha_filtro_date'] | url_encode }}"
    }
    value_format: "\"%\"0.00"
  }

  dimension: valor_ind_5 {
    type: number
    sql: ${TABLE}.VALOR ;;
    link: {
      label: "Detalle"
      url: "/dashboards/9?Plaza={{ test_mt_indicadores_medicion.plaza | url_encode }}&Region={{test_mt_indicadores_medicion.region| url_encode }}&Fecha={{ _filters['test_mt_indicadores_medicion.fecha_filtro_date'] | url_encode }}"
    }
    value_format: "\"%\"0.00"
  }

  measure: valor_avg_ind_5 {
    type: average
    sql: ${TABLE}.VALOR ;;
    link: {
      label: "Detalle"
      url: "/dashboards/9?Plaza={{ test_mt_indicadores_medicion.plaza | url_encode }}&Region={{test_mt_indicadores_medicion.region| url_encode }}&Fecha={{ _filters['test_mt_indicadores_medicion.fecha_filtro_date'] | url_encode }}"
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
      url: "/dashboards/10?Plaza={{ test_mt_indicadores_medicion.plaza | url_encode }}&Region={{test_mt_indicadores_medicion.region| url_encode }}&Fecha={{ _filters['test_mt_indicadores_medicion.fecha_filtro_date'] | url_encode }}"
    }
    value_format: "\"%\"0.00"
  }

  measure: objetivo_avg_ind_6 {
    type: average
    sql: ${TABLE}.objetivo ;;
    link: {
      label: "Detalle"
      url: "/dashboards/10?Plaza={{ test_mt_indicadores_medicion.plaza | url_encode }}&Region={{test_mt_indicadores_medicion.region| url_encode }}&Fecha={{ _filters['test_mt_indicadores_medicion.fecha_filtro_date'] | url_encode }}"
    }
    value_format: "\"%\"0.00"
  }

  dimension: valor_ind_6 {
    type: number
    sql: ${TABLE}.VALOR ;;
    link: {
      label: "Detalle"
      url: "/dashboards/10?Plaza={{ test_mt_indicadores_medicion.plaza | url_encode }}&Region={{test_mt_indicadores_medicion.region| url_encode }}&Fecha={{ _filters['test_mt_indicadores_medicion.fecha_filtro_date'] | url_encode }}"
    }
    value_format: "\"%\"0.00"
  }

  measure: valor_avg_ind_6 {
    type: average
    sql: ${TABLE}.VALOR ;;
    link: {
      label: "Detalle"
      url: "/dashboards/10?Plaza={{ test_mt_indicadores_medicion.plaza | url_encode }}&Region={{test_mt_indicadores_medicion.region| url_encode }}&Fecha={{ _filters['test_mt_indicadores_medicion.fecha_filtro_date'] | url_encode }}"
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
      url: "/dashboards/11?Plaza={{ test_mt_indicadores_medicion.plaza | url_encode }}&Region={{test_mt_indicadores_medicion.region| url_encode }}&Fecha={{ _filters['test_mt_indicadores_medicion.fecha_filtro_date'] | url_encode }}"
    }
    value_format: "\"€\"0.00"
  }

  measure: objetivo_avg_ind_7 {
    type: average
    sql: ${TABLE}.objetivo ;;
    link: {
      label: "Detalle"
      url: "/dashboards/11?Plaza={{ test_mt_indicadores_medicion.plaza | url_encode }}&Region={{test_mt_indicadores_medicion.region| url_encode }}&Fecha={{ _filters['test_mt_indicadores_medicion.fecha_filtro_date'] | url_encode }}"
    }
    value_format: "\"€\"0.00"
  }

  dimension: valor_ind_7 {
    type: number
    sql: ${TABLE}.VALOR ;;
    link: {
      label: "Detalle"
      url: "/dashboards/11?Plaza={{ test_mt_indicadores_medicion.plaza | url_encode }}&Region={{test_mt_indicadores_medicion.region| url_encode }}&Fecha={{ _filters['test_mt_indicadores_medicion.fecha_filtro_date'] | url_encode }}"
    }
    value_format: "\"€\"0.00"
  }

  measure: valor_avg_ind_7 {
    type: average
    sql: ${TABLE}.VALOR ;;
    link: {
      label: "Detalle"
      url: "/dashboards/11?Plaza={{ test_mt_indicadores_medicion.plaza | url_encode }}&Region={{test_mt_indicadores_medicion.region| url_encode }}&Fecha={{ _filters['test_mt_indicadores_medicion.fecha_filtro_date'] | url_encode }}"
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
      url: "/dashboards/12?Plaza={{ test_mt_indicadores_medicion.plaza | url_encode }}&Region={{test_mt_indicadores_medicion.region| url_encode }}&Fecha={{ _filters['test_mt_indicadores_medicion.fecha_filtro_date'] | url_encode }}"
    }
  }

  measure: objetivo_avg_ind_9 {
    type: average
    sql: ${TABLE}.objetivo ;;
    link: {
      label: "Detalle"
      url: "/dashboards/12?Plaza={{ test_mt_indicadores_medicion.plaza | url_encode }}&Region={{test_mt_indicadores_medicion.region| url_encode }}&Fecha={{ _filters['test_mt_indicadores_medicion.fecha_filtro_date'] | url_encode }}"
    }
  }

  dimension: valor_ind_9 {
    type: number
    sql: ${TABLE}.VALOR ;;
    link: {
      label: "Detalle"
      url: "/dashboards/12?Plaza={{ test_mt_indicadores_medicion.plaza | url_encode }}&Region={{test_mt_indicadores_medicion.region| url_encode }}&Fecha={{ _filters['test_mt_indicadores_medicion.fecha_filtro_date'] | url_encode }}"
    }
  }

  measure: valor_avg_ind_9 {
    type: average
    sql: ${TABLE}.VALOR ;;
    link: {
      label: "Detalle"
      url: "/dashboards/12?Plaza={{ test_mt_indicadores_medicion.plaza | url_encode }}&Region={{test_mt_indicadores_medicion.region| url_encode }}&Fecha={{ _filters['test_mt_indicadores_medicion.fecha_filtro_date'] | url_encode }}"
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
      url: "/dashboards/7?Plaza={{ test_mt_indicadores_medicion.plaza | url_encode }}&Region={{test_mt_indicadores_medicion.region| url_encode }}&Fecha={{ _filters['test_mt_indicadores_medicion.fecha_filtro_date'] | url_encode }}"
    }
    value_format: "\"%\"0.00"
  }

  measure: objetivo_avg_ind_10 {
    type: average
    sql: ${TABLE}.objetivo ;;
    link: {
      label: "Detalle"
      url: "/dashboards/7?Plaza={{ test_mt_indicadores_medicion.plaza | url_encode }}&Region={{test_mt_indicadores_medicion.region| url_encode }}&Fecha={{ _filters['test_mt_indicadores_medicion.fecha_filtro_date'] | url_encode }}"
    }
    value_format: "\"%\"0.00"
  }

  dimension: valor_ind_10 {
    type: number
    sql: ${TABLE}.VALOR ;;
    link: {
      label: "Detalle"
      url: "/dashboards/7?Plaza={{ test_mt_indicadores_medicion.plaza | url_encode }}&Region={{test_mt_indicadores_medicion.region| url_encode }}&Fecha={{ _filters['test_mt_indicadores_medicion.fecha_filtro_date'] | url_encode }}"
    }
    value_format: "\"%\"0.00"
  }

  measure: valor_avg_ind_10 {
    type: average
    sql: ${TABLE}.VALOR ;;
    link: {
      label: "Detalle"
      url: "/dashboards/7?Plaza={{ test_mt_indicadores_medicion.plaza | url_encode }}&Region={{test_mt_indicadores_medicion.region| url_encode }}&Fecha={{ _filters['test_mt_indicadores_medicion.fecha_filtro_date'] | url_encode }}"
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
      url: "/dashboards/13?Plaza={{ test_mt_indicadores_medicion.plaza | url_encode }}&Region={{test_mt_indicadores_medicion.region| url_encode }}&Fecha={{ _filters['test_mt_indicadores_medicion.fecha_filtro_date'] | url_encode }}"
    }
    value_format: "\"%\"0.00"
  }

  measure: objetivo_avg_ind_17 {
    type: average
    sql: ${TABLE}.objetivo ;;
    link: {
      label: "Detalle"
      url: "/dashboards/13?Plaza={{ test_mt_indicadores_medicion.plaza | url_encode }}&Region={{test_mt_indicadores_medicion.region| url_encode }}&Fecha={{ _filters['test_mt_indicadores_medicion.fecha_filtro_date'] | url_encode }}"
    }
    value_format: "\"%\"0.00"
  }

  dimension: valor_ind_17 {
    type: number
    sql: ${TABLE}.VALOR ;;
    link: {
      label: "Detalle"
      url: "/dashboards/13?Plaza={{ test_mt_indicadores_medicion.plaza | url_encode }}&Region={{test_mt_indicadores_medicion.region| url_encode }}&Fecha={{ _filters['test_mt_indicadores_medicion.fecha_filtro_date'] | url_encode }}"
    }
    value_format: "\"%\"0.00"
  }

  measure: valor_avg_ind_17 {
    type: average
    sql: ${TABLE}.VALOR ;;
    link: {
      label: "Detalle"
      url: "/dashboards/13?Plaza={{ test_mt_indicadores_medicion.plaza | url_encode }}&Region={{test_mt_indicadores_medicion.region| url_encode }}&Fecha={{ _filters['test_mt_indicadores_medicion.fecha_filtro_date'] | url_encode }}"
    }
    value_format: "\"%\"0.00"
  }


}
