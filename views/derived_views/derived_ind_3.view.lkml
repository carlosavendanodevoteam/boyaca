
view: derived_ind_3 {
  derived_table: {
    sql: SELECT
    p.ORTR_FECHA as FECHA_FILTRO,
    p.EXPE_CODIGO,
    p.EXPE_NUMERO,
    r.Region as REGION,
    CONCAT(p.DELE_CODIGO, " - " , r.Nombre," - ",r.Region) AS PLAZA,
    p.COSTE_ENRUTADO, p.num_expe_por_ortr, p.EXPE_PESO_OCUPACION, p.COSTE_EXPEDICION, p.COSTE_SARR_EXPEDICION
FROM
    `datalake-transporte.alertran.mt_expe_productividad_choferes`  p
    INNER JOIN `datalake-transporte.alertran.t_regiones_agencias`  r
      ON p.DELE_CODIGO = r.DELE_CODIGO;;
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

  dimension: expe_codigo {
    type: string
    sql: ${TABLE}.EXPE_CODIGO ;;
  }

  dimension: expe_numero {
    type: string
    sql: ${TABLE}.EXPE_NUMERO ;;
  }

  dimension: coste_expedicion {
    type: number
    sql: ${TABLE}.COSTE_EXPEDICION ;;
  }

  dimension: coste_sarr_expedicion {
    type: number
    sql: ${TABLE}.COSTE_SARR_EXPEDICION ;;
  }

  dimension: expe_peso_ocupacion {
    type: number
    sql: ${TABLE}.EXPE_PESO_OCUPACION ;;
  }

  dimension: coste_enrutado {
    type: number
    sql: ${TABLE}.COSTE_ENRUTADO ;;
  }

  dimension: num_expe_por_ortr {
    type: number
    sql: ${TABLE}.num_expe_por_ortr ;;
  }

}
