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
          EXPE_CODIGO,
          EXPE_REFERENCIA_UCAR, Clie_cent_codigo_nom_ori, TIPA_DESCRIPCION, EXPE_NOMBRE_DESTINO

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

  dimension: ucar {
    type: number
    sql: ${TABLE}.EXPE_REFERENCIA_UCAR ;;
  }

  dimension: cliente_origen {
    type: number
    sql: ${TABLE}.Clie_cent_codigo_nom_ori ;;
  }

  dimension: naf {
    type: number
    sql: ${TABLE}.TIPA_DESCRIPCION ;;
  }

  dimension: consignatario {
    type: number
    sql: ${TABLE}.EXPE_NOMBRE_DESTINO ;;
  }



  measure: count {
    type: count
  }

}
