#!/bin/bash
echo "[elastic]" > /var/lib/jenkins/myip.txt
aws ec2 describe-instances --filters "Name=tag:Name,Values=elastick" | grep "PublicIpAddress" >> /var/lib/jenkins/myip.txt
echo "[kibana]" > /var/lib/jenkins/myip.txt
aws ec2 describe-instances --filters "Name=tag:Name,Values=kibana" | grep "PublicIpAddress" >> /var/lib/jenkins/myip.txt
echo "[logstash]" > /var/lib/jenkins/myip.txt
aws ec2 describe-instances --filters "Name=tag:Name,Values=kibana" | grep "PublicIpAddress" >> /var/lib/jenkins/myip.txt