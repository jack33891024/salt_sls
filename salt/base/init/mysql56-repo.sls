/etc/yum.repos.d/mysql56-community.repo:
  file.managed:
    {% if grains['osmajorrelease'] == 6 %}
    - source: salt://init/files/mysql56-community-6.repo
    {% elif grains['osmajorrelease'] == 7 %}
    - source: salt://init/files/mysql56-community-7.repo
    {% endif %}
    - user: root
    - group: root
    - mode: 644

/etc/pki/rpm-gpg/RPM-GPG-KEY-mysql:
  file.managed:
    - source: salt://init/files/RPM-GPG-KEY-mysql
    - user: root
    - group: root
    - mode: 644
