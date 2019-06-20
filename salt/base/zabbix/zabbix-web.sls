zabbix-nginx:
  pkg.installed:
    - name: nginx
  file.managed:
    - name: /etc/nginx/nginx.conf
    - source: salt://zabbix/files/nginx.conf
    - user: root
    - group: root
    - mode: 644
  service.running:
    - name: nginx
    - enable: True
    - reload: True
    - watch:
      - file: zabbix-nginx
      - file: zabbix-config
zabbix-config:
  file.managed:
    - name: /etc/nginx/conf.d/zabbix.conf
    - source: salt://zabbix/files/zabbix.conf
    - user: root
    - group: root
    - mode: 644

zabbix-php:
  pkg.installed:
    - pkgs:
      - php56w
      - php56w-bcmath
      - php56w-devel
      - php56w-pear
      - php56w-intl
      - php56w-gd
      - php56w-process
      - php56w-mcrypt
      - php56w-mbstring
      - php56w-xml
      - php56w-xmlrpc
      - php56w-mysqlnd
      - php56w-pdo
      - php56w-opcache
      - php56w-fpm
  file.managed:
    - name: /etc/php.ini
    - source: salt://zabbix/files/php.ini
    - user: root
    - gorup: root
    - mode: 644
  service.running:
    - name: php-fpm
    - enable: True
    - watch:
      - file: zabbix-php
      - file: fpm-config
fpm-config:
  file.managed:
    - name: /etc/php-fpm.d/www.conf
    - source: salt://zabbix/files/www.conf
    - user: root
    - group: root
    - mode: 644
    - template: jinja
    - defaults:
      FPM_USER: {{ pillar['nginx-user']['User'] }}
      FPM_GROUP: {{ pillar['nginx-user']['User'] }}
php-session-path:
  file.directory:
    - name: /var/lib/php/session
    - user: {{ pillar['nginx-user']['User'] }}
    - group: {{ pillar['nginx-user']['User'] }}
    - dir_mode: 770
    - recurse:
      - user
      - group
      - mode
