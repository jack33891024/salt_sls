base:
  '*':
    - secret.zabbix-agent
  'zabbix:server':
    - match: grain
    - secret.zabbix-server
    - secret.nginx-user
    - secret.percona-zabbix
test:
  'arch:cache':
    - match: grain
    - redis-auth
  'role:cache-east-2':
    - match: grain
    - redis-master
