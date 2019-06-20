redis-install:
  pkg.installed:
    - name: redis
redis-config:
  file.managed:
    - name: /etc/redis.conf
    {% if grains['fqdn'] == "cache-east-1" %}
    - source: salt://redis/master-slave/files/master.conf
    - template: jinja
    - defaults:
      PORT: 6379
      IPADDR: 0.0.0.0
      REDIS_AUTH: {{ pillar['redis-auth']['password'] }}
    {% elif grains['fqdn'] == "cache-east-2" %}
    - source: salt://redis/master-slave/files/slave.conf
    - template: jinja
    - defaults:
      PORT: 6379
      IPADDR: 0.0.0.0
      REDIS_MASTER_IP: {{ pillar['redis-master']['IP'] }} 
      REDIS_AUTH: {{ pillar['redis-auth']['password'] }}
    {% endif %}
    - user: root
    - group: root
    - mode: 644
redis-data:
  file.directory:
    - name: /data/redis
    - user: redis
    - group: redis
    - watch:
      - pkg: redis-install
redis-service:
  service.running:
    - name: redis
    - enable: True
    - watch:
      - pkg: redis-install
      - file: redis-config
