
view: derived_ind_7 {
  derived_table: {
    sql: SELECT
          CONCAT(p.DELE_ORIGEN, " - " , r.Nombre," - ",r.Region) AS PLAZA,
          FECHA_SALIDA                as FECHA_FILTRO,
          r.Region                    as REGION,
          VIAJ_IMPORTE,
          DELE_CODIGO_DES,DELE_NOM_DES,
          DELE_CODIGO_ORI, DELE_NOM_ORI, Paradas, VIAJ_CODIGO, FECHA_SALIDA, CAMI_MATRICULA, REMO_MATRICULA, PRVE_CODIGO_CONDUCTOR, PROVEEDOR_VIAJE, VIAJ_IMPORTE_MANUAL, IMPORTE_PLAN_TRANSPORTE, BULTOS_VIAJE, KILOS_VIAJE, RUTA_KILOMETROS
      FROM
          `datalake-transporte.alertran.v_viajes_report_diario`   p
          INNER JOIN `datalake-transporte.alertran.t_regiones_agencias`  r  -- Si no esta en la tabla de regiones agencias no se muestra
          ON p.DELE_ORIGEN = r.DELE_CODIGO
      WHERE
          FECHA_SALIDA >= '2025-01-01' ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: plaza {
    type: string
    sql: ${TABLE}.PLAZA ;;
  }

  dimension: fecha_filtro {
    type: date
    datatype: date
    sql: ${TABLE}.FECHA_FILTRO ;;
  }

  dimension: region {
    type: string
    sql: ${TABLE}.REGION ;;
  }

  dimension: viaj_importe {
    type: number
    sql: ${TABLE}.VIAJ_IMPORTE ;;
  }

  dimension: kilos_viaje {
    type: number
    sql: ${TABLE}.KILOS_VIAJE ;;
  }

  dimension: dele_codigo_des {
    type: string
    sql: ${TABLE}.DELE_CODIGO_DES ;;
  }

  dimension: dele_nom_des {
    type: string
    sql: ${TABLE}.DELE_NOM_DES ;;
  }

  dimension: dele_codigo_ori {
    type: string
    sql: ${TABLE}.DELE_CODIGO_ORI ;;
  }

  dimension: dele_nom_ori {
    type: string
    sql: ${TABLE}.DELE_NOM_ORI ;;
  }

  dimension: paradas {
    type: string
    sql: ${TABLE}.Paradas ;;
  }

  dimension: viaj_codigo {
    type: string
    sql: ${TABLE}.VIAJ_CODIGO ;;
  }

  dimension: cami_matricula {
    type: string
    sql: ${TABLE}.CAMI_MATRICULA ;;
  }

  dimension: remo_matricula {
    type: string
    sql: ${TABLE}.REMO_MATRICULA ;;
  }

  dimension: prve_codigo_conductor {
    type: string
    sql: ${TABLE}.PRVE_CODIGO_CONDUCTOR ;;
  }

  dimension: proovedor_viaje {
    type: string
    sql: ${TABLE}.PROVEEDOR_VIAJE ;;
  }

  dimension: viaj_importe_manual {
    type: string
    sql: ${TABLE}.VIAJ_IMPORTE_MANUAL ;;
  }

  dimension: importe_plan_transporte {
    type: string
    sql: ${TABLE}.IMPORTE_PLAN_TRANSPORTE ;;
  }

  dimension: bultos_viaje {
    type: string
    sql: ${TABLE}.BULTOS_VIAJE ;;
  }

  dimension: ruta_kilometros {
    type: string
    sql: ${TABLE}.RUTA_KILOMETROS ;;
  }

  measure: sum_importe {
    type: sum
    sql: ${TABLE}.VIAJ_IMPORTE ;;
  }

  measure: sum_importe_manual {
    type: sum
    sql: ${TABLE}.VIAJ_IMPORTE_MANUAL ;;
  }

  measure: sum_importe_plan_transporte {
    type: sum
    sql: ${TABLE}.IMPORTE_PLAN_TRANSPORTE;;
  }

  measure: sum_bultos {
    type: sum
    sql: ${TABLE}.BULTOS_VIAJE;;
  }

  measure: sum_kilos {
    type: sum
    sql: ${TABLE}.KILOS_VIAJE;;
  }

  measure: sum_km {
    type: sum
    sql: ${TABLE}.RUTA_KILOMETROS;;
  }

  set: detail {
    fields: [
        plaza,
  fecha_filtro,
  region,
  viaj_importe,
  kilos_viaje,
  dele_codigo_des,
  dele_nom_des
    ]
  }
}
