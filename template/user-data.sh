#!/bin/bash
yum update -y
yum install httpd -y
cd /var/www/html
echo "<html><h1>Hello World from ${EC2InstanceName}.</h1></html>" > index.html
service httpd start
chkconfig httpd on
sudo yum install -y perl-Switch perl-DateTime perl-Sys-Syslog perl-LWP-Protocol-https perl-Digest-SHA.x86_64
cd /home/ec2-user/
curl https://aws-cloudwatch.s3.amazonaws.com/downloads/CloudWatchMonitoringScripts-1.2.2.zip -O
unzip CloudWatchMonitoringScripts-1.2.2.zip
rm -rf CloudWatchMonitoringScripts-1.2.2.zip

#   Use the commands below to enable memory metrics monitoring in CloudWatch
#   /home/ec2-user/aws-scripts-mon/mon-put-instance-data.pl --mem-util --mem-used --mem-avail --verify --verbose
#   /home/ec2-user/aws-scripts-mon/mon-put-instance-data.pl --mem-util --mem-used --mem-avail
#   */1 * * * * root /home/ec2-user/aws-scripts-mon/mon-put-instance-data.pl --mem-util --mem-used --mem-avail


