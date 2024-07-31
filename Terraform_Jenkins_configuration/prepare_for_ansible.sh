#!/bin/bash
# SAVE PRIVATE KEY
JENKINS_PRIVATE_KEY=$(terraform output -raw jenkins_private_key_pem)
# CHECK IF IT WAS SUCESSFULL
if [ $? -ne 0 ]; then
    echo "Error: Failed to get jenkins_private_key_pem from Terraform output"
    exit 1
fi

# SAVE KEY TO master.pem
echo "${JENKINS_PRIVATE_KEY}" > Ansible/jenkins.pem

# SET PROPER MODE
chmod 600 Ansible/jenkins.pem

echo "The private key has been saved to Ansible/jenkins.pem"

# SAVE IPs TO VAR
JENKINS_IP=$(terraform output -raw jenkins_instance_public_ip)

echo "${JENKINS_IP}"

# SAVE IPs TO hosts FILE
{
    echo "[jenkins]"
    echo "EC2_JENKINS ansible_host=${JENKINS_IP} ansible_user=ubuntu ansible_ssh_private_key_file=jenkins.pem"
} > Ansible/hosts

echo "Hosts modified properly"
