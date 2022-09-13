-- Still need to finish it. Issue is that we need to read the file from test/compiled folder and return the content to next step.

{% macro preview_query(model_compiled_path) %}
    
    {% set query_model %}
        with open('target/compiled/dbt_training/models/{{model_compiled_path}}') as f:
            query_model = f.read()
            return query_model
    {% endset %}

    {% if execute %}
        {% set results = run_query(query_model) %}
        {{ log('\nShowing the query result of: ' ~ query, info= True ) }}
        {% do results.print_table() %}
        {#% do results.print_json() %#}
    {% endif %}

{% endmacro %}