nginx-server:
  pkg.installed:
    - name: nginx
  file.managed:
    - name: /etc/nginx/nginx.conf
    - source: salt://web/files/nginx.conf
    - user: root
    - group: root
    - mode: 644
  service.running:
    - name: nginx
    - enable: True
    - reload: True
    - watch:
      - file: nginx-server
php-server:
  pkg.installed:
    - pkgs:
      - php70w
      - php70w-bcmath
      - php70w-devel
      - php70w-pear
      - php70w-intl
      - php70w-gd
      - php70w-process
      - php70w-mcrypt
      - php70w-mbstring
      - php70w-xml
      - php70w-xmlrpc
      - php70w-mysqlnd
      - php70w-pdo
      - php70w-opcache
      - php70w-fpm
  file.managed:
    - name: /etc/php.ini
    - source: salt://web/files/php.ini
    - user: root
    - group: root
    - mode: 644
  service.running:
    - name: php-fpm
    - enable: True
    - watch:
      - file: php-server
      - file: fpm-config
fpm-config:
  file.managed:
    - name: /etc/php-fpm.d/www.conf
    - source: salt://web/files/www.conf
    - user: root
    - group: root
    - mode: 644
php-session-path:
  file.directory:
    - name: /var/lib/php/session
    - user: nginx
    - group: nginx
    - dir_mode: 770
    - recurse:
      - user
      - group
      - mode
