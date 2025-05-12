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


  parameter: dimension_principal {
    default_value: "clie_cent_codigo_nom_ori"
    allowed_value: {
      label: "Agencia Pagadora"
      value: "dele_codigo_pag"
    }
    allowed_value: {
      label: "Agencia Destino"
      value: "dele_codigo_des"
    }
    allowed_value: {
      label: "Cliente Origen"
      value: "clie_cent_codigo_nom_ori"
    }
    allowed_value: {
      label: "NAF"
      value: "tipa_descripcion"
    }
    allowed_value: {
      label: "Producto"
      value: "prse_descripcion"
    }
    allowed_value: {
      label: "Estado Expedición"
      value: "cr_estado"
    }
  }

  parameter: tipo_medida {
    default_value: "conteo"

    allowed_value: {
      label: "% Porcentaje"
      value: "porcentaje"
    }
    allowed_value: {
      label: "Conteo"
      value: "conteo"
    }
  }

  # dimension: dinamica_dimension_principal {
  #   type: string
  #   sql:
  #   CASE
  #     WHEN {% parameter dimension_principal %} = "dele_codigo_pag" THEN ${dele_codigo_pag}
  #     WHEN {% parameter dimension_principal %} = "dele_codigo_des" THEN ${dele_codigo_des}
  #     WHEN {% parameter dimension_principal %} = "clie_cent_codigo_nom_ori" THEN ${clie_cent_codigo_nom_ori}
  #     WHEN {% parameter dimension_principal %} = "tipa_descripcion" THEN ${tipa_descripcion}
  #     WHEN {% parameter dimension_principal %} = "prse_descripcion" THEN ${prse_descripcion}
  #     WHEN {% parameter dimension_principal %} = "cr_estado" THEN ${cr_estado}
  #   END ;;
  # }
  # parameter: elegir_agrupacion {
  #   label: "2. Elegir Agrupación (Filas)"
  #   view_label: "_PoP"
  #   type: unquoted
  #   default_value: "Month"
  #   allowed_value: {label: "Nombre del Mes" value:"Month"}
  #   allowed_value: {label: "Día del Año" value: "DOY"}
  #   allowed_value: {label: "Día del Mes" value: "DOM"}
  #   allowed_value: {label: "Día de la Semana" value: "DOW"}
  #   allowed_value: {label: "Semana" value: "Week"}
  #   allowed_value: {value: "Date"}
  # }


  # dimension: pop_fila  {
  #   view_label: "_PoP"
  #   label_from_parameter: elegir_agrupacion
  #   type: string
  #   order_by_field: sort_by1
  #   sql:
  #     {% if elegir_agrupacion._parameter_value == 'Month' %} ${fecha_filtro_month_name}
  #     {% elsif elegir_agrupacion._parameter_value == 'DOY' %} ${fecha_filtro_day_of_year}
  #     {% elsif elegir_agrupacion._parameter_value == 'DOM' %} ${fecha_filtro_day_of_month}
  #     {% elsif elegir_agrupacion._parameter_value == 'DOW' %} ${fecha_filtro_day_of_week}
  #     {% elsif elegir_agrupacion._parameter_value == 'Date' %} ${fecha_filtro_date}
  #     {% elsif elegir_agrupacion._parameter_value == 'Week' %} ${fecha_filtro_week}
  #     {% else %}NULL{% endif %} ;;
  # }
  dimension: dinamica_dimension_principal {
    type: string
    sql:
          {% if dimension_principal._parameter_value == 'dele_codigo_pag' %}
            ${dele_codigo_pag}
          {% elsif dimension_principal._parameter_value == 'dele_codigo_des' %}
            ${dele_codigo_des}
          {% elsif dimension_principal._parameter_value == 'clie_cent_codigo_nom_ori' %}
            ${clie_cent_codigo_nom_ori}
          {% elsif dimension_principal._parameter_value == 'tipa_descripcion' %}
            ${tipa_descripcion}
          {% elsif dimension_principal._parameter_value == 'prse_descripcion' %}
            ${prse_descripcion}
          {% elsif dimension_principal._parameter_value == 'cr_estado' %}
            ${cr_estado}
          {% else %}
            ${clie_cent_codigo_nom_ori}
          {% endif %}
        ;;
  }


  measure: dinamica_t_mas_1 {
    type: number
    sql:
    {% if tipo_medida._parameter_value == 'conteo' %}
      ${t_mas_1}
    {% elsif tipo_medida._parameter_value == 'porcentaje' %}
      ${porc_t_mas_1}
    {% endif %};;
  }

  measure: dinamica_mayor_t_mas_1 {
    type: number
    sql:
    {% if tipo_medida._parameter_value == 'conteo' %}
      ${mayor_t_mas_1}
    {% elsif tipo_medida._parameter_value == 'porcentaje' %}
      ${porc_mayor_t_mas_1}
    {% endif %};;
  }

  measure: dinamica_pendiente {
    type: number
    sql:
    {% if tipo_medida._parameter_value == 'conteo' %}
      ${pendiente}
    {% elsif tipo_medida._parameter_value == 'porcentaje' %}
      ${porc_pendiente}
    {% endif %};;
  }

  measure: dinamica_otras_pendiente {
    type: number
    sql:
    {% if tipo_medida._parameter_value == 'conteo' %}
      ${otras_pendiente}
    {% elsif tipo_medida._parameter_value == 'porcentaje' %}
      ${porc_otras_pendiente}
    {% endif %};;
  }

  measure: dinamica_antes {
    type: number
    sql:
    {% if tipo_medida._parameter_value == 'conteo' %}
      ${antes}
    {% elsif tipo_medida._parameter_value == 'porcentaje' %}
      ${porc_antes}
    {% endif %};;
  }

  measure: dinamica_obj {
    type: number
    sql:
    {% if tipo_medida._parameter_value == 'conteo' %}
      ${obj}
    {% elsif tipo_medida._parameter_value == 'porcentaje' %}
      ${porc_obj}
    {% endif %};;
  }

  measure: dinamica_acum_obj {
    type: number
    sql:
    {% if tipo_medida._parameter_value == 'conteo' %}
      ${acum_obj}
    {% elsif tipo_medida._parameter_value == 'porcentaje' %}
      ${porc_acum_obj}
    {% endif %};;
  }

  measure: dinamica_delay {
    type: number
    sql:
    {% if tipo_medida._parameter_value == 'conteo' %}
      ${delay}
    {% elsif tipo_medida._parameter_value == 'porcentaje' %}
      ${porc_delay}
    {% endif %};;
  }


  # html:

  # {% if filtro_medida_dinamica._parameter_value == 'margen_bruto_unitario' and filtro_dimension_dinamica._parameter_value == 'Item' %}

  # €{{rendered_value}}

  # {% elsif filtro_medida_dinamica._parameter_value == 'margen_bruto_unitario' and filtro_dimension_dinamica._parameter_value == 'Agregado' %}

  # €{{rendered_value}}
  # {% elsif filtro_medida_dinamica._parameter_value == 'margen_bruto_pct' and filtro_dimension_dinamica._parameter_value == 'Item' %}

  # {{rendered_value}}%
  # {% elsif filtro_medida_dinamica._parameter_value == 'margen_bruto_pct' and filtro_dimension_dinamica._parameter_value == 'Agregado' %}

  # {{rendered_value}}%

  # {% elsif filtro_medida_dinamica._parameter_value == 'margen_bruto_eur'  and filtro_dimension_dinamica._parameter_value == 'Agregado' %}

  # €{{rendered_value}}

  # {% elsif filtro_medida_dinamica._parameter_value == 'margen_bruto_eur'  and filtro_dimension_dinamica._parameter_value == 'Item' %}

  # €{{rendered_value}}

  # {% else %}

  # €{{rendered_value}}

  # {% endif %}

  # ;;
  # value_format: "#,##0.00"


}
