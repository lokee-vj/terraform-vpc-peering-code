#!/usr/bin/env bash 

# Script to prepare the environment 

set -e

TERRAFORM_PLUGIN_DIR=/builds/cie/cie-iaac/example-terraform-ec2/plugins
TF_ZIP_FILE=terraform_1.2.0_linux_amd64.zip

# script can get the provider plugins from a local registry artifactory.healthcareit.net
#ARTIFACTORY_REPO_URL=https://artifactory.healthcareit.net/artifactory/cie-terraform/hashicorp-registry

if [ -d $TERRAFORM_PLUGIN_DIR ]; then
	cd $TERRAFORM_PLUGIN_DIR
	pwd
else
	mkdir $TERRAFORM_PLUGIN_DIR && cd $TERRAFORM_PLUGIN_DIR
	pwd
fi

echo "unzipping/installing terraform provider plugins..."
if [ ! -e terraform ]; then
	if [ -e $TF_ZIP_FILE ]; then
		unzip $TF_ZIP_FILE
	else
		echo "Terraform AWS Provider not found!"
		echo "FAIL"
		exit 1
	fi
else
	echo "terraform aws provider file already installed"
	echo "OK"
fi

echo "Terraform INSTALLED!"
# pip install -r ../requirements.txt
