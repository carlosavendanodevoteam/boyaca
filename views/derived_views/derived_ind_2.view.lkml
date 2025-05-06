
view: derived_ind_2 {
  derived_table: {
    sql: SELECT
    p.ORTR_FECHA as FECHA_FILTRO,
    r.Region as REGION,
    CONCAT(p.DELE_CODIGO, " - " , r.Nombre," - ",r.Region) AS PLAZA,
    EXPE_CODIGO, EXPE_NUMERO, COSTE_EXPEDICION, COSTE_SARR_EXPEDICION, EXPE_PESO_OCUPACION

FROM
    `datalake-transporte.alertran.mt_expe_productividad_choferes`  p
    --LEFT JOIN `datalake-transporte.alertran.t_regiones_agencias`  r
    INNER JOIN `datalake-transporte.alertran.t_regiones_agencias`  r  -- Si no esta en la tabla de regiones agencias no se muestra
    ON p.DELE_CODIGO = r.DELE_CODIGO

WHERE
    Movimiento = "ENTREGA"
    AND Max_fin = "S"

    -- Exclusiones P. Telleria
    AND TEEX_CODIGO <> 'RECO' -- Modificar a CR_CODIGO <> RECO
    AND Producto NOT IN ('BA - SERVICIOS A ENTIDADES BANCARIAS  Y SIMILAR', 'ED - EDITORIAL (PARA RUTAS EDITORIAL)','SA - SANITARIO')
    AND RERE_APORTE_MUELLE ='N'
    AND p.DELE_CODIGO NOT IN ('075', '076', '077', '205', '265', '310', '350', '380', '485', '486', '555', '605', '288', '418', '350', '380', '288', '418', '284')
    AND p.DELE_CODIGO NOT IN ('284') --(PBX MADRID IV LOECHES)
    --Palibex
    AND p.DELE_CODIGO NOT IN ( 'P02','P03','P07','P08','P09','P12','P15','P16','P17','P22','P24','P25','P26','P27','P28','P30','P32','P33','P34','P36','P39','P42','P43','P44','P46','P47','P49','P50','P55','P56','P61','P62','P63','P64','P65','P66','P67','P68','P69','P73','P75','P76','P78','P79','P93','P95','P96','P99') ;;
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

}
