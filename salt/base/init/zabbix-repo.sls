/etc/yum.repos.d/zabbix.repo:
  file.managed:
    {% if grains['osmajorrelease'] == 6 %}
    - source: salt://init/files/zabbix-6.repo
    {% elif grains['osmajorrelease'] == 7 %}
    - source: salt://init/files/zabbix-7.repo
    {% endif %}
    - user: root
    - group: root
    - mode: 644

/etc/pki/rpm-gpg/RPM-GPG-KEY-ZABBIX-A14FE591:
  file.managed:
    - source: salt://init/files/RPM-GPG-KEY-ZABBIX-A14FE591
    - user: root
    - group: root
    - mode: 644

/etc/pki/rpm-gpg/RPM-GPG-KEY-ZABBIX:
  file.managed:
    - source: salt://init/files/RPM-GPG-KEY-ZABBIX
    - user: root
    - group: root
    - mode: 644

