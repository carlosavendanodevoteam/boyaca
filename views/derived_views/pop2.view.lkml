view: pop2 {
  sql_table_name: `datalake-transporte.TEST.test_mt_indicadores_medicion` ;;

  dimension: ambito {
    type: string
    sql: ${TABLE}.AMBITO ;;
  }

  dimension_group: fecha_filtro {
    type: time
    timeframes: [time, date, week, month, year,day_of_week, day_of_month, day_of_year, day_of_week_index, month_name, month_num,raw]
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

  parameter: comparison_periods {
    view_label: "_PoP_2"
    label: "3. Number of Periods"
    type: unquoted
    default_value: "2"
    allowed_value: {label: "2" value: "2"}
    allowed_value: {label: "3" value: "3"}
    allowed_value: {label: "4" value: "4"}
  }

  parameter: compare_to {
    view_label: "_PoP_2"
    label: "4. Compare To"
    type: unquoted
    default_value: "Period"
    allowed_value: {label: "Previous Period" value: "Period"}
    allowed_value: {label: "Previous Week" value: "Week"}
    allowed_value: {label: "Previous Month" value: "Month"}
    allowed_value: {label: "Previous Quarter" value: "Quarter"}
    allowed_value: {label: "Previous Year" value: "Year"}
  }

  filter: current_date_range {
    type: date
    view_label: "_PoP_2"
    label: "1. Current Date Range"
    sql: ${period} IS NOT NULL ;;
  }

  dimension: days_in_period {
    hidden: yes
    view_label: "_PoP_2"
    description: "Gives the number of days in the current period date range"
    type: number
    sql: DATE_DIFF(DATE({% date_end current_date_range %}), DATE({% date_start current_date_range %}), DAY) ;;
  }

  dimension: period_2_start {
    hidden: yes
    view_label: "_PoP_2"
    description: "Calculates the start of the previous period"
    type: date
    sql:
        {% if compare_to._parameter_value == "Period" %}
        DATE_ADD(DATE({% date_start current_date_range %}), INTERVAL -${days_in_period} DAY)
        {% else %}
        DATE_ADD(DATE({% date_start current_date_range %}), INTERVAL -1 {% parameter compare_to %})
        {% endif %};;
  }

  dimension: period_2_end {
    hidden: yes
    view_label: "_PoP_2"
    description: "Calculates the end of the previous period"
    type: date
    sql:
        {% if compare_to._parameter_value == "Period" %}
        DATE_ADD(DATE({% date_start current_date_range %}), INTERVAL -1 DAY)
        {% else %}
        DATE_ADD(DATE_ADD(DATE({% date_end current_date_range %}), INTERVAL -1 DAY), INTERVAL -1 {% parameter compare_to %})
        {% endif %};;
  }

  dimension: period_3_start {
    view_label: "_PoP_2"
    description: "Calculates the start of 2 periods ago"
    type: date
    sql:
        {% if compare_to._parameter_value == "Period" %}
        DATE_ADD(DATE({% date_start current_date_range %}), INTERVAL -(2 * ${days_in_period}) DAY)
        {% else %}
        DATE_ADD(DATE({% date_start current_date_range %}), INTERVAL -2 {% parameter compare_to %})
        {% endif %};;
    hidden: yes
  }

  dimension: period_3_end {
    view_label: "_PoP_2"
    description: "Calculates the end of 2 periods ago"
    type: date
    sql:
        {% if compare_to._parameter_value == "Period" %}
        DATE_ADD(${period_2_start}, INTERVAL -1 DAY)
        {% else %}
        DATE_ADD(DATE_ADD(DATE({% date_end current_date_range %}), INTERVAL -1 DAY), INTERVAL -2 {% parameter compare_to %})
        {% endif %};;
    hidden: yes
  }

  dimension: period_4_start {
    view_label: "_PoP_2"
    description: "Calculates the start of 4 periods ago"
    type: date
    sql:
        {% if compare_to._parameter_value == "Period" %}
        DATE_ADD(DATE({% date_start current_date_range %}), INTERVAL -(3 * ${days_in_period}) DAY)
        {% else %}
        DATE_ADD(DATE({% date_start current_date_range %}), INTERVAL -3 {% parameter compare_to %})
        {% endif %};;
    hidden: yes
  }

  dimension: period_4_end {
    view_label: "_PoP_2"
    description: "Calculates the end of 4 periods ago"
    type: date
    sql:
        {% if compare_to._parameter_value == "Period" %}
        DATE_ADD(${period_2_start}, INTERVAL -1 DAY)
        {% else %}
        DATE_ADD(DATE_ADD(DATE({% date_end current_date_range %}), INTERVAL -1 DAY), INTERVAL -3 {% parameter compare_to %})
        {% endif %};;
    hidden: yes
  }

  dimension_group: date_in_period {
    description: "Use this as your grouping dimension when comparing periods. Aligns the previous periods onto the current period"
    label: "Current Period"
    type: time
    sql: DATE_ADD(DATE({% date_start current_date_range %}), INTERVAL ${day_in_period} - 1 DAY);;
    view_label: "_PoP_2"
    timeframes: [
      date,
      hour_of_day,
      day_of_week,
      day_of_week_index,
      day_of_month,
      day_of_year,
      week_of_year,
      month,
      month_name,
      month_num,
      year]
  }


  dimension: period {
    view_label: "_PoP_2"
    label: "Period"
    description: "Pivot me! Returns the period the metric covers, i.e. either the 'This Period', 'Previous Period' or '3 Periods Ago'"
    type: string
    order_by_field: order_for_period
    sql:
    {% if current_date_range._is_filtered %}
      CASE
        WHEN {% condition current_date_range %} ${fecha_filtro_raw} {% endcondition %}
        THEN 'This {% parameter compare_to %}'
        WHEN DATE(${fecha_filtro_date}) BETWEEN DATE(${period_2_start}) AND DATE(${period_2_end})
        THEN 'Last {% parameter compare_to %}'
        WHEN DATE(${fecha_filtro_date}) BETWEEN DATE(${period_3_start}) AND DATE(${period_3_end})
        THEN '2 {% parameter compare_to %}s Ago'
        WHEN DATE(${fecha_filtro_date}) BETWEEN DATE(${period_4_start}) AND DATE(${period_4_end})
        THEN '3 {% parameter compare_to %}s Ago'
      END
    {% else %}
      NULL
    {% endif %}
  ;;
  }

  dimension: order_for_period {
    hidden: yes
    view_label: "Comparison Fields"
    label: "Period"
    type: string
    sql:
    {% if current_date_range._is_filtered %}
      CASE
        WHEN {% condition current_date_range %} ${fecha_filtro_raw} {% endcondition %}
        THEN 1
        WHEN DATE(${fecha_filtro_date}) BETWEEN DATE(${period_2_start}) AND DATE(${period_2_end})
        THEN 2
        WHEN DATE(${fecha_filtro_date}) BETWEEN DATE(${period_3_start}) AND DATE(${period_3_end})
        THEN 3
        WHEN DATE(${fecha_filtro_date}) BETWEEN DATE(${period_4_start}) AND DATE(${period_4_end})
        THEN 4
      END
    {% else %}
      NULL
    {% endif %}
  ;;
  }

  dimension: day_in_period {
    description: "Gives the number of days since the start of each period. Use this to align the event dates onto the same axis, the axes will read 1,2,3, etc."
    type: number
    sql:
    {% if current_date_range._is_filtered %}
      CASE
        WHEN {% condition current_date_range %} ${fecha_filtro_raw} {% endcondition %}
        THEN DATE_DIFF(DATE(${fecha_filtro_date}), DATE({% date_start current_date_range %}), DAY) + 1
        WHEN DATE(${fecha_filtro_date}) BETWEEN DATE(${period_2_start}) AND DATE(${period_2_end})
        THEN DATE_DIFF(DATE(${fecha_filtro_date}), DATE(${period_2_start}), DAY) + 1
        WHEN DATE(${fecha_filtro_date}) BETWEEN DATE(${period_3_start}) AND DATE(${period_3_end})
        THEN DATE_DIFF(DATE(${fecha_filtro_date}), DATE(${period_3_start}), DAY) + 1
        WHEN DATE(${fecha_filtro_date}) BETWEEN DATE(${period_4_start}) AND DATE(${period_4_end})
        THEN DATE_DIFF(DATE(${fecha_filtro_date}), DATE(${period_4_start}), DAY) + 1
      END
    {% else %}
      NULL
    {% endif %}
  ;;
    hidden: yes
  }
}
