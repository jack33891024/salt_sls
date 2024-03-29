#!/usr/bin/env bash

for	i in `seq 1 10`
do
	mysql -hdb-east-1 -urepl_user -prepl_user@pass -e "exit"
	if [ $? -eq 0 ]
		then
			POS=$(mysql -hdb-east-1 -urepl_user -prepl_user@pass -e "show master status"|awk -F '|' 'NR==2{print $1}'|awk '{print $2}')
			mysql -e "change master to master_host='192.168.56.51',master_user='repl_user',master_password='repl_user@pass',master_log_file='master-bin.000001',master_log_pos=$POS;start slave;"
			touch /etc/my.cnf.d/slave.lock
      exit
		else
			sleep 60
	fi
done
