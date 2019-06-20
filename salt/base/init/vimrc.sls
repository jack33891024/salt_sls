vimrc-config:
  file.managed:
    - name: /root/.vimrc
    - source: salt://init/files/.vimrc
    - user: root
    - group: root
    - mode: 644
