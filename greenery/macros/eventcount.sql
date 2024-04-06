{% macro eventcount(id,eventtype) %}
    select count(*) from {{ ref('stg_postgres_events')}} ev where ev.session_id = {{ id }} ev.event_type = '{{ eventtype }}'
{% endmacro %}