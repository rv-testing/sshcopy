#/bin/bash

rpm -qa sshpass > epelx
if [[ ! -s epelx ]]; then
   sudo yum install sshpass -y
fi

while true; do
    read -p "Do you want to copy the ssh to the client(y/n)?" yn
    case $yn in
        [Yy]* )    
	      #if secret is not created
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
              break
              ;;
        [Nn]* ) break
                ;;
        * ) echo "Please answer yes or no.";;
    esac
done

rm -f epelx linux
