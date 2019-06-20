include:
  - keepalived.init
keepalived-service:
  file.managed:
    - name: /etc/keepalived/keepalived.conf
    - source: salt://lb-outside/files/haproxy-outside-keepalived.conf
    - user: root
    - group: root
    - mode: 644
    - template: jinja
    {% if grains['fqdn'] == 'proxy-east-1' %}
    - ROUTEID: haproxy_ha_1
    - STATEID: MASTER
    - PRIORITYID: 150
    {% elif grains['fqdn'] == 'proxy-east-2' %}
    - ROUTEID: haproxy_ha_2
    - STATEID: BACKUP
    - PRIORITYID: 100
    {% endif %}
  cmd.run:
    - name: ln -s /usr/local/keepalived/sbin/keepalived /usr/sbin/
    - unless: test -f /usr/sbin/keepalived
    - watch:
      - file: keepalived-install
  service.running:
    - name: keepalived
    - enable: True
    - watch:
      - file: keepalived-service 
