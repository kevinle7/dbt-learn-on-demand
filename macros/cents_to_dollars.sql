{% macro cents_to_dollars(column_name, round_amount=2) %}

round( 1.0 * {{ column_name }} / 100, {{ round_amount }} )

{% endmacro %}