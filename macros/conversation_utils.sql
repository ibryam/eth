{% macro ethereum_conversation(column_name) %}


sum( {{ column_name }} )/1e18

{% endmacro %}


{% macro stablecoin_conversation(column_name) %}


sum( {{ column_name }} )/1e6

{% endmacro %}




{% macro conversation(column_name, factor)%}

sum( {{column_name}} / power(10, {{factor}}))

{% endmacro%}