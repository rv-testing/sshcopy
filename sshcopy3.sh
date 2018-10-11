#/bin/bash

sudo yum install sshpass -y

if [ ! -f secret ]; then
   echo
   echo "Please create your secret first! (e.g. echo Your_password > secret)"
   exit 1
fi

pass=$(cat secret)
awk -F' ' { print  $1 }' hosts > sshcopy
awk NF sshcopy > linux
awk -v password="$pass" '{print "sshpass -p " password " ssh-copy-id -o StrictHostKeyChecking=no " $1}' linux > sshcopy
chmod u+x sshcopy
./sshcopy

rm -f linux
