# Prepare Terraform for local deployments

## Install Prereqs
- Install Git: https://git-scm.com/downloads
    - Next, next, next
    - Select VScode as the default editor
    - override default branch to main
    - Next the rest
- Install Terraform: https://developer.hashicorp.com/terraform/tutorials/azure-get-started/install-cli
    - Throw the terraform.exe file in C:\Windows\System32
    - Or point an environment variable to the exe path
        1. Type Edit environment variables
        2. Open the option Edit the system environment variables
        3. Click Environment variables... button
        4. There you see two boxes, in System Variables box find path variable
        5. Click Edit a window pops up, click New Type the Directory path of your .exe or batch file
- Install Cli:
    - https://learn.microsoft.com/en-us/cli/azure/install-azure-cli-windows?tabs=azure-cli
    - https://learn.microsoft.com/en-us/cli/azure/update-azure-cli
- Install VS Code Extensions: HashiCorp Terraform, Azure Terraform, and any other extensions recommended by VS Code
- Connect to Azure via Service Principal: https://developer.hashicorp.com/terraform/tutorials/azure-get-started/azure-build
    - az ad sp create-for-rbac --role="Contributor" --scopes="/subscriptions/<SUBSCRIPTION_ID>" --name "<OPTIONAL>"
    - Please note that these will be populated as App Registrations in Entra ID and can have there PW reset in there.

{
  "appId": "b60570a7-bc4b-4b93-93f5-3e7cdb191e0e",
  "displayName": "ADO-ServicePrincipal",
  "password": "blah",
  "tenant": "c0f2ccc7-171c-4fac-b14f-defe31192330"
}
## Start Deploying
- Optional: Configure Git settings for VS Code
    - ```git config --global user.name "Your Name"```
    - ```git config --global user.email "your.email@example.com"```
- Configure Az Login as needed:
    - Set Azure Cli to Azure Govt if necessary: ```az cloud set --name AzureUSGovernment```
    - ```az login```
        - ```az login --tenant```
    - ```az account show```
    - ```az account set --subscription "Your_Subscription_ID_or_Name"```
- Initialize Terraform: 
    - Terraform init
- Optional Preview Deployment:
    - Terraform plan (ensure you have contributor rights to the subscription)
        - Additionally you can save the plan if desired ```terraform plan -out <file.tf>```
- Optional validate Syntax:
- Deploy Terraform:
    - ```terraform apply "<plan file>"```
    - Unless there's a dependency, implied or explicit set, the order resources are deployed are randomized
    - azurerm_resource_group.myRG.name (myRG is the resource identifier and name is the referenced property)

1. resources involved
mentioned key value pairs
resource Ids
format for referencing resources


2. 
Separate files Variablizing, the file name doesn't matter just its extension. Terraform is smart enough to distinguish file properties and syntax.
note output, we're deploying to the same group and the state file has information from the first deployment.
additionally beyond changing resource names there are a few other scenarios where resources may be deleted
resource ID change
perhaps you define a sql server with DB 1,2,3. Random developer build db 4 makes a new DB and you redploy. Bc DB 4 is not in the state file it will be destroyed. There are ways around this, if you aware of DB 4 you can import DB 4 into the state file or you can ignore the lifecycle of a sql servers db's

Telling terraform to destroy resources in a given state file

 terraform apply -auto-approve
 ### Have to import because although they have the sae name they were a part of differet state files
 terraform import azurerm_resource_group.example "/subscriptions/c29a99cc-ec40-4b28-8d9f-d36431a58c64/resourceGroups/my-resource-group

Other forms of expressions such as condiionals, only deploy a listed firewall resource if env is equal to prod
 
## Gotchas
- Only one developer can access the state file at any one time. The state file can be hosted locally or in Azure. If in Azure, it can be accessed locally or via a pipeline...It can be edited directly...please don't.

- In the event you want to pull a resource into terraform
    - Terraform import


az ad sp create-for-rbac --name github-sp --role Contributor --scopes "/"

environment           = "usgovernment"