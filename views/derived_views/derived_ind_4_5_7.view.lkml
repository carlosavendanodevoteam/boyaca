
view: derived_ind_4_5_7 {
  derived_table: {
    sql: SELECT
          p.VIAJ_FECHA_SALIDA as FECHA_FILTRO,
          r.Region as REGION,
          CONCAT(p.DELE_LEC, " - " , r.Nombre," - ",r.Region) AS PLAZA,
          p.BULT_CODIGO,
          IF(p.ENCONTRADO='S', p.BULT_CODIGO, NULL) as BULT_CODIGO_leido,
          EXPE_CODIGO, EXPE_NUMERO

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
    ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
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

  set: detail {
    fields: [
        fecha_filtro,
  region,
  plaza,
  bult_codigo,
  bult_codigo_leido,
  expe_codigo,
  expe_numero
    ]
  }
}
