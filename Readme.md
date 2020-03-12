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

### S3 Bucket 
Create your own S3 Bucket, for example :
|	Type	 	 | Name |
------|----|
Bucket-name | test-bucket.my.id
Region | ap-southeast-1a
Permission | (optional)

### Kubernetes Dashboard
:floppy_disk:  If you want showing up Kubernetes dashboard you can remote it into your localhost, because it wont load on your instance. So here instruction

- zip your kubernetes configuration .kube
- locate your .pem aws
- scp -i <your .pem location> < Instance IP >/home/ubuntu/kube.zip kube.zip
- create user for aws configuration
- dont forget get secret token kubectl -n kubernetes-dashboard describe secret $(kubectl -n kubernetes-dashboard get secret | grep admin-user | awk '{print $1}')
- Expose the proxy kubectl proxy --address 0.0.0.0 --accept-hosts '.*'

### Expected Budget
|	Type	 	 | Price |
------|----|
Amazon EC2 Service (Asia Pacific (Singapore))| 10.69
Amazon S3 Service (Asia Pacific (Singapore)) | 0.50
Amazon Route 53 Service | 2.50
Amazon RDS Service (Asia Pacific (Singapore))|65.40
Free Tier  Discount:| -33.09
Total|46.00

### Notes
For deleting kops cluster you can use kops delete cluster --name ${KOPS_CLUSTER_NAME} --yes
For editing kops cluster you can use command kops edit ig --name ${KOPS_CLUSTER_NAME} nodes
For creating kops cluster you can use command kops create cluster \
--zones=ap-southeast-1a \
--name=${KOPS_CLUSTER_NAME} \
--ssh-public-key=~/.ssh/id_rsa.pub