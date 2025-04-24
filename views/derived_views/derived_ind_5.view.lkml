view: derived_ind_5 {
  derived_table: {
    sql: SELECT
    ORTR_FECHA as FECHA_FILTRO,
    r.Region as REGION,
    CONCAT(DELE_LECT, " - " , r.Nombre," - ",r.Region) AS PLAZA,
    NUM_BULTOS,
    NUM_BULTOS_CONF

FROM
    `datalake-transporte.alertran.v_repartidores_lecturas`  p
    INNER JOIN `datalake-transporte.alertran.t_regiones_agencias`  r  -- Si no esta en la tabla de regiones agencias no se muestra
    ON p.DELE_LECT = r.DELE_CODIGO

WHERE
        TIPO_REP_REC='REPARTO'
    AND MUELLE = 'N'
    AND RECADERO = 'N'
    AND PRODUCTO IN (Null, 'PR - PREFRENTE', 'GR - GRUPAJE', 'MA - MARITIMO', 'EX - EXCLUSIVO' )
    AND NAF NOT IN ('EMG-EMP GRUPO') AND NAF IS NOT Null
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
    drill_fields: [detail*]
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


  set: detail {
    fields: [
      fecha_filtro,
      region,
      plaza,
      bult_codigo,
      bult_codigo_leido,
      expe_codigo,
      expe_numero,
      agencia,
      viaj_ori,
      viaj_des,
      viaj_codigo,
      cliente,
      proceso,
      ruta,
      encontrado
    ]
  }
}
