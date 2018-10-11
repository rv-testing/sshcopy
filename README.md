# sshcopy

## Instruction
### 1 Populate your /etc/hosts with ip and host after the two default lines
### 2 Put the user password on the home folder file secret like "echo 123456 > secret"

# Prerequisite:  sshpass
***This will be installed on this script and you might have to enter your sudo password unless you have no-password settings

```
curl https://raw.githubusercontent.com/tso-testing/sshcopy/master/sshcopy7.sh | /bin/bash
```



# To install dotnet on centos 7 
```
curl -o  /etc/yum.repos.d/centos.repo https://raw.githubusercontent.com/tso-ansible/ansible-tower/master/centos.repo
yum clean
wget https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
rpm -ivh epel-release-latest-7.noarch.rpm 

mkdir agent
cd agent
wget https://vstsagentpackage.azureedge.net/agent/2.140.2/vsts-agent-linux-x64-2.140.2.tar.gz
tar -xzf vsts-agent-linux-x64-2.140.2.tar.gz 
 
sudo yum -y install https://centos7.iuscommunity.org/ius-release.rpm
sudo yum -y install git2u 
sudo ./bin/installdependencies.sh 


curl -s https://packagecloud.io/install/repositories/github/git-lfs/script.rpm.sh | sudo bash
sudo yum install git-lfs
sudo git lfs install 

./config.sh
./run.shy
```

