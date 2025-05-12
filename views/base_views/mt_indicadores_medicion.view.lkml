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

  measure: count {
    type: count
  }

  parameter: filtro_indicador {
    label: "Elige indicador"
    type: string
    allowed_value: {
      label: "€ Tonelada de Reparto y Recogida"
      value: "1"
    }
    allowed_value: {
      label: "€ Expedición"
      value: "2"
    }
    allowed_value: {
      label: "% de Enrutamiento"
      value: "3"
    }
    allowed_value: {
      label: "% Lecturas (Descarga)"
      value: "4"
    }
    allowed_value: {
      label: "% Confirmación Entrega"
      value: "5"
    }
    allowed_value: {
      label: "% Plazo y Ventana Horaria"
      value: "6"
    }
    allowed_value: {
      label: "€ Tonelada Arrastre"
      value: "7"
    }
    allowed_value: {
      label: "Índice de Ocupación"
      value: "9"
    }
    allowed_value: {
      label: "% Lecturas (Carga)"
      value: "10"
    }
    allowed_value: {
      label: "% Pesaje y Volumetria"
      value: "12"
    }
    allowed_value: {
      label: "% Salida en hora LD"
      value: "13"
    }
    allowed_value: {
      label: "% Digitalización PODs"
      value: "15"
    }
    allowed_value: {
      label: "% Cierres de O.T."
      value: "17"
    }

  }
}
