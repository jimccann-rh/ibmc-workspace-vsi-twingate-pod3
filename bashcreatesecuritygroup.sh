#!/bin/bash

SGNAME="tg"

TGID=$(ibmcloud sl securitygroup list --output json |jq '.[] | select(.name == "'"$SGNAME"'" ) | .id')

# Check if the value is blank
if [[ -z "$TGID" ]]; then
  echo "Value is null, creating security group."
  ibmcloud sl securitygroup create --name $SGNAME
  TGID=$(ibmcloud sl securitygroup list --output json |jq '.[] | select(.name == "'"$SGNAME"'" | .id')
else
  echo "Value is not null, proceeding..."
  # Put your script logic here that requires the value
  echo $TGID
fi



# Define an array to store the IP addresses
ip_addresses=(
  "169.45.235.176/28"
  "150.238.230.128/27"
  "169.55.82.128/27"
  "169.60.115.32/27"
  "169.63.150.144/28"
  "169.62.1.224/28"
  "169.62.53.64/27"
  "169.63.254.64/28"
  "169.47.104.160/28"
  "169.61.191.64/27"
  "169.60.172.144/28"
  "169.62.204.32/27"
)

# Loop through each IP address and print it
for ip in "${ip_addresses[@]}"; do
  echo "$ip"
  ibmcloud sl securitygroup rule-add $TGID --direction ingress --protocol tcp --port-min 22 --port-max 22 --remote-ip $ip

done

ibmcloud sl securitygroup rule-add $TGID --direction egress --remote-ip  0.0.0.0/0
ibmcloud sl securitygroup rule-add $TGID --direction egress --ether-type IPv6 --remote-ip ::/0
