# The name of this view in Looker is "Gs Indicadores Medicion"
view: gs_indicadores_medicion {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `alertran.gs_indicadores_medicion` ;;

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Afecta" in Explore.

  dimension: afecta {
    type: string
    sql: ${TABLE}.afecta ;;
  }

  dimension: id_indicador {
    type: number
    sql: ${TABLE}.id_indicador ;;
  }

  dimension: indicador {
    type: string
    sql: ${TABLE}.indicador ;;
  }

  dimension: objetivo {
    type: number
    sql: ${TABLE}.objetivo ;;
  }

  dimension: valor_ficticio {
    type: number
    sql: ${TABLE}.valor_ficticio ;;
  }
  measure: count {
    type: count
  }
}
