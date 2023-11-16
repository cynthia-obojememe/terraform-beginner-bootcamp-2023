# Terraform Beginner Bootcamp 2023

## Semantic Versioning :mage:

This project is going to utilize semantic versioning for its tagging.
[semver. org](https://semver.org/) 

The general format: 

**MAJOR.MINOR.PATCH**, e.g. `1.0.1`:

- **MAJOR** version when you make incompatible API changes
- **MINOR** version when you add functionality in a backward-compatible manner
- **PATCH** version when you make backward compatible bug fixes

## Change in the Terraform CLI installation on gitpod.yml

The Terraform CLI installation instructions have changed due to gpg keyring changes and add yes prompt `-y`. So we changed to the latest Terraform cli installation instructions via Terraform Documentation and changed the scripting for install

[Install Terraform CLI](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli)

### Consideration for Linux Distribution

This project is built using Ubuntu, so please consider checking your Linux Distribution.

[How to Check OS Version in Linux](https://www.cyberciti.biz/faq/how-to-check-os-version-in-linux-command-line/)

```bash
$ cat /etc/os-release
PRETTY_NAME="Ubuntu 22.04.3 LTS"
NAME="Ubuntu"
VERSION_ID="22.04"
VERSION="22.04.3 LTS (Jammy Jellyfish)"
VERSION_CODENAME=jammy
ID=ubuntu
ID_LIKE=debian
HOME_URL="https://www.ubuntu.com/"
SUPPORT_URL="https://help.ubuntu.com/"
BUG_REPORT_URL="https://bugs.launchpad.net/ubuntu/"
PRIVACY_POLICY_URL="https://www.ubuntu.com/legal/terms-and-policies/privacy-policy"
UBUNTU_CODENAME=jammy
$ 
```
## Ref

### [Shebang](https://en.wikipedia.org/wiki/Shebang_(Unix))
In computing, a shebang is the character sequence consisting of the character number sign and exclamation mark (#!) at the beginning of a script. It is also called  harp-exclamation, sha-bang, hashbang, pound-bang, or hash-pling.

Use `#!/usr/bin/env bash` for :
- Portability for different OS distributions
- Will search the user's PATH for bash executable
### [Linux Permissions](https://en.wikipedia.org/wiki/File-system_permissions)
Add executable permission to newly created file as existing user
```bash
chmod u+x ./bin/install_terraform_cli.sh
```
### [Github Lifecycle](https://www.gitpod.io/docs/configure/workspaces/tasks)
Gitpod Tasks and Consideration about how init and before parameters work

### [Env Vars](https://www.cyberciti.biz/faq/set-environment-variable-linux/)

- Set Env Vars
```sh
$ export PROJECT_ROOT='/opt'
$ echo $PROJECT_ROOT
/opt
$
```
- Unset Env Vars
```sh
$ unset PROJECT_ROOT
$ echo $PROJECT_ROOT
$ 
```

### AWS CLI Installation

[Getting started install](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html)

AWS cli is installed for this project at start up using the bash script

[`./bin/install_aws_cli.sh`](./bin/install_aws_cli.sh)

- Check if AWS Credentials is configured by running the AWS cli command
```sh
$ aws sts get-caller-identity
```

Set AWS CLI envs
[reference the link on how to set and env](https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-envvars.html)
`export PROJECT_ROOT='/workspace/terraform-beginner-bootcamp-2023'`
example
```
export AWS_ACCESS_KEY_ID='AKIAIOSFODNN7EXAMPLE'
export AWS_SECRET_ACCESS_KEY='wJalrXUtnFEMI/K7MDENG/bPxRfiCYEXAMPLEKEY'
export AWS_DEFAULT_REGION='us-west-2'
```
set on gp
```
gp env AWS_ACCESS_KEY_ID='AKIAIOSFODNN7EXAMPLE'
gp env AWS_SECRET_ACCESS_KEY='wJalrXUtnFEMI/K7MDENG/bPxRfiCYEXAMPLEKEY'
gp env  AWS_DEFAULT_REGION='us-west-2'
```


## Terraform - AWS CLI
#### Environment variables to configure the AWS CLI
https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-envvars.html
## Terraform Registry Provider
https://registry.terraform.io/browse/providers
## Terraform Output
https://developer.hashicorp.com/terraform/language/values/outputs
### Random Provider
https://registry.terraform.io/providers/hashicorp/random/latest/docs
#### Random String
https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/string
```sh
terraform validate
terraform init
terraform plan
terraform apply
```
- For yes prompt / automatically approve
```sh
terraform apply --auto-approve
```

# 6 Terraform AWS Provider
## Terraform AWS Provider - AWS S3 Bucket
https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket
## After add aws provider
```sh
terraform init -upgrade
```
## AWS Bucket Naming Rules
https://docs.aws.amazon.com/AmazonS3/latest/userguide/bucketnamingrules.html

# 7 Terraform Cloud
## Terraform Backend Remote
https://developer.hashicorp.com/terraform/language/settings/backends/remote
## Migrate local terraform state to cloud
https://developer.hashicorp.com/terraform/tutorials/cloud/cloud-migrate
## Create Token
https://app.terraform.io/app/settings/tokens?source=terraform-login
```sh
terraform login
```
```sh
touch /home/gitpod/.terraform.d/credentials.tfrc.json
```
```sh
open  /home/gitpod/.terraform.d/credentials.tfrc.json
```
```sh
terraform init
```

# 8 Create generate_tfrc_credentials.sh
[`./bin/generate_tfrc_credentials.sh`](./bin/generate_tfrc_credentials.sh)

## Commands
```sh
gp env TERRAFORM_CLOUD_TOKEN='xxx'
export TERRAFORM_CLOUD_TOKEN='xxx'
./bin/generate_tfrc_credentials.sh
terraform init
```

# 9  Create alias in ~/.bash_profile
