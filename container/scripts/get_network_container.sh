##Reguirments jq in linux 
#!/bin/bash

# Check if the container name or ID is provided
if [ -z "$1" ]; then
    echo "Usage: $0 <container_name_or_id>"
    exit 1
fi

# Get container name or ID from argument
CONTAINER_NAME_OR_ID=$1

# Get the container's network information in JSON format
NETWORK_INFO=$(docker inspect --format='{{json .NetworkSettings.Networks}}' $CONTAINER_NAME_OR_ID)

# Extract the IP address, gateway, and MAC address from the JSON data
IP_ADDRESS=$(echo $NETWORK_INFO | jq -r '.[].IPAddress')
GATEWAY=$(echo $NETWORK_INFO | jq -r '.[].Gateway')
MAC_ADDRESS=$(echo $NETWORK_INFO | jq -r '.[].MacAddress')

# Display the results
echo "Container: $CONTAINER_NAME_OR_ID"
echo "IP Address: $IP_ADDRESS"
echo "Gateway: $GATEWAY"
echo "MAC Address: $MAC_ADDRESS"
