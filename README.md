# Deployment to AWS

To achieve the goal make a Deployment of an app to AWS. The current project use:

- Terraform
- Ansible
- Docker

To create an AWS Instance with all the necessary elements to run Docker.

Once the AWS Instance is running and the Docker has been initialise automatically then we would be able to deploy the apps that we have in mind.

## Steps

### Step 1
You have to have an Amazon EC2 Account created and also have created a IAM User with AdministratorAccess Role.

As part of the process you Must upload your public key or you can create one there but then you have to save that key in your file system in order to be used by the scripts later on.

Basically once you have all of that created you will need:

- Access key ID
- Secret access key
- SSH public key

The first two allows the scripts to create all the necessary artifacts necessary to have your AWS Instance up and running.

### Step 2
Install **Terraform** and **Ansible** in your local machine in order to be able to run all the scripts.
There is plenty of documentation about how to do this for each type of machine.

### Step 3
The project is quite generic but only generate one AWS Instance and it has Docker Swarm Initialise as Master by default.

First we need to provision the Access key ID, Secret access key and the ssh public key path to the scripts.
The best way to do this is by .tfvars files

You just need to replace the values in two files:

secrets.tfvars and ssh_keys.tfvars

```
aws_access_key_id = "<use your access key id>"
aws_secret_access_key = "<use your secret access key>"
key_path = "<path to one ssh public key>"
```

Once you have that created then we are ready to run the scripts and have our AWS instance running.

### Step 4
```
terraform init
terraform plan -var-file="secrets.tfvars" -var-file="ssh_keys.tfvars"
terraform apply -var-file="secrets.tfvars" -var-file="ssh_keys.tfvars"
```

DONE you have your instance running and in the output you have your static IP.

### Step 5

Deploy the app is super easy. Just take the static ip from the previous step and modify the hosts file
eg.
```
[masters]
233.66.77.88
[workers]
223.66.00.01
```

Update the app.yml with all your services that you want to deploy.

and finally:

**IMPORTANT NOTE**: before execute this script please verify that the amazon instance has the instance state "RUNNING" and status checks "2/2 checks passed"

```
ansible-playbook -i hosts playbook-master.yml
ansible-playbook -i hosts playbook-worker.yml
ansible-playbook -i hosts playbook-deploy.yml
```
