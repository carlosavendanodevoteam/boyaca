
view: derived_ind_12 {
  derived_table: {
    sql: SELECT
        p.FECHA_SALIDA as FECHA_FILTRO,
        r.Region as REGION,
        CONCAT(p.DELE_CODIGO_ORI, " - " , r.Nombre," - ",r.Region) AS PLAZA,
        BU_EXPE_KILOS_PESADOS,
        BU_EXPE_PESO_DECLARADO,
        EXPE_CODIGO,
        EXPE_NUMERO,
        EXPE_NUM_BULTOS
        FROM  `datalake-transporte.alertran.v_proy_kilo_expediciones`  p
        INNER JOIN `datalake-transporte.alertran.t_regiones_agencias`  r
        ON p.DELE_CODIGO_DES = r.DELE_CODIGO
        WHERE p.FECHA_SALIDA IS NOT NULL
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

  dimension: expe_codigo {
    type: number
    sql: ${TABLE}.EXPE_CODIGO ;;
  }

  dimension: expe_numero {
    type: string
    sql: ${TABLE}.EXPE_NUMERO ;;
  }

  dimension: bu_expe_kilos_pesados {
    type: number
    sql: ${TABLE}.BU_EXPE_KILOS_PESADOS ;;
  }

  dimension: bu_expe_peso_declarado {
    type: number
    sql: ${TABLE}.BU_EXPE_PESO_DECLARADO ;;
  }

  dimension: expe_num_bultos {
    type: number
    sql:  ${TABLE}.EXPE_NUM_BULTOS ;;
  }

  measure: count {
    type: count
  }


}
