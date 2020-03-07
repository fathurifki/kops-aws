## KOPS (Kubernetes Operations) Using AWS
This is Practice using  KOPS which is using EC2, Route 53, S3 Bucket

### Initiate Your Cluster
In this case im using t2.micro and 8GB HD, you can custom it as you want

|	Type	 	 | Second Header
------------ | -------------
Image | Ubuntu Server 18.04 LTS (HVM), SSD Volume Type
Instance| t2.micro
Storage| 8GB
Security Group| HTTP Port 80, IP range 0.0.0.0/0
 * | HTTP Port 80, IP range ::/0
 * | All TCP Port 0 , IP range 0.0.0.0/0 & ::/0
 * | All UDP Port 0 , IP range 0.0.0.0/0 & ::/0
 * | HTTPS Port 443 Port 0 - 65535 , IP range 0.0.0.0/0 & ::/0
 * | Custom TCP RULE Port 0 - 65535 , IP range 0.0.0.0/0 & ::/0