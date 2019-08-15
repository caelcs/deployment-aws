#Deployment to AWS

To achieve the goal make a Deployment of an app to AWS. The current project use:

- Terraform
- Ansible
- Docker

To create an AWS Instance with all the necessary elements to run Docker Swarm.

Once the AWS Instance is running and the Docker Swarm has been initialise automatically then we would be able to deploy the apps that we have in mind.

##Steps

###Step 1
You have to have a Amazon EC2 Account created and also created a IAM User.
You can follow the documentation of Amazon to do so.
Basically once you have all of that created you will need:

- Access key ID
- Secret access key

These two allows the scripts to create all the necessary artifacts necessary to have your AWS Instance up and running.

###Step 2
Install **Terraform** and **Ansible** in your local machine in order to be able to run all the scripts.
There is plenty of documentation about how to do this for each type of machine.

###Step 3
The project is quite generic but only generate one AWS Instance and it has Docker Swarm Initialise as Master by default.

First we need to provision the Access key ID, Secret access key and the ssh public key path to the scripts.
The best way to do this is by .tfvars files

Create a file called env.tfvars and have this as content:

```
aws_access_key_id = "<use your access key id>"
aws_secret_access_key = "<use your secret access key>"
key_path = "<path to one ssh public key>"
```

once you have that created then we are ready to run the scripts and have our AWS instance running.

###Step 4
```
terraform init
terraform plan -var-file="env.tfvars"
terraform apply -var-file="env.tfvars"
```

DONE!
