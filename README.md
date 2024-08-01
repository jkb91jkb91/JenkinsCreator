# Jenkins jcasc VM Setup on AWS EC2 

<a name="readme-top"></a>
<!-- ABOUT THE PROJECT -->
## About The Project
This repository is used as a part of bigger project and it is a first step and prerequisuite for step 2 and 3:  

STEPS:  
**Current >>> 1) https://github.com/jkb91jkb91/JenkinsCreator**  
Next step >>> 2) https://github.com/jkb91jkb91/Jenkins_KubeStarter  # Creates kubeadm kubernetes cluster on EC2 instances  
Next step >>> 3) https://github.com/jkb91jkb91/KubeServices   # Deploying helm charts  

This repository contains the files needed to start Terraform and Ansible in Terraform cloud and AWS that allow you to configure Jenkins with jobs.

<!-- TECHNOLOGIES -->
## Technologies
* ![Jenkins](https://img.shields.io/badge/Jenkins-D24939?style=for-the-badge&logo=jenkins&logoColor=white)
* ![Groovy](https://img.shields.io/badge/Groovy-4298B8?style=for-the-badge&logo=apache%20groovy&logoColor=white)
* ![AWS EC2](https://img.shields.io/badge/AWS%20EC2-232F3E?style=for-the-badge&logo=amazon%20aws&logoColor=white)
* ![Terraform](https://img.shields.io/badge/Terraform-623CE4?style=for-the-badge&logo=terraform&logoColor=white)
* ![Ansible](https://img.shields.io/badge/Ansible-EE0000?style=for-the-badge&logo=ansible&logoColor=white)

<!-- DETAILED DESCRIPTION -->
## Detailed description

FIRST STEP  
trigger script: **./Terraform_Jenkins_configuration/setup_terraform_and_ansible.sh**    
Prerequisuites: Terraform cloud token stored in ~/.terraform.d/credentials.tfrc.json  

SECOND STEP  
trigger script: **./Terraform_Jenkins_configuration/prepare_for_ansible.sh**  
Prerequisuites: Terraform cloud token stored in ~/.terraform.d/credentials.tfrc.json

### FIRST STEP DETAILED  >>> setup_terraform_and_ansible.sh >>> description of the process
- creation of EC2 VM ona AWS with the help of terraform and ansible and usage of remote cloud backend
- saving of IP address to ANSIBLE host file for later usage by ANSIBLE provisioning
- provisioning of VM
  - dependencies installation for jenkins
  - jenkins installation with the use of JCASC, user and plugins automatically installed
  - automatically adding four JENKINS JOBS to the instance, only JOB A and C should be triggered manually
    
    JOB A WILL AUTOMATICALLY TRIGGER JOB B AFTER A COMPLETION
    1 A_terraform_stack_create.json  
    2 B_ansible_stack_create.json  
    
    JOB C WILL AUTOMATICALLY TRIGGER JOB D AFTER C COMPLETION
    3 C_ansible_stack_delete.json  
    4 D_terraform_stack_delete.json  

  - starting and enabling JENKINS service

### SECOND STEP DETAILED  >>> prepare_for_ansible.sh >>> description of the process
- saving on local machine keys needed to ssh into EC2, all data are stored in terraform output

### FINAL RESULT
- RESULT OF SCRIPT setup_terraform_and_ansible.sh = has EC2 with FULL PROVISIONED JENKINS INSTANCE and 4 jobs in it:  
  JOB1 = A_terraform_stack_create.json  
  JOB2 = B_ansible_stack_create.json  
  JOB3 = C_ansible_stack_delete.json  
  JOB4 = D_terraform_stack_delete.json
  
  TO DO !! >>  
  Jenkins JCASC creates GLOBAL VARIABLE for TERRAFORM WITH FAKE VALUE:  
  Please paste CORRECT TOKEN THAT IS USED TO CONNECT WITH TERRAFORM REMOTE CLOUD
  
- RESULT OF SCRIPT prepare_for_ansible.sh         = We have copied ssh keys from terraform output on our local machine to enable connection tgrough SSH to EC2   


<!-- AUTHOR -->
## Author
Email: jakub.g26101991@gmail.com




<p align="right">(<a href="#readme-top">back to top</a>)</p>
