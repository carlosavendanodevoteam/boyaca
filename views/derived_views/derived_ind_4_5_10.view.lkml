
view: derived_ind_4_5_7 {
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
          VIAJ_DES,
          VIAJ_ORI,
          VIAJ_CODIGO,
          PROPIA_COORD,
          ENCONTRADO,
          PROCESO


      FROM
          `datalake-transporte.alertran.v_calidad_lecturas` p
          INNER JOIN `datalake-transporte.alertran.t_regiones_agencias`  r  -- Si no esta en la tabla de regiones agencias no se muestra
          ON p.DELE_LEC = r.DELE_CODIGO
      --Para ind 4
      -- WHERE
      --     PROCESO='LLEGADA'

      -- Para ind 5
      --WHERE
      --  TIPO_REP_REC='REPARTO'
        --AND MUELLE = 'N'
        -- RECADERO = 'N'
        --AND PRODUCTO IN (Null, 'PR - PREFRENTE', 'GR - GRUPAJE', 'MA - MARITIMO', 'EX - EXCLUSIVO' )
        --AND NAF NOT IN ('EMG-EMP GRUPO') AND NAF IS NOT Null

    --Para ind 10
    --WHERE PROCESO='SALIDA'
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

  dimension: dele_lect {
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

  dimension: propia_coord {
    type: string
    sql: ${TABLE}.PROPIA_COORD ;;
  }

  dimension: encontrado {
    type: string
    sql: ${TABLE}.ENCONTRADO ;;
  }

  dimension: proceso {
    type: string
    sql: ${TABLE}.PROCESO ;;
  }

  dimension: dele_control {
    type: string
    sql: CASE WHEN ${proceso} = 'SALIDA' THEN CONCAT('DES:',${viaj_des}) ELSE CONCAT('ORI:' ,${viaj_ori}) END ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  measure: num_viajes {
    type:  count_distinct
    sql:  ${TABLE}.VIAJ_CODIGO;;
  }

  measure: num_bultos {
    type:  count_distinct
    sql:  ${TABLE}.BULT_CODIGO;;
  }

  measure: prop_leidos {
    type:  number
    sql:  COUNT(DISTINCT(IF(${propia_coord}='PROPIA' AND ${encontrado}='S', ${bult_codigo}, NULL)));;
  }

  measure: propios {
    type:  number
    sql:  COUNT(DISTINCT(IF(${propia_coord}='PROPIA', ${bult_codigo}, NULL)));;
  }

  measure: prop_no_leidos {
    type:  number
    sql:  ${propios} - ${prop_leidos};;
  }

  measure: coord_leidos {
    type:  number
    sql:  COUNT(DISTINCT(IF(${propia_coord}='COORDINACION' AND ${encontrado}='S', ${bult_codigo}, NULL)));;
  }

  measure: coordinacion {
    type:  number
    sql:  COUNT(DISTINCT(IF(${propia_coord}='COORDINACION', ${bult_codigo}, NULL)));;
  }

  measure: coord_no_leidos {
    type:  number
    sql:  ${coordinacion} - ${coord_leidos};;
  }

  measure: porc_bultos {
    type:  number
    sql:  (${prop_leidos} + ${coord_leidos})/(${propios} + ${coordinacion});;
  }

  measure: porc_prop {
    type:  number
    sql:  SAFE_DIVIDE(${prop_leidos},${propios});;
  }

  measure: porc_coord {
    type:  number
    sql:  SAFE_DIVIDE(${coord_leidos},${coordinacion});;
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
  dele_lect,
  viaj_ori,
  viaj_des,
  viaj_codigo
    ]
  }
}
