# AWS Essentials: Test Lab Setup

Welcome to AWS Essentials! This is the first task in a series to help you learn AWS. 

It is easier to get familiar with a cloud by solving real-life tasks, so in this task series, you will deploy your very own instance of [Grafana](https://grafana.com/), configure it, and use it to monitor your cloud infrastructure! Grafana is a tool for building dashboards, mostly used for infrastructure monitoring. 

## Prerequirements

Before completing any task in the module, make sure that you followed all the steps described in the **Environment Setup** topic, in particular: 

1. Make sure you have an [AWS](https://aws.amazon.com/free/) account.

2. Install [AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html).

3. Install [PowerShell Core](https://learn.microsoft.com/en-us/powershell/scripting/install/installing-powershell?view=powershell-7.4).

4. Install [Terraform](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli).

5. Log in to AWS CLI on your computer by running the command:
   
    ```
    aws configure
    ```

## Task Requirements 

Grafana is an app for building dashboards with data from different sources. To run it, you need a webserver and a database. Today, you will start deploying your deployment's infrastructure with Terraform. 

To complete this task: 

1. Edit `main.tf` — uncommend the `aws_vpc` resource. VPC is an AWS resource for building private networks. 

2. Run the following commands to generate a Terraform execution plan in **JSON** format: 

    ```
    terraform init
    terraform plan -out=tfplan
    terraform show -json tfplan > tfplan.json
    ```

3. Run an automated test to check yourself:
 
    ```
    pwsh ./tests/test-tf-plan.ps1
    ```

If any test fails - please check your task code and repeat step 2 to generage a new tfplan.json file. 

4. Deploy infrastructure using the following command: 
    
    ```
    terraform apply
    ```

5. Commit file `tfplan.json` and submit your solution for review. 
