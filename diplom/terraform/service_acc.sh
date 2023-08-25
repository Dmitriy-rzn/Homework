#!/bin/bash

set -e

TF_IN_AUTOMATION=1 terraform init
TF_IN_AUTOMATION=1 terraform apply -auto-approve
bash generate_credentials.sh > cred

