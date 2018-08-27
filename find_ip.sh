#!/bin/bash
rm -rf /var/lib/jenkins/elastic.txt
elasticsearch_ip=`aws ec2 describe-instances --filter "Name=instance-state-name,Values=running" "Name=tag:Name,Values=elastic" | grep -i "privateipaddress" | head -n1 | cut -d '"' -f4`

echo "[elastic]" > /var/lib/jenkins/myip.txt

aws ec2 describe-instances --filters "Name=instance-state-name,Values=running" "Name=tag:Name,Values=elastic" | grep "PublicIpAddress"| cut -d '"' -f4 >> /var/lib/jenkins/myip.txt

echo "[kibana]" >> /var/lib/jenkins/myip.txt
aws ec2 describe-instances --filters "Name=instance-state-name,Values=running" "Name=tag:Name,Values=kibana" | grep "PublicIpAddress"| cut -d '"' -f4 >> /var/lib/jenkins/myip.txt

echo "[logstash]" >> /var/lib/jenkins/myip.txt
aws ec2 describe-instances --filters "Name=instance-state-name,Values=running" "Name=tag:Name,Values=logstash" | grep "PublicIpAddress" | cut -d '"' -f4>> /var/lib/jenkins/myip.txt
while [ -z $elasticsearch_ip ]
do
elasticsearch_ip=`aws ec2 describe-instances --filter "Name=instance-state-name,Values=running" "Name=tag:Name,Values=elastic" | grep -i "privateipaddress" | head -n1 | cut -d '"' -f4`
done
echo $elasticsearch_ip > /var/lib/jenkins/elastic.txt
