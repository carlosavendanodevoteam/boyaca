# Define the database connection to be used for this model.
connection: "transporte_-_datalake"

# include all the views
include: "/views/**/*.view.lkml"

# Datagroups define a caching policy for an Explore. To learn more,
# use the Quick Help panel on the right to see documentation.

datagroup: tam_looker_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: tam_looker_default_datagroup

# Explores allow you to join together different views (database tables) based on the
# relationships between fields. By joining a view into an Explore, you make those
# fields available to users for data analysis.
# Explores should be purpose-built for specific use cases.

# To see the Explore you’re building, navigate to the Explore menu and select an Explore under "Tam Looker"

# To create more sophisticated Explores that involve multiple views, you can use the join parameter.
# Typically, join parameters require that you define the join type, join relationship, and a sql_on clause.
# Each joined view also needs to define a primary key.

explore: gs_indicadores_medicion {}
explore: mt_indicadores_medicion {}
explore: t_regiones_agencias {}
explore: test_mt_indicadores_medicion {}
explore: calidad {}

explore: derived_ind_1 {}
explore: derived_ind_2 {}
explore: derived_ind_3 {}
explore: derived_ind_4 {}
explore: derived_ind_5 {}
explore: derived_ind_6 {}
explore: derived_ind_7 {}
explore: derived_ind_9 {}
explore: derived_ind_10 {}
explore: derived_ind_12 {}
explore: derived_ind_13 {}
explore: derived_ind_15 {}
explore: derived_ind_17 {}

explore: pop2 {
  label: "POP 2"
  sql_always_where:
  {% if pop2.current_date_range._is_filtered %} {% condition pop2.current_date_range %} ${fecha_filtro_raw} {% endcondition %}
  {% if pop2.previous_date_range._is_filtered or pop2.compare_to._in_query %}
  {% if pop2.comparison_periods._parameter_value == "2" %}
  or DATE(${fecha_filtro_raw}) between  DATE(${period_2_start}) and  DATE(${period_2_end})
  {% elsif pop2.comparison_periods._parameter_value == "3" %}
  or DATE(${fecha_filtro_raw}) BETWEEN DATE(${period_2_start}) AND DATE(${period_2_end})
  or DATE(${fecha_filtro_raw}) BETWEEN DATE(${period_3_start}) AND DATE(${period_3_end})
  {% elsif pop2.comparison_periods._parameter_value == "4" %}
  or  DATE(${fecha_filtro_raw}) between  DATE(${period_2_start}) and  DATE(${period_2_end})
  or  DATE(${fecha_filtro_raw}) between  DATE(${period_3_start})and  DATE(${period_3_end}) or  DATE(${fecha_filtro_raw}) between  DATE(${period_4_start}) and  DATE(${period_4_end})
  {% else %} 1 = 1
  {% endif %}
  {% endif %}
  {% else %} 1 = 1
  {% endif %};;
}

map_layer: provincias {
  file: "/maps/spain-provinces-geo_.geojson"
}
