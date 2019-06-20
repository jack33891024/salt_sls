/etc/yum.repos.d/webtatic.repo:
  file.managed:
    {% if grains['osmajorrelease'] == 6 %}
    - source: salt://init/files/webtatic-6.repo
    {% elif grains['osmajorrelease'] == 7 %}
    - source: salt://init/files/webtatic-7.repo
    {% endif %}
    - user: root
    - group: root
    - mode: 644


{% if grains['osmajorrelease'] == 6 %}
/etc/pki/rpm-gpg/RPM-GPG-KEY-webtatic-el6:
  file.managed:
    - source: salt://init/files/RPM-GPG-KEY-webtatic-el6
    - user: root
    - group: root
    - mode: 644
{% endif %}

{% if grains['osmajorrelease'] == 7 %}
/etc/pki/rpm-gpg/RPM-GPG-KEY-webtatic-el7:
  file.managed:
    - source: salt://init/files/RPM-GPG-KEY-webtatic-el7
    - user: root
    - group: root
    - mode: 644
{% endif %}

