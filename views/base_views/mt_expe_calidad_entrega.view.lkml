view: mt_expe_calidad_entrega {
  sql_table_name: `alertran.mt_expe_calidad_entrega` ;;

  dimension: cent_codigo_ori {
    type: string
     sql: ${TABLE}.Cent_codigo_ori ;;
  }
  dimension: clie_cent_codigo_nom_ori {
    type: string
     sql: ${TABLE}.Clie_cent_codigo_nom_ori ;;
  }
  dimension: clie_codigo_des {
    type: string
     sql: ${TABLE}.CLIE_CODIGO_DES ;;
  }
  dimension: clie_codigo_des_nom {
    type: string
     sql: ${TABLE}.CLIE_CODIGO_DES_NOM ;;
  }
  dimension: clie_codigo_ori {
    type: string
     sql: ${TABLE}.Clie_codigo_ori ;;
  }
  dimension: clie_codigo_ori_nom {
    type: string
     sql: ${TABLE}.CLIE_CODIGO_ORI_NOM ;;
  }
  dimension: codp_codigo_des {
    type: string
     sql: ${TABLE}.CODP_CODIGO_DES ;;
  }
  dimension: cr_bultos_en_reparto {
    type: number
     sql: ${TABLE}.CR_BULTOS_EN_REPARTO ;;
  }
  dimension: cr_bultos_entregados {
    type: number
     sql: ${TABLE}.CR_BULTOS_ENTREGADOS ;;
  }
  dimension: cr_bultos_pendientes {
    type: number
     sql: ${TABLE}.CR_BULTOS_PENDIENTES ;;
  }
  dimension: cr_estado {
    type: string
     sql: ${TABLE}.CR_ESTADO ;;
  }
  dimension_group: cr_fecha_en_reparto {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    datatype: datetime
     sql: ${TABLE}.CR_FECHA_EN_REPARTO ;;
  }
  dimension_group: cr_fecha_estado {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    datatype: datetime
     sql: ${TABLE}.CR_FECHA_ESTADO ;;
  }
  dimension_group: cr_fecha_ultima_entrega {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    datatype: datetime
     sql: ${TABLE}.CR_FECHA_ULTIMA_ENTREGA ;;
  }
  dimension: cr_total_bultos {
    type: number
     sql: ${TABLE}.CR_TOTAL_BULTOS ;;
  }
  dimension: dele_codigo_des {
    type: string
     sql: ${TABLE}.Dele_codigo_des ;;
  }
  dimension: dele_codigo_ori {
    type: string
     sql: ${TABLE}.Dele_codigo_ori ;;
  }
  dimension: dele_codigo_pag {
    type: string
     sql: ${TABLE}.Dele_codigo_pag ;;
  }
  dimension: dele_codigo_rep {
    type: string
     sql: ${TABLE}.Dele_codigo_rep ;;
  }
  dimension: dele_nombre_des {
    type: string
     sql: ${TABLE}.Dele_nombre_des ;;
  }
  dimension: dele_nombre_pag {
    type: string
     sql: ${TABLE}.Dele_nombre_pag ;;
  }
  dimension: estado_bulto {
    type: string
     sql: ${TABLE}.Estado_bulto ;;
  }
  dimension: exfe_dias_c {
    type: number
     sql: ${TABLE}.EXFE_DIAS_C ;;
  }
  dimension: exfe_dias_l {
    type: number
     sql: ${TABLE}.EXFE_DIAS_L ;;
  }
  dimension_group: exfe_fecha_c {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    datatype: datetime
     sql: ${TABLE}.EXFE_FECHA_C ;;
  }
  dimension_group: exfe_fecha_l {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    datatype: datetime
     sql: ${TABLE}.EXFE_FECHA_L ;;
  }
  dimension: expe_1_dia_retraso_c {
    type: number
     sql: ${TABLE}.expe_1_dia_retraso_c ;;
  }
  dimension: expe_1_dia_retraso_l {
    type: number
     sql: ${TABLE}.expe_1_dia_retraso_l ;;
  }
  dimension: expe_antes_fecha_objetivo_c {
    type: number
     sql: ${TABLE}.expe_antes_fecha_objetivo_c ;;
  }
  dimension: expe_antes_fecha_objetivo_l {
    type: number
     sql: ${TABLE}.expe_antes_fecha_objetivo_l ;;
  }
  dimension: expe_codigo {
    type: number
     sql: ${TABLE}.Expe_codigo ;;
  }
  dimension: expe_en_fecha_objetivo_c {
    type: number
     sql: ${TABLE}.expe_en_fecha_objetivo_c ;;
  }
  dimension: expe_en_fecha_objetivo_l {
    type: number
     sql: ${TABLE}.expe_en_fecha_objetivo_l ;;
  }
  dimension: expe_en_periodo_c {
    type: number
     sql: ${TABLE}.expe_en_periodo_c ;;
  }
  dimension: expe_en_periodo_l {
    type: number
     sql: ${TABLE}.expe_en_periodo_l ;;
  }
  dimension_group: expe_fecha_baja {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
     sql: ${TABLE}.EXPE_FECHA_BAJA ;;
  }
  dimension_group: expe_fecha_cierre {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    datatype: datetime
     sql: ${TABLE}.Expe_fecha_cierre ;;
  }
  dimension_group: expe_fecha_entrega_aplazada {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    datatype: datetime
     sql: ${TABLE}.EXPE_FECHA_ENTREGA_APLAZADA ;;
  }
  dimension_group: expe_fecha_objetivo {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    datatype: datetime
     sql: ${TABLE}.Expe_fecha_objetivo ;;
  }
  dimension: expe_fuera_de_hora_c {
    type: number
     sql: ${TABLE}.expe_fuera_de_hora_c ;;
  }
  dimension: expe_fuera_de_hora_l {
    type: number
     sql: ${TABLE}.expe_fuera_de_hora_l ;;
  }
  dimension: expe_mas_1_dia_retraso_c {
    type: number
     sql: ${TABLE}.expe_mas_1_dia_retraso_c ;;
  }
  dimension: expe_mas_1_dia_retraso_l {
    type: number
     sql: ${TABLE}.expe_mas_1_dia_retraso_l ;;
  }
  dimension: expe_no_clasificable_c {
    type: number
     sql: ${TABLE}.expe_no_clasificable_c ;;
  }
  dimension: expe_no_clasificable_l {
    type: number
     sql: ${TABLE}.expe_no_clasificable_l ;;
  }
  dimension: expe_nombre_destino {
    type: string
     sql: ${TABLE}.EXPE_NOMBRE_DESTINO ;;
  }
  dimension: expe_num_bultos {
    type: number
     sql: ${TABLE}.EXPE_NUM_BULTOS ;;
  }
  dimension: expe_numero {
    type: string
     sql: ${TABLE}.Expe_numero ;;
  }
  dimension: expe_pendiente {
    type: number
     sql: ${TABLE}.expe_pendiente ;;
  }
  dimension: expe_peso_expedicion {
    type: number
     sql: ${TABLE}.Expe_peso_expedicion ;;
  }
  dimension: expe_peso_ocupacion {
    type: number
     sql: ${TABLE}.EXPE_PESO_OCUPACION ;;
  }
  dimension: expe_poblacion_destino {
    type: string
     sql: ${TABLE}.EXPE_POBLACION_DESTINO ;;
  }
  dimension: expe_ref_alb_cliente {
    type: string
     sql: ${TABLE}.EXPE_REF_ALB_CLIENTE ;;
  }
  dimension: expe_referencia_cliente {
    type: string
     sql: ${TABLE}.EXPE_REFERENCIA_CLIENTE ;;
  }
  dimension: expe_referencia_ucar {
    type: number
     sql: ${TABLE}.EXPE_REFERENCIA_UCAR ;;
  }
  dimension: expe_sin_exfe_fecha_c {
    type: number
     sql: ${TABLE}.expe_sin_exfe_fecha_c ;;
  }
  dimension: expe_sin_exfe_fecha_l {
    type: number
     sql: ${TABLE}.expe_sin_exfe_fecha_l ;;
  }
  dimension: expe_sin_fecha_objetivo {
    type: number
     sql: ${TABLE}.expe_sin_fecha_objetivo ;;
  }
  dimension_group: fecha_alta {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
     sql: ${TABLE}.FECHA_ALTA ;;
  }
  dimension_group: fecha_filtro {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
     sql: ${TABLE}.FECHA_FILTRO ;;
  }
  dimension_group: fecha_llegada {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
     sql: ${TABLE}.FECHA_LLEGADA ;;
  }
  dimension_group: fecha_recogida {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    datatype: datetime
     sql: ${TABLE}.FECHA_RECOGIDA ;;
  }
  dimension_group: fecha_ultima_carga {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    datatype: datetime
     sql: ${TABLE}.FECHA_ULTIMA_CARGA ;;
  }
  dimension: inci_codigo {
    type: number
     sql: ${TABLE}.INCI_CODIGO ;;
  }
  dimension: inci_desc {
    type: string
     sql: ${TABLE}.INCI_DESC ;;
  }
  dimension: inci_tipo {
    type: string
     sql: ${TABLE}.INCI_TIPO ;;
  }
  dimension: prse_codigo {
    type: string
     sql: ${TABLE}.Prse_codigo ;;
  }
  dimension: prse_descripcion {
    type: string
     sql: ${TABLE}.PRSE_DESCRIPCION ;;
  }
  dimension: region {
    type: string
     sql: ${TABLE}.REGION ;;
  }
  dimension: teex_codigo {
    type: string
     sql: ${TABLE}.Teex_codigo ;;
  }
  dimension: teex_descripcion {
    type: string
     sql: ${TABLE}.TEEX_DESCRIPCION ;;
  }
  dimension: tipa_codigo {
    type: string
     sql: ${TABLE}.TIPA_CODIGO ;;
  }
  dimension: tipa_descripcion {
    type: string
     sql: ${TABLE}.TIPA_DESCRIPCION ;;
  }
  dimension: zona {
    type: string
     sql: ${TABLE}.Zona ;;
  }
  dimension: zona_codigo_rep {
    type: string
     sql: ${TABLE}.Zona_codigo_rep ;;
  }
  dimension: zona_nombre {
    type: string
     sql: ${TABLE}.Zona_nombre ;;
  }
  measure: count {
    type: count
  }
}
