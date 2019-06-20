include:
  - haproxy.init
haproxy-service:
  file.managed:
    - name: /etc/haproxy/haproxy.cfg
    - source: salt://lb-outside/files/haproxy-outside.cfg
    - user: root
    - group: root
    - mode: 644
  cmd.run:
    - name: ln -s /usr/local/haproxy/sbin/haproxy /usr/sbin/haproxy
    - unless: test -f /usr/sbin/haproxy
    - require:
      - file: haproxy-install
  service.running:
    - name: haproxy
    - enable: True
    - reload: True
    - require:
      - cmd: haproxy-init
      - file: haproxy-service
