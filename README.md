Two-Tier Application Deployment with Docker on AWS EC2
This repository contains the code and configurations for deploying a two-tier application using spring-petclinic, MySQL, Docker image, jenkins on Amazon ec2 (Elastic cloud compute).



Overview
The project involves deployment of two-tier application where a spring-petclinic java web application serves as the backend and interacts with a MySQL database for storing user data. The deployment is achieved using Docker containers managed deployed on the private subnet of the ec2 instance.

Infrastructure Overview:

VPC: Virtual Private Cloud is created to isolate the network resources.
Subnets: Public and private subnets are created within the VPC.
Internet Gateway: Attached to the VPC to allow internet access for resources in the public subnet.
NAT Gateway: Allows resources in the private subnet to access the internet.
EC2 Auto Scaling Group: Automatically adjusts the number of EC2 instances based on traffic and load.
EC2 Instances: These are used to host the frontend application within the Auto Scaling Group.
RDS: Relational Database Service is used for the database layer.

Repository Content
The directory contains the following for effective deployment of our application.

spring-petclinic is a java program which handle the backend of the web application .

Docker file is the file that contain sequence of command to develop an environment for our application to run including coping our App and template file in it.

Jenkinsfile  is a files is the repository that conatin all the continous deployment process or stages to create a deployment

Situation
Two-teir application needs to be deployed efficiently in a Container for it's high availability and High scalability.

Task
Package the whole application in Docker file with it's dependencies and libraries.

Make this application publicly accessible so that it can be accessed from anywhere.

Recquire a Database to store messages from the user.

Create a scalable architecture, which compatible with any environment for running our application concistently.

Action
Workflow Process Explanation:

In our deployment workflow, we utilize Terraform, Jenkins, Docker, and AWS services to orchestrate the deployment of a two-tier architecture comprising a frontend application and an RDS database. Let me walk you through how the entire process works seamlessly:
Firstly, we define our infrastructure using Terraform. This involves specifying the components we need such as the Virtual Private Cloud (VPC), subnets, gateways, Auto Scaling Group, EC2 instances, and RDS. Terraform ensures that our infrastructure is provisioned consistently and according to our defined specifications.

In our infrastructure setup, we have created a Virtual Private Cloud (VPC) to isolate and manage our network resources securely. Within this VPC, we have provisioned a total of four private subnets and two public subnets to segregate our resources based on their accessibility requirements.
private subnet is attched to the docker host and rds whicg does not need internet access outside pour vpc
public subnet is attahced to the loadbalancer which is attahced to the public route table that has internet gateway
NAT Gateway:

To facilitate outbound internet connectivity for resources within our private subnets, we have deployed two NAT Gateways.
Route Tables:

Route tables are configured to direct traffic within our VPC. Public subnets are associated with route tables containing an internet gateway to enable internet access, while private subnets route outbound traffic through the NAT Gateway for internet access.

Once Terraform has laid down the infrastructure, we move on to configuring Jenkins. Jenkins acts as the automation hub for our deployment pipeline. We set up a Jenkins pipeline that is triggered automatically upon code changes. This pipeline consists of several stages, each representing a crucial part of the deployment process.

As part of the Terraform deployment, we incorporate user data scripts. These scripts are attached to the Auto Scaling Group, enabling us to execute custom actions when EC2 instances are launched. Specifically, we use user data to install Docker on the EC2 instances within the Auto Scaling Group. This ensures that our Dockerized application can be seamlessly deployed and scaled across multiple instances.

Additionally, we utilize user data to automatically install Jenkins on one of the EC2 instances designated as the Jenkins server. This allows us to centralize our deployment process within Jenkins, making it easier to manage and monitor.

With Jenkins set up, we define our pipeline stages. One crucial stage involves building the Docker image for our application and pushing it to Amazon ECR (Elastic Container Registry). This ensures that our Docker image is securely stored and readily accessible for deployment.

Jenkins is granted access to the Docker host through IAM roles. These IAM roles are configured with the necessary permissions to pull the Docker image from ECR and deploy it to the Docker host running on the EC2 instances within the Auto Scaling Group.

Once the Docker image is successfully built and pushed to ECR, Jenkins orchestrates the deployment process. It pulls the Docker image from ECR and deploys it to the Docker host running on the EC2 instances within the Auto Scaling Group. This ensures that our application is up and running, ready to serve user requests.

By automating the deployment process with Terraform, Jenkins, Docker, and AWS services, we ensure a smooth and efficient workflow from code changes to application deployment. This allows us to focus more on developing features and less on managing infrastructure, ultimately leading to faster delivery of high-quality software.





