# The name of this view in Looker is "T Regiones Agencias"
view: t_regiones_agencias {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `alertran.t_regiones_agencias` ;;

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Dele Codigo" in Explore.

  dimension: dele_codigo {
    type: string
    sql: ${TABLE}.DELE_CODIGO ;;
  }

  dimension: latitud {
    type: number
    sql: ${TABLE}.LATITUD ;;
  }

  dimension: longitud {
    type: number
    sql: ${TABLE}.LONGITUD ;;
  }

  dimension: nombre {
    type: string
    sql: ${TABLE}.Nombre ;;
  }

  dimension: region {
    type: string
    sql: ${TABLE}.Region ;;
  }

  dimension: ubi_agencia {
    type: location
    sql_latitude: ${TABLE}.LATITUD ;;
    sql_longitude: ${TABLE}.LONGITUD ;;
  }

  measure: count {
    type: count
  }
}
