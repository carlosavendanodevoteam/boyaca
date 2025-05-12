include: "/views/base_views/mt_expe_calidad_entrega.view.lkml"
view: calidad {
  extends: [mt_expe_calidad_entrega]

  dimension: dele_codigo_pag {
    type: string
    label: "Agencia Pagadora"
    sql: ${TABLE}.dele_codigo_pag ;;
  }

  dimension: dele_codigo_des {
    type: string
    label: "Agencia Destino"
    sql: ${TABLE}.dele_codigo_des ;;
  }

  dimension: clie_cent_codigo_nom_ori {
    type: string
    label: "Cliente Origen"
    sql:  ${TABLE}.clie_cent_codigo_nom_ori ;;
  }

  dimension: tipa_descripcion {
    type: string
    label: "NAF"
    sql:  ${TABLE}.tipa_descripcion ;;
  }

  dimension: entrega_aplazada {
    type: string
    sql: IF(${expe_fecha_entrega_aplazada_date} IS NULL, 'No', 'Sí') ;;
  }

  dimension: cr_estado {
    type: string
    label: "Estado Exp"
    sql:  ${TABLE}.cr_estado ;;
  }

  dimension: prse_descripcion {
    type: string
    label: "Producto"
    sql:  ${TABLE}.prse_descripcion ;;
  }

  dimension: expedicion {
    type: string
    sql:  CONCAT((CAST(${expe_codigo} AS STRING), ${expe_numero}) ;;
  }

  dimension: ucar {
    type: number
    sql: ${TABLE}.expe_referencia_ucar ;;
  }

  dimension: consignatario {
    type: string
    sql:  ${TABLE}.expe_nombre_destino ;;
  }

  dimension: expe_otras_pdte {
    type: number
    sql: CASE
      WHEN ${expe_fecha_cierre_date} IS NULL
      AND ${expe_1_dia_retraso_c} = 0
      AND ${expe_mas_1_dia_retraso_c} = 0
      AND ${expe_fuera_de_hora_c} = 0
      AND ${expe_antes_fecha_objetivo_c} = 0
      AND ${expe_en_fecha_objetivo_c} = 0
      AND ${expe_pendiente} = 0
      AND ${expe_no_clasificable_c} = 0
      THEN 1
      ELSE 0
      END;;
  }



  measure: exp_totales {
    type: count_distinct
    sql: ${expe_codigo} ;;
  }

  measure: exp_no_clasif {
    type: count_distinct
    sql: IF(${expe_no_clasificable_c} = 1, ${expe_codigo}, NULL);;
  }

  measure: num_bultos {
    type: sum
    sql: ${cr_total_bultos} ;;
  }

  measure: PRKgs {
    type: sum
    sql: ${expe_peso_expedicion} ;;
  }

  measure: antes {
    type: count_distinct
    sql: IF(${expe_antes_fecha_objetivo_c} = 1, ${expe_numero}, NULL);;
  }

  measure: porc_antes {
    type: number
    label: "% Antes"
    sql: (COUNT(DISTINCT(IF(${expe_antes_fecha_objetivo_c} = 1, ${expe_numero}, NULL)))/COUNT(DISTINCT(${expe_numero}))) * 100;;
    value_format: "0.00%"
  }

  measure: obj {
    type: count_distinct
    sql: IF(${expe_en_fecha_objetivo_c} = 1, ${expe_numero}, NULL);;
  }

  measure: porc_obj {
    type: number
    label: "% Obj"
    sql: (COUNT(DISTINCT(IF(${expe_en_fecha_objetivo_c} = 1, ${expe_numero}, NULL)))/COUNT(DISTINCT(${expe_numero}))) * 100;;
    value_format: "0.00%"
  }

  measure: acum_obj {
    type: count_distinct
    sql: IF(${expe_antes_fecha_objetivo_c} = 1 OR ${expe_en_fecha_objetivo_c} = 1, ${expe_numero}, NULL);;
  }

  measure: porc_acum_obj {
    type: number
    label: "% Acum Obj"
    sql: (COUNT(DISTINCT(IF(${expe_antes_fecha_objetivo_c} = 1 OR ${expe_en_fecha_objetivo_c} = 1, ${expe_numero}, NULL)))/COUNT(DISTINCT(${expe_numero}))) * 100;;
    value_format: "0.00%"
  }

  measure: delay {
    type: count_distinct
    sql: IF(${expe_fuera_de_hora_c} = 1, ${expe_numero}, NULL);;
  }

  measure: porc_delay {
    type: number
    label: "% Delay"
    sql: (COUNT(DISTINCT(IF(${expe_fuera_de_hora_c} = 1, ${expe_numero}, NULL)))/COUNT(DISTINCT(${expe_numero}))) * 100;;
    value_format: "0.00%"
  }

  measure: porc_acum_f_obj {
    type:  number
    label: "% Acum F Obj"
    sql: (COUNT(DISTINCT(IF(${expe_antes_fecha_objetivo_c} = 1 OR ${expe_fuera_de_hora_c} = 1 OR ${expe_en_fecha_objetivo_c} = 1, ${expe_numero}, NULL)))/COUNT(DISTINCT(${expe_numero}))) * 100;;
  }

  measure: porc_acum_no_f_obj {
    type:  number
    label: "% Acum No F Obj"
    sql: (COUNT(DISTINCT(IF(${expe_1_dia_retraso_c} = 1 OR ${expe_mas_1_dia_retraso_c} = 1, ${expe_numero}, NULL)))/COUNT(DISTINCT(${expe_numero}))) * 100;;
  }

  measure: t_mas_1 {
    type: count_distinct
    label: "T + 1"
    sql:  IF(${expe_1_dia_retraso_c} = 1, ${expe_numero}, NULL);;
  }

  measure: porc_t_mas_1 {
    type: number
    label: "% T + 1"
    sql: (COUNT(DISTINCT(IF(${expe_1_dia_retraso_c} = 1, ${expe_numero}, NULL)))/COUNT(DISTINCT(${expe_numero}))) * 100;;
    value_format: "0.00%"
  }

  measure: mayor_t_mas_1 {
    type: count_distinct
    label: "> T + 1"
    sql:  IF(${expe_mas_1_dia_retraso_c} = 1, ${expe_numero}, NULL);;
  }

  measure: porc_mayor_t_mas_1 {
    type: number
    label: "% > T + 1"
    sql: (COUNT(DISTINCT(IF(${expe_mas_1_dia_retraso_c} = 1, ${expe_numero}, NULL)))/COUNT(DISTINCT(${expe_numero}))) * 100;;
    value_format: "0.00%"
  }

  measure: pendiente {
    type: count_distinct
    sql:  IF(${expe_pendiente} = 1, ${expe_numero}, NULL);;
  }

  measure: porc_pendiente {
    type: number
    label: "% Pendiente"
    sql: (COUNT(DISTINCT(IF(${expe_pendiente} = 1, ${expe_numero}, NULL)))/COUNT(DISTINCT(${expe_numero}))) * 100;;
    value_format: "0.00%"
  }

  measure: otras_pendiente {
    type: count_distinct
    sql:  IF(${expe_otras_pdte} = 1, ${expe_numero}, NULL);;
  }

  measure: porc_otras_pendiente {
    type: number
    label: "% Pendiente"
    sql: (COUNT(DISTINCT(IF(${expe_otras_pdte} = 1, ${expe_numero}, NULL)))/COUNT(DISTINCT(${expe_numero}))) * 100;;
    value_format: "0.00%"
  }

  measure: count {
    type: count
  }

}
