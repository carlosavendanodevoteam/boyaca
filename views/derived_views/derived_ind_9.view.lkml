
view: derived_ind_9 {
  derived_table: {
    sql: SELECT  
          p.FECHA_SALIDA  as FECHA_FILTRO,
          r.Region as REGION,
          CONCAT(p.DELE_CODIGO_ORI, " - " , r.Nombre," - ",r.Region) AS PLAZA,
          -- Si el viaje es Ficticio no se contabiliza el viaje en si pero si sus kilos
          p.KILOS_VIAJE,
          CASE WHEN (p.CAMI_MATRICULA NOT IN ('9999TBO') ) THEN 
              p.VIAJ_CODIGO 
          ELSE 
              NULL 
          END
          as VIAJ_CODIGO
          
      
      FROM 
          `datalake-transporte.alertran.v_viajes_report_diario` p
          INNER JOIN `datalake-transporte.alertran.t_regiones_agencias`  r  -- Si no esta en la tabla de regiones agencias no se muestra
          ON p.DELE_CODIGO_ORI = r.DELE_CODIGO ;;
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

  dimension: kilos_viaje {
    type: number
    sql: ${TABLE}.KILOS_VIAJE ;;
  }

  dimension: viaj_codigo {
    type: number
    sql: ${TABLE}.VIAJ_CODIGO ;;
  }

  set: detail {
    fields: [
        fecha_filtro,
	region,
	plaza,
	kilos_viaje,
	viaj_codigo
    ]
  }
}
