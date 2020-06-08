name="wordpress-$((RANDOM % 500))"

gcloud compute instances create-with-container ${name}-vm \
  --container-image=docker.io/wordpress \
  --machine-type=n1-standard-1 \
  --zone=europe-west1-b \
  --tags=http-server

ip_address=$(gcloud compute instances describe ${name}-vm --format='get(networkInterfaces[0].networkIP)')

gcloud sql instances create ${name}-sql \
  --tier=db-f1-micro \
  --zone=europe-west1-b \
  --authorized-networks=10.0.0.1/24 \
  --root-password=TMv4ABbB9a6uLsKL

