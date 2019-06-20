mysql-install:
  pkg.installed:
    - name: mysql-community-server
mysql-config:
  file.managed:
    - name: /etc/my.cnf
    - source: salt://zabbix/files/my.cnf
    - user: root
    - group: root
    - mode: 644
    - template: jinja
    - defaults:
      SERVER_ID: 10 
      PERCONA_USER: {{ pillar['percona-zabbix']['PERCONA_USER'] }}
      PERCONA_PASSWORD: {{ pillar['percona-zabbix']['PERCONA_PASS'] }}
mysql-data:
  file.directory:
    - name: /data/mysql
    - user: mysql
    - group: mysql
    - dir_mode: 755
    - file_mode: 644
    - recurse:
      - user
      - group
      - mode
mysql-slow:
  file.directory:
    - name: /var/log/mysql
    - user: mysql
    - group: mysql
mysql-service:
  service.running:
    - name: mysqld
    - enable: True
    - watch:
      - file: mysql-config
