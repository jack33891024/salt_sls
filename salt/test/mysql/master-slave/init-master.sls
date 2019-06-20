include:
  - mysql.master-slave.init
repl-grant:
  cmd.run:
    - name: mysql -e "grant replication slave,super on *.* to 'repl_user'@'192.168.56.%' identified by 'repl_user@pass'"
    - unless: mysql -hdb-east-1 -urepl_user -prepl_user@pass -e "exit"
