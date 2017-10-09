#!/bin/bash
para=$1
gulp clean
killall -9 node
killall -9 rethinkdb
ipaddr=`ifconfig eth0|awk 'NR==2{print $2}'|cut -d : -f2`
rethinkdb --bind $ipaddr --cache-size 512 &
#rethinkdb  --bind $ipaddr --config-file /etc/rethinkdb/rethinkdb.conf &
#rethinkdb --join 172.20.104.15:29015 --bind all &
sleep 3
DATE=`date +%F`

mkdir /var/stf/log 2>&1

if [ "$para" = "ldap" ];then
#  echo $para    stf-test.oa.com
stf local --public-ip=stf-test.oa.com -C --poorxy-port 80 --auth-type ldap --auth-options '["--ldap-url","ldap://192.168.100.51:389", "--ldap-bind-dn","CN=LdapSync,OU=SpecUsers,OU=PublicOU,OU=BoyaaSZ,DC=boyaa,DC=com","--ldap-search-dn","OU=BoyaaSZ,DC=boyaa,DC=com", "--ldap-bind-credentials","ldap234%^", "--ldap-search-class","Person", "--ldap-search-field", "sAMAccountName"]' >> /var/stf/log/$DATE.log 2>&1 &
else
echo "noldap"
stf local --public-ip=stf-test.oa.com  --poorxy-port 80 --provider '127.0.0.1' >> /var/stf/log/$DATE.log 2>&1 &
fi
sleep 30
stf provider --name 172.20.101.130 --min-port 8400 --max-port 8700 --connect-sub tcp://127.0.0.1:7114 --connect-push tcp://127.0.0.1:7116 --group-timeout 900 --public-ip stf-test.oa.com --storage-url http://localhost:80/ --adb-host 172.20.101.130 --adb-port 5037 --vnc-initial-size 600x800>>/var/stf/log/$DATE.log 2>&1 &
stf provider --name 172.20.101.11 --min-port 9400 --max-port 9700 --connect-sub tcp://127.0.0.1:7114 --connect-push tcp://127.0.0.1:7116 --group-timeout 900 --public-ip stf-test.oa.com --storage-url http://localhost:80/ --adb-host 172.20.101.11 --adb-port 5037 --vnc-initial-size 600x800>>/var/stf/log/$DATE.log 2>&1 &
#stf provider --name 172.20.101.12 --min-port 10400 --max-port 10700 --connect-sub tcp://127.0.0.1:7114 --connect-push tcp://127.0.0.1:7116 --group-timeout 900 --public-ip stf-test.oa.com --storage-url http://localhost:80/ --adb-host 172.20.101.12 --adb-port 5037 --vnc-initial-size 600x800>>/var/stf/log/$DATE.log 2>&1 &
#stf provider --name 172.20.108.43 --min-port 11400 --max-port 11700 --connect-sub tcp://127.0.0.1:7114 --connect-push tcp://127.0.0.1:7116 --group-timeout 900 --public-ip stf-test.oa.com --storage-url http://localhost:80/ --adb-host 172.20.108.43 --adb-port 5037 --vnc-initial-size 600x800>>/var/stf/log/$DATE.log 2>&1 &
ulimit -c unlimited
ulimit -n 65535
