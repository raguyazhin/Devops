# Install Terraform on AWS EC2

```sh
#Get the latest release version.
TERRAFORM_VER=`curl -s https://api.github.com/repos/hashicorp/terraform/releases/latest |  grep tag_name | cut -d: -f2 | tr -d \"\,\v | awk '{$1=$1};1'

#To download the latest release of Terraform
wget https://releases.hashicorp.com/terraform/${TERRAFORM_VER}/terraform_${TERRAFORM_VER}_linux_amd64.zip

#Extract the file.
sudo yum -y install unzip
unzip terraform_${TERRAFORM_VER}_linux_amd64.zip

#Move binary file to the /usr/local/bin directory
sudo mv terraform /usr/local/bin/

#Check the terraform version
terraform version

#Enable tab completion
terraform -install-autocomplete
source ~/.bashrc

```

### References

https://techviewleo.com/install-terraform-on-amazon-linux/