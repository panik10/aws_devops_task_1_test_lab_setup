# AWS Essentials: Test lab setup

Welcome to AWS Essentials! This is a first task in series to help you learn AWS. In this task series you will deploy your very own instance of [Grafana](https://grafana.com/), configure it, and use it to monitor your cloud infrastructure! 

## Prerequirements

Before completing any task in the module, make sure that you followed all the steps described in the **Environment Setup** topic, in particular: 

1. Make sure you have an [AWS](https://aws.amazon.com/free/) account.

2. Install [aws cli](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html)

3. Install [powershell core](https://learn.microsoft.com/en-us/powershell/scripting/install/installing-powershell?view=powershell-7.4)

4. Install [terraform](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli)

5. Log in to aws cli on your computer by running command: 
    ```
    aws configure
    ```

## Task requirements 

Grafana is an app for building dashboards with data from different sources. To run it, you need a webserver and a database. Today you will start deploying your deployment's infrastructure with terraform. 

To complete this task: 
1. Edit `main.tf` - uncommend the `aws_vpc` resource. VPC is an AWS resource for building private networks. 

2. Run the following commands to generage a terraform execution plan in json format: 
    ```
    terraform init
    terraform plan -out=tfplan
    terraform show -json tfplan > tfplan.json
    ```

3. Run automated test to check yourself. 
    ```
    pwsh ./tests/test-tf-plan.ps1
    ```
If any test fails - please check your task code and repeat step 2 to generage a new tfplan.json file. 

4. Deploy infrastructure using terraform apply 
    ```
    terraform apply
    ```

5. Commit file `tfplan.json` and submit your solution for a review. 
