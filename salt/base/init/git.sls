git-dep:
  pkg.installed:
    - pkgs:
      - libcurl-devel
      - expat-devel 
      - gettext-devel
      - perl-ExtUtils-MakeMaker
git-install:
  file.managed:
    - name: /usr/local/src/v2.7.4.zip
    - source: salt://init/files/v2.7.4.zip
    - user: root
    - group: root
    - mode: 644
  cmd.run:
    - name: cd /usr/local/src && unzip v2.7.4.zip && cd git-2.7.4 && make prefix=/usr/local/git all && make prefix=/usr/local/git install && ln -s /usr/local/git/bin/git /usr/bin/git
    - unless: test -d /usr/local/git
    - require:
      - file: git-install
      - pkg: git-dep
