
view: derived_ind_7 {
  derived_table: {
    sql: SELECT
          CONCAT(p.DELE_ORIGEN, " - " , r.Nombre," - ",r.Region) AS PLAZA,
          FECHA_SALIDA                as FECHA_FILTRO,
          r.Region                    as REGION,
          VIAJ_IMPORTE,
          KILOS_VIAJE,
          DELE_CODIGO_DES,DELE_NOM_DES
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
