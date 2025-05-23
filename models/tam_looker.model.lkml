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

map_layer: provincias {
  file: "/maps/spain-provinces-geo_.geojson"
}
