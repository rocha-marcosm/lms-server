#!/bin/bash

UserName=$1

KeyId=$(aws iam list-ssh-public-keys --user-name "$UserName" --query "SSHPublicKeys[?Status == 'Active'].[SSHPublicKeyId]" --output text)

array=(
$KeyId
)

for i in "${array[@]}"

do

aws iam get-ssh-public-key --user-name "$UserName" --ssh-public-key-id $i --encoding SSH --query "SSHPublicKey.SSHPublicKeyBody" --output text

done
