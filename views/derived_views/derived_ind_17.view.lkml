
view: derived_ind_17 {
  derived_table: {
    sql: SELECT  
          p.ORTR_FECHA  as FECHA_FILTRO,
          r.Region as REGION,
          CONCAT(p.DELE_CODIGO, " - " , r.Nombre," - ",r.Region) AS PLAZA,
          p.ORTR_CODIGO,
          p.CIERRE_OK
      
      FROM 
          --`datalake-transporte.alertran.v_liq_reprec` p
          `datalake-transporte.alertran.v_ordenes_trabajo_rere` p
          INNER JOIN `datalake-transporte.alertran.t_regiones_agencias`  r  -- Si no esta en la tabla de regiones agencias no se muestra
          ON p.DELE_CODIGO = r.DELE_CODIGO
          LEFT JOIN `datalake-transporte.alertran.t_repartidores_recogedores` rr
          ON rr.CODIGO_REP_REC = p.RERE_CODIGO
       
      WHERE 
          rr.RERE_REP_REC NOT IN ('4')  --RECADERO='N' ;;
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

  dimension: ortr_codigo {
    type: number
    sql: ${TABLE}.ORTR_CODIGO ;;
  }

  dimension: cierre_ok {
    type: number
    sql: ${TABLE}.CIERRE_OK ;;
  }

  set: detail {
    fields: [
        fecha_filtro,
	region,
	plaza,
	ortr_codigo,
	cierre_ok
    ]
  }
}
