# CI CD Project - 06

## Dockerizing Node JS Application to Deployed on ECS Fargate.

### AWS Code Pipeline fetch Code from GitHub through AWS Code build, Build a Docker Container Stored ECR and deployed to AWS ECS Fargate

---

![project 6](images/6/simple-devops-06.png)

### ***Create Application Load Balancer***

#### 1. Open EC2 Console and Select ***Load Balancers***
![project 6](images/6/ALB-4.PNG)

#### 2. Select load balancer type ***Application Load Balancer***
![project 6](images/6/ALB-1.PNG)

#### 3. Create Target Group

![project 6](images/6/TG-1.png)

#### 3. Register targets
![project 6](images/6/TG-2.png)

#### 4. Enter ***Load balancer name*** and ***VPC*** and ***Security Groups*** and ***Target Groups***
![project 6](images/6/ALB-2.PNG)
![project 6](images/6/ALB-3.PNG)


### ***Create AWS ECS Cluster Environment for Deploy Application***

#### 1. Go to AWS Elastic Container Service (ECS)

![project 6](images/6/1.PNG)

#### 2. Click Create Cluster

![project 6](images/6/2.PNG)

#### 3. Select Cluster template ***Networking only*** and Click ***Next Step***

![project 6](images/6/3.PNG)

#### 4. Enter ***Cluster name*** and Click ***Create***

![project 6](images/6/4.PNG)
![project 6](images/6/5.PNG)
![project 6](images/6/6.PNG)

#### 5. Select ***Task Definitions*** and Click ***Create new Task Definition****

![project 6](images/6/7.PNG)

#### 5. Select launch type compatibility ***FARGATE***

![project 6](images/6/8.PNG)

#### 6. Enter ***Task definition name*** and Select ***Task Memory Task CPU*** Click ***Create***

![project 6](images/6/9.PNG)

#### 7. Enter ***Container name*** and ***Image URI*** Click Add

![project 6](images/6/10.PNG)
![project 6](images/6/11.PNG)

#### 8.  Click Services Tab and Click Create
![project 6](images/6/12.PNG)
#### 9.  Configure Service Launch type Select ***FARGATE***
![project 6](images/6/13.PNG)
![project 6](images/6/14.PNG)
![project 6](images/6/15.PNG)
![project 6](images/6/16.PNG)
![project 6](images/6/17.PNG)
![project 6](images/6/18.PNG)
![project 6](images/6/19.PNG)
![project 6](images/6/20.PNG)
![project 6](images/6/21.PNG)
![project 6](images/6/22.PNG)

#### 9.  Edit the Service Security Group of inbound Rule replced with ALB Security Group Shown Below Image
![project 6](images/6/23.PNG)
![project 6](images/6/24.PNG)
![project 6](images/6/26.PNG)


### ***Configure Continuous Integration and Deployment using Code Pipeline***

#### 1. Create AWS Code Pipeline follow the Below steps

![project 6](images/6/CP-1.PNG)
![project 6](images/6/CP-2.PNG)
![project 6](images/6/CP-3.PNG)

#### 2. Build Service Add Environment Variable Used in buildspec.yml file
![project 6](images/6/CP-4.PNG)
![project 6](images/6/CP-8.PNG)
![project 6](images/6/CP-5.PNG)
![project 6](images/6/CP-6.PNG)
![project 6](images/6/CP-7.PNG)

#### 3. Add Policy to Code build Role to Access ECR
![project 6](images/6/IAM-1.PNG)

![project 6](images/6/SG-1.PNG)

#### 3. To check Application Copy the DNS name of created load balancer put in to browser
![project 6](images/6/ALB-5.PNG)

![project 6](images/6/ALB-6.PNG)
