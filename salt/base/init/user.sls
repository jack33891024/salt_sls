www-user-group:
  group.present:
    - name: www
    - gid: 888
  user.present:
    - name: www
    - fullname: www
    - shell: /sbin/nologin
    - uid: 888
    - gid: 888
