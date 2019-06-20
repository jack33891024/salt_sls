/etc/profile:
  file.append:
    - text:
      - export HISTTIMEFORMAT="%F %T `whoami` "
      - export PS1='[\u@\H \w]\$ '
      - alias grep="grep --color=auto"
      - alias egrep="egrep --color=auto"
      - alias rm="echo DOES NOT USE RM"
