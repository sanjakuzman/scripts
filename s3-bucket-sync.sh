#!/bin/bash

# Sync buckets in same region
# $1 - Source S3 bucket  
# $2 - New (Destination) S3 bucket

source_bucket=$1
destination_bucket=$2

# STEP 1: Sync the source bucket with the created one 
aws s3 sync s3://${source_bucket} s3://${destination_bucket}

# STEP 2 Get the bucket policy and put the policy in policy.json file, which will be created localy and change the name of the source bucket with the new bucket
aws s3api get-bucket-policy --bucket ${source_bucket} --query Policy --output text > policy.json
sed -i -e "s/${source_bucket}/${destination_bucket}}/g" policy.json

#STEP 3 Put the policy in the new bucket
aws s3api put-bucket-policy --bucket ${destination_bucket} --policy file://policy.json 
