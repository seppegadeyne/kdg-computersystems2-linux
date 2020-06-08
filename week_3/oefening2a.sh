gcloud compute instance-templates create test-template \
    --machine-type=n1-standard-1 \
    --image-project=ubuntu-os-cloud \
    --image-family=ubuntu-1804-lts \
    --tags=http-server,https-server \
    --metadata=startup-script="#!/bin/bash
        sudo apt-get update
        sudo apt-get --assume-yes install apache2"

gcloud compute instance-groups managed create test-group \
    --zone=europe-west1-b \
    --template=test-template \
    --size=3