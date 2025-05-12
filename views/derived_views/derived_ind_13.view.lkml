
view: derived_ind_13 {
  derived_table: {
    sql: SELECT
-- p.VIAJ_FECHA_PREV_SALIDA
-- VIAJ_FECHA_PLAN_SALIDA
    DATE(DATETIME(p.Viaj_fecha_salida, 'Europe/Madrid')) as FECHA_FILTRO,
    r.Region as REGION,
    CONCAT(p.DELE_CODIGO_ORI, " - " , r.Nombre," - ",r.Region) AS PLAZA,
    CASE
        WHEN Viaj_fecha_prev_salida IS NULL OR Viaj_fecha_salida IS NULL  THEN
             --"Desconocido"
             0
        WHEN Viaj_fecha_salida > DATETIME_ADD(Viaj_fecha_prev_salida, INTERVAL 5 MINUTE) THEN
            --'Sí'
            0
        ELSE
            --'No'
            1
    END  AS Salida_ontime,
    VIAJ_CODIGO,
    DELE_NOM_ORI,
    DELE_CODIGO_ORI,
    DELE_NOM_DES,
    DELE_CODIGO_DES


FROM
    `datalake-transporte.alertran.t_viajes_ale`  p
      INNER JOIN `datalake-transporte.alertran.t_regiones_agencias`  r  -- Si no esta en la tabla de regiones agencias no se muestra
      ON p.DELE_CODIGO_ORI = r.DELE_CODIGO
WHERE
    p.VIAJ_FECHA_BAJA IS NULL AND
    p.Viaj_fecha_salida IS NOT NULL AND
    p.VIAJ_IMPORTE > 0 AND
    p.HBTR_OPERACION != 'F'
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


  dimension: dele_codigo_des {
    type: string
    sql: ${TABLE}.DELE_CODIGO_DES ;;
  }

  dimension: dele_nom_des {
    type: string
    sql: ${TABLE}.DELE_NOM_DES ;;
  }

  dimension: dele_codigo_ori {
    type: string
    sql: ${TABLE}.DELE_CODIGO_ORI ;;
  }

  dimension: dele_nom_ori {
    type: string
    sql: ${TABLE}.DELE_NOM_ORI ;;
  }

  dimension: viaj_codigo {
    type: string
    sql: ${TABLE}.VIAJ_CODIGO ;;
  }

  dimension: salida_ontime {
    type: number
    sql: ${TABLE}.Salida_ontime ;;
  }


  measure: count {
    type: count
  }


}
