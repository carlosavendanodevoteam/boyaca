
view: derived_ind_9 {
  derived_table: {
    sql: SELECT
          p.FECHA_SALIDA  as FECHA_FILTRO,
          r.Region as REGION,
          CONCAT(p.DELE_CODIGO_ORI, " - " , r.Nombre," - ",r.Region) AS PLAZA,
          -- Si el viaje es Ficticio no se contabiliza el viaje en si pero si sus kilos
          p.KILOS_VIAJE,
          CASE WHEN (p.CAMI_MATRICULA NOT IN ('9999TBO') ) THEN
              p.VIAJ_CODIGO
          ELSE
              NULL
          END
          as VIAJ_CODIGO,
           VIAJ_IMPORTE,
          DELE_CODIGO_DES,DELE_NOM_DES,
          DELE_CODIGO_ORI, DELE_NOM_ORI, Paradas, CAMI_MATRICULA, REMO_MATRICULA, PRVE_CODIGO_CONDUCTOR, PROVEEDOR_VIAJE, VIAJ_IMPORTE_MANUAL, IMPORTE_PLAN_TRANSPORTE, BULTOS_VIAJE, RUTA_KILOMETROS


      FROM
          `datalake-transporte.alertran.v_viajes_report_diario` p
          INNER JOIN `datalake-transporte.alertran.t_regiones_agencias`  r  -- Si no esta en la tabla de regiones agencias no se muestra
          ON p.DELE_CODIGO_ORI = r.DELE_CODIGO ;;
  }

  measure: count {
    type: count
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

  dimension: plaza {
    type: string
    sql: ${TABLE}.PLAZA ;;
  }

  dimension: kilos_viaje {
    type: number
    sql: ${TABLE}.KILOS_VIAJE ;;
  }

  dimension: viaj_codigo {
    type: number
    sql: ${TABLE}.VIAJ_CODIGO ;;
  }

  dimension: dele_codigo_des {
    type: string
    sql: ${TABLE}.DELE_CODIGO_DES ;;
  }

  dimension: dele_nom_des {
    type: string
    sql: ${TABLE}.DELE_NOM_DES ;;
  }

  dimension: viaj_importe {
    type: number
    sql: ${TABLE}.VIAJ_IMPORTE ;;
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


}
