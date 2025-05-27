# 🌐 Modular Azure Jenkins Deployment using Terraform

Modular Terraform project to provision a Jenkins-ready virtual machine on Azure making it easy to deploy and manage cloud infrastructure with reusability and clarity — complete with networking, security, automated installation and remote state.

🔧 Features:

Modular infrastructure-as-code (IaC) structure using Terraform

Automated provisioning of:

- Virtual Network, Subnet, NSG, NIC, Public IP

- Azure Linux VM with SSH

- Jenkins installation via CustomScript extension

- Fully customizable via input variables

- Clean and reusable module-based setup

- Shell script installation (install_jenkins.sh) separated from provisioning logic


---

## 📁 Project Structure

```
azure-terraform-infra/
├── main.tf
├── outputs.tf
├── providers.tf
├── terraform.tfvars
├── variables.tf
├── modules/
│   ├── network/
│   ├── nsg/
│   ├── vm/
│   └── scripts/
│       └── install-jenkins.sh/
```
## Modules


- `network` – Deploys a virtual network with address space and subnets.
- `nsg` – Creates a Network Security Group with configurable rules.
- `virtual-machine` – Deploys a virtual machine with network interfaces and public IP.

Each module includes:
- `main.tf` – Resource configuration
- `variables.tf` – Input variables
- `outputs.tf` – Output values

---

## Requirements

Make sure you have the following installed:

- [Terraform](https://developer.hashicorp.com/terraform/downloads)
- [Azure CLI](https://learn.microsoft.com/en-us/cli/azure/install-azure-cli)
- An active Azure subscription
---

## Authentication Methods

There are several ways to authenticate to Azure when using Terraform:

- **Azure CLI Authentication:**  
  Use `az login` to authenticate your CLI session, which Terraform will use automatically.

- **Service Principal with Client Secret:**  
  Create a service principal and provide the client ID, client secret, and tenant ID as environment variables or in your provider configuration.

- **Managed Identity:**  
  Use a managed identity (if running on Azure resources like Azure VM or Azure DevOps) to authenticate without credentials.

- **Environment Variables:**  
  Set environment variables such as `ARM_CLIENT_ID`, `ARM_CLIENT_SECRET`, `ARM_TENANT_ID`, and `ARM_SUBSCRIPTION_ID` for Terraform Azure Provider to use.

- **Azure Cloud Shell:**  
  Running Terraform inside Azure Cloud Shell automatically authenticates via the shell's identity.


---

### 📌 Make sure you have a remote backend configured.


---

Login to your Azure account using:

```bash
az login
```
Update terraform.tfvars:
 - Set values for variables like:
```bash
resource_group_name = "your-rg"
location            = "East US"
ssh_public_key_path = "~/.ssh/id_rsa.pub"

```
---
##  Usage

1. Clone the repository:

    ```bash
    git clone https://github.com/yourusername/your-repo-name.git
    cd your-repo-name
    ```

2. Initialize Terraform:

    ```bash
    erraform init -backend-config="backend.config"
    ```
3. Validate Configuration:

    ```bash
    terraform validate
    ```

4. Preview the changes:

    ```bash
    terraform plan
    ```
5. Apply the configuration:

    ```bash
    terraform apply
    ```
6. Destroy the infrastructure (if needed):

    ```bash
    terraform destroy
    ```
7. Show Outputs:

    ```bash
    terraform output
    ```
7. If you don't see the desired output:

    ```bash
    terraform refresh
    ```
## Jenkins Initial Admin Password

After Jenkins is installed on the VM, it generates an initial admin password used to unlock Jenkins for the first time.  
This password is stored inside the VM at:
```bash
    /var/lib/jenkins/secrets/initialAdminPassword
```
## Accessing Jenkins and SSH
You can get the public IP address after deployment from Terraform output:

Jenkins URL:
```bash
    http://<public_ip>:8080
```
SSH command:
```bash
    ssh -i ~/.ssh/id_rsa ${var.admin_username}@<public_ip>
```

## License

This project is open source and available under the MIT License.
