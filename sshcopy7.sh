#/bin/bash

sudo yum install sshpass -y

if [ ! -f ~/.ssh/id_rsa ]; then
	ssh-keygen -q -f ~/.ssh/id_rsa -N ""
fi

if [ ! -f secret ]; then
   echo
   echo "Please create your secret first! (e.g. echo Your_password > secret)"
   exit 1
fi

pass=$(cat secret)
awk -F' ' 'FNR > 2 { print  $2 }' /etc/hosts > sshcopy
awk NF sshcopy > linux
awk -v password="$pass" '{print "sshpass -p " password " ssh-copy-id -o StrictHostKeyChecking=no " $1}' linux > sshcopy
chmod u+x sshcopy
./sshcopy

rm -f linux copy
