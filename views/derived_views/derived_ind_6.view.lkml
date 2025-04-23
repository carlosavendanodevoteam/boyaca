view: derived_ind_6 {
  derived_table: {
    sql: SELECT
          FECHA_FILTRO,
          r.Region as REGION,
          Expe_numero,
          CONCAT(Dele_codigo_des, " - " , r.Nombre," - ",r.Region) AS PLAZA,
           IF(
              expe_antes_fecha_objetivo_c = 1
              OR expe_en_fecha_objetivo_c = 1,
              Expe_numero,
              NULL
          ) as Expe_en_objetivo,
          EXPE_CODIGO, EXPE_PESO_OCUPACION,
          expe_peso_expedicion,
          expe_no_clasificable_c,
          expe_antes_fecha_objetivo_c,
          expe_en_fecha_objetivo_c
      FROM
          `datalake-transporte.alertran.t_treal_calidad_recibida`   p
          INNER JOIN `datalake-transporte.alertran.t_regiones_agencias`  r  -- Si no esta en la tabla de regiones agencias no se muestra
          ON p.Dele_codigo_des = r.DELE_CODIGO

      WHERE
              --PRODUCTO IN (Null, 'PR - PREFRENTE', 'GR - GRUPAJE', 'MA - MARITIMO', 'EX - EXCLUSIVO' )
              PRSE_DESCRIPCION IN (Null, 'PREFRENTE', 'GRUPAJE', 'MARITIMO', 'EXCLUSIVO' )
              AND CR_ESTADO  NOT IN ('RECO', 'DEVU', 'FALT')
              AND Clie_cent_codigo_nom_ori NOT IN(
              '080000757-04 - PUNTO FA - LAST MILE MANGO INVERSA','080001082-02 - HONDA - RETURNS','080001106-02 - PARFOIS - (RETURNS)',
              '080001106-03 - PARFOIS - (TRANSFERS)','280000129-02 - DAF TRUCKS N.V. - DEVOLUCIONES','280000527-02 - LYRECO ESPAÑA, S.A. - ARRASTRES Y DEVOLUCIONES',
              '280000532-03 - NEOVIA VOLVO - DEVOLUCIONES','280001010-03 - MTL RETORNOS','2800000947-03 - RECAMBIA PALAUSA DEVOLUCIONES','280000900-09 - VOLVO TRUCK EXTRAS'
              )

          AND TIPA_DESCRIPCION NOT IN ('EMG-EMP GRUPO') AND TIPA_DESCRIPCION IS NOT Null ;;
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

  dimension: expe_numero {
    type: string
    sql: ${TABLE}.Expe_numero ;;
  }

  dimension: plaza {
    type: string
    sql: ${TABLE}.PLAZA ;;
  }

  dimension: expe_en_objetivo {
    type: string
    sql: ${TABLE}.Expe_en_objetivo ;;
  }

  dimension: expe_codigo {
    type: number
    sql: ${TABLE}.EXPE_CODIGO ;;
  }

  dimension: expe_peso_ocupacion {
    type: number
    sql: ${TABLE}.EXPE_PESO_OCUPACION ;;
  }

  dimension: expe_peso_expedicion {
    type: number
    sql: ${TABLE}.expe_peso_expedicion ;;
  }

  dimension: expe_no_clasificable_c {
    type: number
    sql: ${TABLE}.expe_no_clasificable_c ;;
  }

  dimension: expe_antes_fecha_objetivo_c {
    type: number
    sql: ${TABLE}.expe_antes_fecha_objetivo_c ;;
  }

  dimension: expe_en_fecha_objetivo_c {
    type: number
    sql: ${TABLE}.expe_en_fecha_objetivo_c ;;
  }


  measure: count {
    type: count
    drill_fields: [detail*]
  }

  measure: exp_totales {
    type: count_distinct
    sql: ${TABLE}.EXPE_CODIGO ;;
  }

  measure: exp_num_classif {
    type: count_distinct
    sql:  IF(${expe_no_clasificable_c} = 1, ${expe_codigo}, NULL) ;;
  }

  measure: prkgs {
    label: "PRKgs"
    type: sum
    sql:  ${expe_peso_expedicion} ;;
  }

  measure: antes {
    type: count_distinct
    sql: IF(${expe_antes_fecha_objetivo_c} = 1, ${expe_numero}, NULL) ;;
  }

  measure: porc_antes {
    type: number
    sql: ${antes}/COUNT(DISTINCT ${expe_numero});;
  }

  measure: obj {
    type: count_distinct
    sql: IF(${expe_en_fecha_objetivo_c} = 1, ${expe_numero}, NULL) ;;
  }

  measure: porc_obj {
    type: number
    sql: ${obj}/COUNT(DISTINCT ${expe_numero});;
  }

  measure: Expe_en_objetivo {
    type: count_distinct
    sql: Expe_en_objetivo ;;
  }

  set: detail {
    fields: [
        fecha_filtro,
  region,
  expe_numero,
  plaza,
  expe_en_objetivo,
  expe_codigo,
  expe_peso_ocupacion,
  expe_peso_expedicion,
  expe_no_clasificable_c,
  expe_antes_fecha_objetivo_c,
  expe_en_fecha_objetivo_c
    ]
  }
}
