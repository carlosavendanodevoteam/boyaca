view: derived_ind_5 {
  derived_table: {
    sql: SELECT
    ORTR_FECHA as FECHA_FILTRO,
    r.Region as REGION,
    CONCAT(DELE_LECT, " - " , r.Nombre," - ",r.Region) AS PLAZA,
    NUM_BULTOS,
    NUM_BULTOS_CONF,
    ORTR_FECHA, AGENCIA, PROVEEDOR, REPARTIDOR, TIPO_REP_REC, EXPE_CODIGO, EXPE_NUMERO, CLIENTE, NAF, REPREC_CONFIRMADOS, RECO_CODIGO

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

  dimension: bultos {
    type: string
    sql: ${TABLE}.NUM_BULTOS ;;
  }

  dimension: bultos_conf {
    type: string
    sql: ${TABLE}.NUM_BULTOS_CONF ;;
  }

  dimension: expe_codigo {
    type: number
    sql: ${TABLE}.EXPE_CODIGO ;;
  }

  dimension: expe_numero {
    type: string
    sql: ${TABLE}.EXPE_NUMERO ;;
  }

  dimension: fec_ortr {
    type:  string
    sql:  ${TABLE}.ORTR_FECHA;;
  }

  dimension: agencia {
    type:  string
    sql:  ${TABLE}.AGENCIA;;
  }

  dimension: proveedor {
    type:  string
    sql:  ${TABLE}.PROVEEDOR;;
  }

  dimension: repartidor {
    type:  string
    sql:  ${TABLE}.REPARTIDOR;;
  }

  dimension: tipo_rep_rec {
    type:  string
    sql:  ${TABLE}.TIPO_REP_REC;;
  }

  dimension: cliente {
    type:  string
    sql:  ${TABLE}.CLIENTE;;
  }

  dimension: naf {
    type:  string
    sql:  ${TABLE}.NAF;;
  }

  dimension: reprec_confirmados {
    type:  string
    sql:  ${TABLE}.REPREC_CONFIRMADOS;;
  }

  dimension: reco_codigo {
    type:  string
    sql:  ${TABLE}.RECO_CODIGO;;
  }

  measure: num_bultos {
    type: sum
    sql: ${bultos} ;;
  }

  measure: num_bultos_conf {
    type: sum
    sql: ${bultos_conf} ;;
  }

  measure: count {
    type: count
  }


}
