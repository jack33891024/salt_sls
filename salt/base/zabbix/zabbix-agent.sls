zabbix-agent:
  pkg.installed:
    - name: zabbix-agent
  file.managed:
    - name: /etc/zabbix/zabbix_agentd.conf
    - source: salt://zabbix/files/zabbix_agentd.conf
    - user: root
    - group: root
    - mode: 644
    - template: jinja
    - defaults:
      ZABBIX_SERVER: {{ pillar['zabbix-agent']['Zabbix_Server']}}
      HOSTNAME: {{ grains['fqdn'] }}
      ZABBIX_AGENT_PORT: 10050
      ZABBIX_AGENT_LISTEN_IP: 0.0.0.0
      UNSAFE_USER_PARAMETERS: 1
    - require:
      - pkg: zabbix-agent
  service.running:
    - name: zabbix-agent
    - enable: True
    - watch:
      - pkg: zabbix-agent
      - file: zabbix-agent
