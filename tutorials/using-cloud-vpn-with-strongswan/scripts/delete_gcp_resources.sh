#!/bin/bash
set -x

. env-concrete.sh

# Delete cloud router
gcloud compute routers delete --quiet ${ROUTER_NAME}

# Delete firewall rule which allows ipsec-related protocols and ports
gcloud compute firewall-rules delete --quiet ${FIREWALL_PFX}-allow-ipsec

# Delete the network to which we establish connection
gcloud compute networks delete --quiet ${NETWORK_NAME}

set +x
