# The name of this view in Looker is "Mt Indicadores Medicion"
view: mt_indicadores_medicion {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `alertran.mt_indicadores_medicion` ;;

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Ambito" in Explore.

  dimension: ambito {
    type: string
    sql: ${TABLE}.AMBITO ;;
  }
  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

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
  }

  dimension: valor {
    type: number
    sql: ${TABLE}.VALOR ;;
    value_format: "0.##"
  }

  measure: valor_medio {
    type: average
    sql: ${valor} ;;
  }

  measure: objetivo_medio {
    type: average
    sql: ${objetivo} ;;
  }

  measure: count {
    type: count
  }
}
