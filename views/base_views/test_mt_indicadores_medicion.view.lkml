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
      url: "/dashboards/3?Plaza={{ _filters['test_mt_indicadores_medicion.ambito'] | url_encode }}"
    }
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
  }
  measure: count {
    type: count
  }
}
