{% macro preview_query(table, limit=50) %}

    {% set query %}
        select 
            distinct *
        from 
            {{ table }}
        limit {{limit}}

    {% endset %}

    {% if execute %}
        {% set results = run_query(query) %}
        {{ log('\nShowing the query result of: ' ~ query, info= True ) }}
        {% do results.print_table() %}
        {#% do results.print_json() %#}
    {% endif %}

{% endmacro %}