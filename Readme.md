## KOPS (Kubernetes Operations) Using AWS
This is Practice using  KOPS which is using EC2, Route 53, S3 Bucket

### Initiate Your Cluster
In this case im using t2.micro and 8GB HD, you can custom it as you want

|	Type	 	 | Second Header
------------ | -------------
Image | Ubuntu Server 18.04 LTS (HVM), SSD Volume Type
Instance| t2.micro
Storage| 8GB

|	Security Groups	 	 | Mandatory 
------------ | -------------
HTTP|  Port 80, IP range 0.0.0.0/0
HTTP |  Port 80, IP range ::/0
 All TCP | Port 0 , IP range 0.0.0.0/0 & ::/0
 All UDP |  Port 0 , IP range 0.0.0.0/0 & ::/0
 HTTPS |  Port 443 Port 0 - 65535 , IP range 0.0.0.0/0 & ::/0
 Custom TCP RULE |  Port 0 - 65535 , IP range 0.0.0.0/0 & ::/0

 ### Route 53
- Create your hosted zone same like your domain name 
- After create your hosted you will get record set

|	Name	 	 | Type  |  Value |
------------ | ------------- | --------- |
test.my.id |NS| ns-104.awsdns-13.com. ns-1889.awsdns-44.co.uk. ns-1112.awsdns-11.org. ns-718.awsdns-25.net.
test.my.id |SOA| ns-104.awsdns-13.com. awsdns-hostmaster.amazon.com. 1 7200 900 1209600 86400

Use that NameServer AWS (NS) for configure your domain Nameserver 
