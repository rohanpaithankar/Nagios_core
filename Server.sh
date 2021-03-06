#Monitoring server
yum install -y httpd php gcc glibc glibc-common gd gd-devel make net-snmp

useradd nagios         #create nagios user

groupadd nagcmd    #create group

usermod -G nagcmd nagios    #Adding nagios user to nagcmd

usermod -G nagcmd apache  #Adding apache user to nagcmd
mkdir /root/nagios/  #Nagios directory for downloading nagios
cd /root/nagios
wget http://prdownloads.sourceforge.net/sourceforge/nagios/nagios-4.1.1.tar.gz            #download nagios 4.1.1 tar file
wget https://www.nagios-plugins.org/download/nagios-plugins-1.5.tar.gz  #download nagios plugins 1.5 tar
tar xvf nagios-4.1.1.tar.gz
tar xvf nagios-plugins-1.5.tar.gz
./configure Ñwith-command-group=nagcmd
make all
make install
make install-init  #to install init scripts
make instal-commandmode  #to make nagios work from cmd line
make install-config    #to install sample nagios files
File contacts.cfg has to be modified by adding the information of the nagios admin as contact details.
make install-webconf     #To configure web interface
htpasswd -s -c /usr/local/nagios/etc/htpasswd.users nagiosadmin
service httpd start
