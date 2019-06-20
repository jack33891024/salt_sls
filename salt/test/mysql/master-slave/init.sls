mysql-install:
  pkg.installed:
    - pkgs:
      - mysql-community-server
      - mysql-community-client
mysql-config:
  file.managed:
    - name: /etc/my.cnf
    - source: salt://mysql/master-slave/files/my.cnf
    - user: root
    - group: root
    - mode: 644
    - template: jinja
    {% if grains['fqdn'] == "db-east-1" %}
    - SERVER_ID: 51
    - LOG_BIN: master-bin
    {% elif grains['fqdn'] == "db-east-2" %}
    - SERVER_ID: 52
    - LOG_BIN: slave-bin
    {% endif %}
mysql-data:
  file.directory:
    - name: /data/mysql
    - user: mysql
    - group: mysql
mysql-service:
  service.running:
    - name: mysqld
    - enable: True
    - watch:
      - file: mysql-config
