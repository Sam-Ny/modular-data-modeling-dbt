{%- set fruits = ["apple", "banana", "cherry"] -%}
{%- for i in fruits -%}
    {%- if i != "apple" -%}
        {{ i }}
    {% else -%}
        No {{ i }}
    {%- endif %}
{% endfor %}