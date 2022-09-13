{% macro preview_table(table, limit=10) %}

    {% set query %}
        select 
            *
        from 
            {{ table }}
        limit 
            {{limit}}
    {% endset %}

    {% if execute %}
        {% set results = run_query(query) %}
        {{ log('\nShowing the query result of: ' ~ query, info= True ) }}
        {% do results.print_table() %}
        {#% do results.print_json() %#}
    {% endif %}

{% endmacro %}