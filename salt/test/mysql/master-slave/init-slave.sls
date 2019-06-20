include:
  - mysql.master-slave.init
slave-start:
  file.managed:
    - name: /data/scripts/start_slave.sh
    - source: salt://mysql/master-slave/files/start_slave.sh
    - user: root
    - group: root
    - mode: 755
  cmd.run:
    - name: /bin/bash /data/scripts/start_slave.sh
    - unless: test -f /etc/my.cnf.d/slave.lock
