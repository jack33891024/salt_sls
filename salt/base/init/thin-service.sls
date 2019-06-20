postfix:
  service.dead:
    - enable: False 
NetworkManager:
  service.dead:
    - enable: False
{% if grains['osmajorrelease'] == 6 %}
auditd:
  service.dead:
    - enable: False
iscsi:
  service.dead:
    - enable: False
iscsid:
  service.dead:
    - enable: False
lvm2-monitor:
  service.dead:
    - enable: False
mdmonitor:
  service.dead:
    - enable: False
netfs:
  service.dead:
    - enable: False
{% endif %}
