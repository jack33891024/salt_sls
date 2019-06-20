base:
  '*':
    - init.init
    - zabbix.zabbix-agent
  'zabbix:server':
    - match: grain
    - zabbix.zabbix-mysql
    - zabbix.zabbix-web
    - zabbix.zabbix-server
test:
  'arch:cache':
    - match: grain
    - redis.master-slave.init
  'role:db-east-1':
    - match: grain
    - mysql.master-slave.init-master
  'role:db-east-2':
    - match: grain
    - mysql.master-slave.init-slave
  'arch:web':
    - match: grain
    - web.init
  'arch:proxy':
    - match: grain
    - lb-outside.haproxy-outside
    - lb-outside.haproxy-outside-keepalived
