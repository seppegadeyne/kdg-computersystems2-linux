gcloud compute instances create rocketchat \
  --machine-type=n1-standard-1 \
  --zone=europe-west1-b \
  --image-project=ubuntu-os-cloud \
  --image-family=ubuntu-1804-lts \
  --tags=chat \
  --metadata=startup-script="#!/bin/bash
    apt-get update
    snap install rocketchat-server"

# Login on server
# gcloud compute ssh rocketchat

# Check if you can access port 3000
# curl -v telnet://127.0.0.1:3000

# Open Firewall to the server
# gcloud compute firewall-rules create http3000 --allow=tcp:3000 --target-tags=chat


