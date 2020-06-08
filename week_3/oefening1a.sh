# Hoeveel RedHat VM images zijn er standaard beschikbaar?

# Hoeveel regions zijn er in Europa?
gcloud compute regions list | grep "europe" | wc -l

# Hoeveel zones zijn er in region europe-north1?
gcloud compute zones list --filter="europe-north1" | wc -l

# Wat machine type heeft het meeste RAM in zone europe-west1-b?
gcloud compute machine-types list --sort-by MEMORY_GB | tail -n-1
