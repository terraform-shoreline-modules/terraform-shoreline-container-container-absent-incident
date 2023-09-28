

#!/bin/bash



# Replace ${CONTAINER_NAME} with the name of the container that needs to be restarted

CONTAINER_NAME="${CONTAINER_NAME}"



# Get the container ID of the specified container

CONTAINER_ID=$(docker ps -q -f name=$CONTAINER_NAME)



# Check if the container is already running

if [ ! -z "$CONTAINER_ID" ]; then

  echo "Container $CONTAINER_NAME is already running."

else

  # Start the container

  docker start $CONTAINER_NAME

  echo "Container $CONTAINER_NAME has been restarted."

fi