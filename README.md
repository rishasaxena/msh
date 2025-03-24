# msh


Login to the GCP :
gcloud auth login

Terraform commands to perform :
Terraform init - initialize the terraform working directory and install te pluggins or modules 
Terraform fmt - It is indent all the code 
Terraform validate -this will check for any syntax error 
Terraform plan - To check the execution plan without applying changes 
terraform apply --auto-approve - To creat All the resouces  
terraform destroy --auto-approve - To destroy All the resouces  

Structure of the Project :

src > This folder has the code.py > python code to return "hello world" and the zip for the code which will be uploaded to gcs bucket to act as entry point for cloud function.

module > this consists of custom modules for cloud function and load balancer 
cloud function > consist of main.tf, output.tf, variable.tf here main.tf have all the code but variables are defined in auto.tfvars file for code reusability 
we have two environments 1. dev and 2. stage 
load balncer > consist of main.tf, output.tf, variable.tf here main.tf have all the code but variables are defined in auto.tfvars file for code reusability 
we have two environments 1. dev and 2. stage 

dev.auto.tfvars => defines the variables for dev environment
stage.auto.tfvars => defines the variable for stage environment 

