close-selinux:
  file.managed:
    - name: /etc/selinux/config
    - source: salt://init/files/selinux-config
    - user: root
    - gorup: root
    - mode: 644
  cmd.run:
    - name: setenforce 0
    - unless: getenforce | egrep "Disable|Permissive"
