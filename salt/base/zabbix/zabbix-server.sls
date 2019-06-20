zabbix-server:
  pkg.installed:
    - pkgs:
      - zabbix-server-mysql
      - zabbix-web-mysql
      - zabbix-get
  file.managed:
    - name: /etc/zabbix/zabbix_server.conf
    - source: salt://zabbix/files/zabbix_server.conf
    - user: root
    - group: root
    - mode: 644
    - template: jinja
    - defaults:
      DB_HOST: localhost
      DB_NAME: zabbix
      DB_USER: {{ pillar['zabbix-server']['DB_USER'] }}
      DB_PASSWORD: {{ pillar['zabbix-server']['DB_PASS'] }}
      DB_PORT: 3306
      START_POLLERS: 5
      START_POLLERS_UNREACHABLE: 10
      START_TRAPPERS: 10
      START_PINGERS: 10
      START_DISCOVERERS: 5
      CACHE_SIZE: 1024M
      START_DBSYNCERS: 16
      HISTROY_CACHE_SIZE: 512M
      TREND_CACHE_SIZE: 512M
      TIMEOUT: 20
    - require:
      - pkg: zabbix-server
  service.running:
    - name: zabbix-server
    - enable: True
    - watch:
      - pkg: zabbix-server
      - file: zabbix-server
