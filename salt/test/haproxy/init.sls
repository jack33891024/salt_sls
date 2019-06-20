haproxy-install:
  file.managed:
    - name: /usr/local/src/haproxy-1.5.3.tar.gz
    - source: salt://haproxy/files/haproxy-1.5.3.tar.gz
    - user: root
    - group: root
    - mode: 755
  cmd.run:
    - name: cd /usr/local/src && tar xf haproxy-1.5.3.tar.gz && cd haproxy-1.5.3 && make TARGET=linux26 PREFIX=/usr/local/haproxy && make install PREFIX=/usr/local/haproxy
    - unless: test -d /usr/local/haproxy
    - require:
      - file: haproxy-install
/etc/init.d/haproxy:
  file.managed:
    - source: salt://haproxy/files/haproxy.init
    - user: root
    - group: root
    - mode: 755
    - require:
      - cmd: haproxy-install
/etc/haproxy:
  file.directory:
    - user: root
    - mode: 755
haproxy-init:
  cmd.run:
    - name: chkconfig --add haproxy
    - unless: chkconfig --list|grep haproxy
    - require:
      - file: /etc/init.d/haproxy
