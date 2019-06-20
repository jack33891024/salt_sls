{% if grains['osmajorrelease'] == 6 %}
iptables-stop:
  service.dead:
    - name: iptables
    - enable: False
ip6tables-stop:
  service.dead:
    - name: ip6tables
    - enable: False
{% endif %}

{% if grains['osmajorrelease'] == 7 %}
firewalld-stop:
  service.dead:
    - name: firewalld
    - enable: False
{% endif %}

