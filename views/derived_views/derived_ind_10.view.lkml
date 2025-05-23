
view: derived_ind_10 {
  derived_table: {
    sql: SELECT
          p.VIAJ_FECHA_SALIDA as FECHA_FILTRO,
          r.Region as REGION,
          CONCAT(p.DELE_LEC, " - " , r.Nombre," - ",r.Region) AS PLAZA,
          p.BULT_CODIGO,
          IF(p.ENCONTRADO='S', p.BULT_CODIGO, NULL) as BULT_CODIGO_leido,
          EXPE_CODIGO,
          EXPE_NUMERO,
          DELE_LECT,
          VIAJ_CODIGO,
          VIAJ_ORI,
          VIAJ_DES,
          CLIENTE,
          PROCESO,
          ENCONTRADO


      FROM
      `datalake-transporte.alertran.v_calidad_lecturas` p
      INNER JOIN `datalake-transporte.alertran.t_regiones_agencias`  r  -- Si no esta en la tabla de regiones agencias no se muestra
      ON p.DELE_LEC = r.DELE_CODIGO
      WHERE PROCESO='SALIDA'
      ;;
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

  dimension: bult_codigo {
    type: string
    sql: ${TABLE}.BULT_CODIGO ;;
  }

  dimension: bult_codigo_leido {
    type: string
    sql: ${TABLE}.BULT_CODIGO_leido ;;
  }

  dimension: expe_codigo {
    type: number
    sql: ${TABLE}.EXPE_CODIGO ;;
  }

  dimension: expe_numero {
    type: string
    sql: ${TABLE}.EXPE_NUMERO ;;
  }

  dimension: agencia {
    type: string
    sql: ${TABLE}.DELE_LECT ;;
  }

  dimension: viaj_des {
    type: string
    sql: ${TABLE}.VIAJ_DES ;;
  }

  dimension: viaj_ori {
    type: string
    sql: ${TABLE}.VIAJ_ORI ;;
  }

  dimension: viaj_codigo {
    type: string
    sql: ${TABLE}.VIAJ_CODIGO ;;
  }

  dimension: proceso {
    type: string
    sql: ${TABLE}.PROCESO ;;
  }

  dimension: cliente {
    type: string
    sql: ${TABLE}.CLIENTE ;;
  }

  dimension: ruta {
    type:  string
    sql:  CONCAT(${viaj_ori}, ' - ', ${viaj_des});;
  }

  dimension: encontrado {
    type:  string
    sql:  ${TABLE}.ENCONTRADO;;
  }


  measure: count {
    type: count
  }

  measure: num_bultos {
    type:  count_distinct
    sql:  ${TABLE}.BULT_CODIGO;;
  }

  measure: leidos {
    type:  count_distinct
    sql:  CASE WHEN ${encontrado} = 'S' THEN ${bult_codigo} ELSE NULL END;;
  }

  measure: no_leidos {
    type:  count_distinct
    sql:  CASE WHEN ${encontrado} = 'N' THEN ${bult_codigo} ELSE NULL END;;
  }

}
