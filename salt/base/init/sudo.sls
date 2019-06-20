/etc/sudoers:
  file.managed:
    - source: salt://init/files/sudoers
    - user: root
    - group: root
    - mode: 440
