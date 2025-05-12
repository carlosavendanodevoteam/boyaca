
view: derived_ind_15 {
  derived_table: {
    sql: SELECT
    --p.EXPE_FECHA_SALIDA as FECHA_FILTRO,
    DATE(DATETIME(p.EXPE_FECHA_SALIDA, 'Europe/Madrid')) as FECHA_FILTRO,
    r.Region as REGION,
    CONCAT(p.DELE_CODIGO_DES, " - " , r.Nombre," - ",r.Region) AS PLAZA,
    NUM_IMG_PODS,
    EXPE_CODIGO,
    EXPE_NUMERO,
    EXPE_PESO_EXPEDICION,
    EXPE_NUM_BULTOS,
    DELE_NOMBRE_DES,
    DELE_NOMBRE_ORI
    FROM `datalake-transporte.alertran.t_expe_ale`  p
    INNER JOIN `datalake-transporte.alertran.t_regiones_agencias`  r
    ON p.DELE_CODIGO_DES = r.DELE_CODIGO
    WHERE p.Teex_codigo = 'EFEC'
      ;;
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

  dimension: expe_codigo {
    type: string
    sql: ${TABLE}.EXPE_CODIGO ;;
  }

  dimension: expe_numero {
    type: string
    sql: ${TABLE}.EXPE_NUMERO ;;
  }

  dimension: dele_nombre_des {
    type: string
    sql: ${TABLE}.DELE_NOMBRE_DES ;;
  }

  dimension: dele_nombre_ori {
    type: string
    sql: ${TABLE}.DELE_NOMBRE_ORI ;;
  }

  dimension: expe_num_bultos {
    type: string
    sql: ${TABLE}.EXPE_NUM_BULTOS ;;
  }

  dimension: expe_peso_expedicion {
    type: number
    sql: ${TABLE}.EXPE_PESO_EXPEDICION ;;
  }

  dimension: num_img_pods {
    type: number
    sql: ${TABLE}.NUM_IMG_PODS ;;
  }

  measure: expes_pod {
    type: sum
    sql:  CASE WHEN COALESCE(${num_img_pods},0) > 0 THEN 1 ELSE 0 END;;
  }

  measure: num_expe {
    type:  count_distinct
    sql: ${expe_codigo} ;;
  }


  measure: count {
    type: count
  }


}
