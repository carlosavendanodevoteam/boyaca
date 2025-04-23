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
  dimension: objetivo {
    type: number
    sql: ${TABLE}.objetivo ;;
    link: {
      label: "Detalle"
      url: "/dashboards/3?Plaza={{ _filters['test_mt_indicadores_medicion.plaza'] | url_encode }}&Region={{ _filters['test_mt_indicadores_medicion.region'] | url_encode }}&Fecha={{ _filters['test_mt_indicadores_medicion.fecha_filtro_date'] | url_encode }}"
    }
    value_format: "\"€\"0.00"
  }

  measure: objetivo_avg {
    type: average
    sql: ${TABLE}.objetivo ;;
    link: {
      label: "Detalle"
      url: "/dashboards/3?Plaza={{ _filters['test_mt_indicadores_medicion.plaza'] | url_encode }}&Region={{ _filters['test_mt_indicadores_medicion.region'] | url_encode }}&Fecha={{ _filters['test_mt_indicadores_medicion.fecha_filtro_date'] | url_encode }}"
    }
    value_format: "\"€\"0.00"
  }
  dimension: plaza {
    type: string
    sql: ${TABLE}.plaza ;;
  }
  dimension: region {
    type: string
    sql: ${TABLE}.region ;;
  }
  dimension: valor {
    type: number
    sql: ${TABLE}.VALOR ;;
    link: {
      label: "Detalle"
      url: "/dashboards/3?Plaza={{ _filters['test_mt_indicadores_medicion.plaza'] | url_encode }}&Region={{ _filters['test_mt_indicadores_medicion.region'] | url_encode }}&Fecha={{ _filters['test_mt_indicadores_medicion.fecha_filtro_date'] | url_encode }}"
    }
    value_format: "\"€\"0.00"
  }

  measure: valor_avg {
    type: average
    sql: ${TABLE}.VALOR ;;
    link: {
      label: "Detalle"
      url: "/dashboards/3?Plaza={{ _filters['test_mt_indicadores_medicion.plaza'] | url_encode }}&Region={{ _filters['test_mt_indicadores_medicion.region'] | url_encode }}&Fecha={{ _filters['test_mt_indicadores_medicion.fecha_filtro_date'] | url_encode }}"
    }
    value_format: "\"€\"0.00"
  }
  measure: count {
    type: count
  }

  dimension: objetivo_ind_4 {
    type: number
    sql: ${TABLE}.objetivo ;;
    link: {
      label: "Detalle"
      url: "/dashboards/4?Plaza={{ _filters['test_mt_indicadores_medicion.plaza'] | url_encode }}&Region={{ _filters['test_mt_indicadores_medicion.region'] | url_encode }}&Fecha={{ _filters['test_mt_indicadores_medicion.fecha_filtro_date'] | url_encode }}&Proceso=LLEGADA"
    }
    value_format: "\"%\"0.00"
  }

  measure: objetivo_avg_ind_4 {
    type: average
    sql: ${TABLE}.objetivo ;;
    link: {
      label: "Detalle"
      url: "/dashboards/4?Plaza={{ _filters['test_mt_indicadores_medicion.plaza'] | url_encode }}&Region={{ _filters['test_mt_indicadores_medicion.region'] | url_encode }}&Fecha={{ _filters['test_mt_indicadores_medicion.fecha_filtro_date'] | url_encode }}&Proceso=LLEGADA"
    }
    value_format: "\"%\"0.00"
  }

  dimension: valor_ind_4 {
    type: number
    sql: ${TABLE}.VALOR ;;
    link: {
      label: "Detalle"
      url: "/dashboards/4?Plaza={{ _filters['test_mt_indicadores_medicion.plaza'] | url_encode }}&Region={{ _filters['test_mt_indicadores_medicion.region'] | url_encode }}&Fecha={{ _filters['test_mt_indicadores_medicion.fecha_filtro_date'] | url_encode }}&Proceso=LLEGADA"
    }
    value_format: "\"%\"0.00"
  }
  # /dashboards/4?Proceso=LLEGADA&Plaza=&Region=&Fecha+Filtro=7+day
  measure: valor_avg_ind_4 {
    type: average
    sql: ${TABLE}.VALOR ;;
    link: {
      label: "Detalle"
      url: "/dashboards/4?Plaza={{ _filters['test_mt_indicadores_medicion.plaza'] | url_encode }}&Region={{ _filters['test_mt_indicadores_medicion.region'] | url_encode }}&Fecha={{ _filters['test_mt_indicadores_medicion.fecha_filtro_date'] | url_encode }}&Proceso=LLEGADA"
    }
    value_format: "\"%\"0.00"
  }
}
