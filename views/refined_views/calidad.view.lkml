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
    value_format: "0.00"
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
    value_format: "0.00"
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
    # value_format: "0.00"
  }

  measure: porc_acum_obj {
    type: number
    label: "% Acum Obj"
    sql: (COUNT(DISTINCT(IF(${expe_antes_fecha_objetivo_c} = 1 OR ${expe_en_fecha_objetivo_c} = 1, ${expe_numero}, NULL)))/COUNT(DISTINCT(${expe_numero}))) * 100;;
    # value_format: "0.00%"
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

  measure: sum_expe_sin_fecha_objetivo {
    type: sum
    sql: ${expe_sin_fecha_objetivo};;
  }

  measure: sum_expe_pendiente {
    type: sum
    sql: ${expe_pendiente};;
  }

  measure: sum_expe_sin_exfe_fecha_c {
    type: sum
    sql: ${expe_sin_exfe_fecha_c};;
  }

  measure: sum_expe_en_periodo_c {
    type: sum
    sql: ${expe_en_periodo_c};;
  }

  measure: sum_expe_antes_fecha_objetivo_c {
    type: sum
    sql: ${expe_antes_fecha_objetivo_c};;
  }

  measure: sum_expe_en_fecha_objetivo_c {
    type: sum
    sql: ${expe_en_fecha_objetivo_c};;
  }

  measure: sum_expe_fuera_de_hora_c {
    type: sum
    sql: ${expe_fuera_de_hora_c};;
  }

  measure: sum_expe_1_dia_retraso_c {
    type: sum
    sql: ${expe_1_dia_retraso_c};;
  }

  measure: sum_expe_mas_1_dia_retraso_c {
    type: sum
    sql: ${expe_mas_1_dia_retraso_c};;
  }

  measure: sum_expe_no_clasificable_c {
    type: sum
    sql: ${expe_no_clasificable_c};;
  }



  parameter: param_agencia_cliente {
    default_value: "dele_codigo_pag"
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
      value: "clie_codigo_ori_nom"
    }
    allowed_value: {
      label: "Cliente Destino"
      value: "clie_codigo_des_nom"
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

  parameter: param_destino {
    default_value: "dele_nombre_des"
    allowed_value: {
      label: "Región"
      value: "region"
    }
    allowed_value: {
      label: "Provincia"
      value: "dele_nombre_des"
    }
    allowed_value: {
      label: "Zona"
      value: "zona"
    }
    allowed_value: {
      label: "Población"
      value: "expe_poblacion_destino"
    }
    allowed_value: {
      label: "Fecha Recogida"
      value: "fecha_recogida_date"
    }
    allowed_value: {
      label: "Fecha Llegada"
      value: "fecha_llegada_date"
    }
    allowed_value: {
      label: "Fecha Última Entrega"
      value: "cr_fecha_ultima_entrega_date"
    }
    allowed_value: {
      label: "Estado"
      value: "cr_estado"
    }
    allowed_value: {
      label: "NAF"
      value: "tipa_descripcion"
    }
  }

  parameter: param_sum_expe {
    default_value: "sum_expe_pendiente"
    allowed_value: { label: "Pendiente" value: "sum_expe_pendiente" }
    allowed_value: { label: "En Periodo" value: "sum_expe_en_periodo_c" }
    allowed_value: { label: "Antes de Objetivo" value: "sum_expe_antes_fecha_objetivo_c" }
    allowed_value: { label: "En Objetivo" value: "sum_expe_en_fecha_objetivo_c" }
    allowed_value: { label: "Fuera de Hora" value: "sum_expe_fuera_de_hora_c" }
    allowed_value: { label: "1 Día Retraso" value: "sum_expe_1_dia_retraso_c" }
    allowed_value: { label: "Más de 1 Día Retraso" value: "sum_expe_mas_1_dia_retraso_c" }
  }

  parameter: param_orden_medida {
    label: "Ordenar por:"
    type: string
    allowed_value: { label: "T+1" value: "t_mas_1" }
    allowed_value: { label: "Mayor T+1" value: "mayor_t_mas_1" }
    allowed_value: { label: "Pendiente" value: "pendiente" }
    allowed_value: { label: "Otras Pendiente" value: "otras_pendiente" }
    allowed_value: { label: "Antes" value: "antes" }
    allowed_value: { label: "Obj" value: "obj" }
    allowed_value: { label: "Acum Obj" value: "acum_obj" }
    allowed_value: { label: "Delay" value: "delay" }
    allowed_value: { label: "Exp Totales" value: "exp_totales" }
    allowed_value: { label: "Num Bultos" value: "num_bultos" }
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

  dimension: dinamica_destino {
    type: string
    sql:
    {% if param_destino._parameter_value contains 'region' %}
      ${region}
    {% elsif param_destino._parameter_value contains 'dele_nombre_des' %}
      ${dele_nombre_des}
    {% elsif param_destino._parameter_value contains 'zona' %}
      ${zona}
    {% elsif param_destino._parameter_value contains 'expe_poblacion_destino' %}
      ${expe_poblacion_destino}
    {% elsif param_destino._parameter_value contains 'fecha_recogida_date' %}
      ${fecha_recogida_date}
    {% elsif param_destino._parameter_value contains 'fecha_llegada_date' %}
      ${fecha_llegada_date}
    {% elsif param_destino._parameter_value contains 'cr_fecha_ultima_entrega_date' %}
      ${cr_fecha_ultima_entrega_date}
    {% elsif param_destino._parameter_value contains 'cr_estado' %}
      ${cr_estado}
    {% elsif param_destino._parameter_value contains 'tipa_descripcion' %}
      ${tipa_descripcion}
    {% else %}
      ${dele_nombre_des}
    {% endif %}
  ;;
  }


  dimension: dinamica_agencia_cliente {
    type: string
    sql:
          {% if param_agencia_cliente._parameter_value contains 'dele_codigo_pag' %}
            ${dele_codigo_pag}
          {% elsif param_agencia_cliente._parameter_value contains 'dele_codigo_des' %}
            ${dele_codigo_des}
          {% elsif param_agencia_cliente._parameter_value contains 'clie_codigo_ori_nom' %}
            ${clie_codigo_ori_nom}
          {% elsif param_agencia_cliente._parameter_value contains 'clie_codigo_des_nom' %}
            ${clie_codigo_des_nom}
          {% else %}
            ${dele_codigo_pag}
          {% endif %}
        ;;
  }


  measure: dinamica_t_mas_1 {
    type: number
    value_format: "0.00"
    sql:
    CASE
      WHEN {% parameter tipo_medida %} = 'conteo' THEN ${t_mas_1}
      WHEN {% parameter tipo_medida %} = 'porcentaje' THEN ${porc_t_mas_1}
    END ;;
    html:
    {% if tipo_medida._parameter_value contains 'porcentaje' %}
    {{rendered_value}}%
    {% else %}
    {{rendered_value}}
    {% endif %}
    ;;
  }

  measure: dinamica_mayor_t_mas_1 {
    type: number
    value_format: "0.00"
    sql:
    CASE
      WHEN {% parameter tipo_medida %} = 'conteo' THEN ${mayor_t_mas_1}
      WHEN {% parameter tipo_medida %} = 'porcentaje' THEN ${porc_mayor_t_mas_1}
    END ;;
    html:
    {% if tipo_medida._parameter_value contains 'porcentaje' %}
    {{rendered_value}}%
    {% else %}
    {{rendered_value}}
    {% endif %}
    ;;
  }

  measure: dinamica_pendiente {
    type: number
    value_format: "0.00"
    sql:
    CASE
      WHEN {% parameter tipo_medida %} = 'conteo' THEN ${pendiente}
      WHEN {% parameter tipo_medida %} = 'porcentaje' THEN ${porc_pendiente}
    END ;;
    html:
    {% if tipo_medida._parameter_value contains 'porcentaje' %}
    {{rendered_value}}%
    {% else %}
    {{rendered_value}}
    {% endif %}
    ;;
  }

  measure: dinamica_otras_pendiente {
    type: number
    value_format: "0.00"
    sql:
    CASE
      WHEN {% parameter tipo_medida %} = 'conteo' THEN ${otras_pendiente}
      WHEN {% parameter tipo_medida %} = 'porcentaje' THEN ${porc_otras_pendiente}
    END ;;
    html:
    {% if tipo_medida._parameter_value contains 'porcentaje' %}
    {{rendered_value}}%
    {% else %}
    {{rendered_value}}
    {% endif %}
    ;;
  }

  measure: dinamica_antes {
    type: number
    value_format: "0.00"
    sql:
    CASE
      WHEN {% parameter tipo_medida %} = 'conteo' THEN ${antes}
      WHEN {% parameter tipo_medida %} = 'porcentaje' THEN ${porc_antes}
    END ;;
    html:
    {% if tipo_medida._parameter_value contains 'porcentaje' %}
    {{rendered_value}}%
    {% else %}
    {{rendered_value}}
    {% endif %}
    ;;
  }

  measure: dinamica_obj {
    type: number
    value_format: "0.00"
    sql:
    CASE
      WHEN {% parameter tipo_medida %} = 'conteo' THEN ${obj}
      WHEN {% parameter tipo_medida %} = 'porcentaje' THEN ${porc_obj}
    END ;;
    html:
    {% if tipo_medida._parameter_value contains 'porcentaje' %}
    {{rendered_value}}%
    {% else %}
    {{rendered_value}}
    {% endif %}
    ;;
  }

  measure: dinamica_acum_obj {
    type: number
    value_format: "0.00"
    sql:
    CASE
      WHEN {% parameter tipo_medida %} = 'conteo' THEN ${acum_obj}
      WHEN {% parameter tipo_medida %} = 'porcentaje' THEN ${porc_acum_obj}
    END ;;
    html:
    {% if tipo_medida._parameter_value contains 'porcentaje' %}
    {{rendered_value}}%
    {% else %}
    {{rendered_value}}
    {% endif %}
    ;;
  }

  measure: dinamica_delay {
    type: number
    value_format: "0.00"
    sql:
    CASE
      WHEN {% parameter tipo_medida %} = 'conteo' THEN ${delay}
      WHEN {% parameter tipo_medida %} = 'porcentaje' THEN ${porc_delay}
    END ;;
    html:
    {% if tipo_medida._parameter_value contains 'porcentaje' %}
    {{rendered_value}}%
    {% else %}
    {{rendered_value}}
    {% endif %}
    ;;
  }


  measure: dinamica_sum_expe {
    type: number
    sql:
    {% if param_sum_expe._parameter_value contains 'sum_expe_pendiente' %}
      ${sum_expe_pendiente}
    {% elsif param_sum_expe._parameter_value contains 'sum_expe_en_periodo_c' %}
      ${sum_expe_en_periodo_c}
    {% elsif param_sum_expe._parameter_value contains 'sum_expe_antes_fecha_objetivo_c' %}
      ${sum_expe_antes_fecha_objetivo_c}
    {% elsif param_sum_expe._parameter_value contains 'sum_expe_en_fecha_objetivo_c' %}
      ${sum_expe_en_fecha_objetivo_c}
    {% elsif param_sum_expe._parameter_value contains 'sum_expe_fuera_de_hora_c' %}
      ${sum_expe_fuera_de_hora_c}
    {% elsif param_sum_expe._parameter_value contains 'sum_expe_1_dia_retraso_c' %}
      ${sum_expe_1_dia_retraso_c}
    {% elsif param_sum_expe._parameter_value contains 'sum_expe_mas_1_dia_retraso_c' %}
      ${sum_expe_mas_1_dia_retraso_c}
    {% else %}
      NULL
    {% endif %}
  ;;
  }

  measure: ordenador_medida {
    hidden: yes
    type: number
    sql:
    CASE
      WHEN {% parameter param_orden_medida %} = 't_mas_1' THEN ${dinamica_t_mas_1}
      WHEN {% parameter param_orden_medida %} = 'mayor_t_mas_1' THEN ${dinamica_mayor_t_mas_1}
      WHEN {% parameter param_orden_medida %} = 'pendiente' THEN ${dinamica_pendiente}
      WHEN {% parameter param_orden_medida %} = 'otras_pendiente' THEN ${dinamica_otras_pendiente}
      WHEN {% parameter param_orden_medida %} = 'antes' THEN ${dinamica_antes}
      WHEN {% parameter param_orden_medida %} = 'obj' THEN ${dinamica_obj}
      WHEN {% parameter param_orden_medida %} = 'acum_obj' THEN ${dinamica_acum_obj}
      WHEN {% parameter param_orden_medida %} = 'delay' THEN ${dinamica_delay}
      WHEN {% parameter param_orden_medida %} = 'exp_totales' THEN ${exp_totales}
      WHEN {% parameter param_orden_medida %} = 'num_bultos' THEN ${num_bultos}
      ELSE NULL
    END ;;
  }

  measure: medida_dinamica_ordenada {
    label_from_parameter: param_orden_medida
    type: number
    order_by_field: ordenador_medida
    sql:
    CASE
      WHEN {% parameter param_orden_medida %} = 't_mas_1' THEN ${dinamica_t_mas_1}
      WHEN {% parameter param_orden_medida %} = 'mayor_t_mas_1' THEN ${dinamica_mayor_t_mas_1}
      WHEN {% parameter param_orden_medida %} = 'pendiente' THEN ${dinamica_pendiente}
      WHEN {% parameter param_orden_medida %} = 'otras_pendiente' THEN ${dinamica_otras_pendiente}
      WHEN {% parameter param_orden_medida %} = 'antes' THEN ${dinamica_antes}
      WHEN {% parameter param_orden_medida %} = 'obj' THEN ${dinamica_obj}
      WHEN {% parameter param_orden_medida %} = 'acum_obj' THEN ${dinamica_acum_obj}
      WHEN {% parameter param_orden_medida %} = 'delay' THEN ${dinamica_delay}
      WHEN {% parameter param_orden_medida %} = 'exp_totales' THEN ${exp_totales}
      WHEN {% parameter param_orden_medida %} = 'num_bultos' THEN ${num_bultos}
      ELSE NULL
    END ;;
  }





}
