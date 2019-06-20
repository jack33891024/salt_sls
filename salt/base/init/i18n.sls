{% if grains['osmajorrelease'] == 6 %}
/etc/sysconfig/i18n:
  file.managed:
    - source: salt://init/files/i18n
    - user: root
    - group: root
    - mode: 644
{% endif %}
