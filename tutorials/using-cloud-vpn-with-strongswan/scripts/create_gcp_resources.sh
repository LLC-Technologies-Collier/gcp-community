#!/bin/bash

. env-concrete.sh

set -x

# Create the network to which we will establish connection
gcloud compute networks create ${NETWORK_NAME} \
  --project=${PROJECT_ID} \
  --description='subnet for use in updating documentation for strongswan vpns'\
  --subnet-mode=auto \
  --mtu=8896 \
  --bgp-routing-mode=global

# Create firewall rule to allow ipsec-related protocols and ports
gcloud compute firewall-rules create ${FIREWALL_PFX}-allow-ipsec \
  --network ${NETWORK_NAME} \
  --allow udp:500,udp:4500,esp

# Create a cloud router
gcloud compute routers create ${ROUTER_NAME} \
  --project=${PROJECT_ID} \
  --network=${NETWORK} \
  --region=${REGION}

set +x
