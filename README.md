
### About Shoreline
The Shoreline platform provides real-time monitoring, alerting, and incident automation for cloud operations. Use Shoreline to detect, debug, and automate repairs across your entire fleet in seconds with just a few lines of code.

Shoreline Agents are efficient and non-intrusive processes running in the background of all your monitored hosts. Agents act as the secure link between Shoreline and your environment's Resources, providing real-time monitoring and metric collection across your fleet. Agents can execute actions on your behalf -- everything from simple Linux commands to full remediation playbooks -- running simultaneously across all the targeted Resources.

Since Agents are distributed throughout your fleet and monitor your Resources in real time, when an issue occurs Shoreline automatically alerts your team before your operators notice something is wrong. Plus, when you're ready for it, Shoreline can automatically resolve these issues using Alarms, Actions, Bots, and other Shoreline tools that you configure. These objects work in tandem to monitor your fleet and dispatch the appropriate response if something goes wrong -- you can even receive notifications via the fully-customizable Slack integration.

Shoreline Notebooks let you convert your static runbooks into interactive, annotated, sharable web-based documents. Through a combination of Markdown-based notes and Shoreline's expressive Op language, you have one-click access to real-time, per-second debug data and powerful, fleetwide repair commands.

### What are Shoreline Op Packs?
Shoreline Op Packs are open-source collections of Terraform configurations and supporting scripts that use the Shoreline Terraform Provider and the Shoreline Platform to create turnkey incident automations for common operational issues. Each Op Pack comes with smart defaults and works out of the box with minimal setup, while also providing you and your team with the flexibility to customize, automate, codify, and commit your own Op Pack configurations.

# Container Absent Incident
---

When a container that should be running is not present or has suddenly ceased, it is referred to as a "container absent" issue in a containerized environment like Kubernetes or Docker. This may result in unexpected behavior, application unavailability, or service interruptions. Common causes include container crashes due to errors, resource constraints, dependencies failures, misconfigurations in deployment files, image pull failures, health check issues, and manual terminations.

### Parameters
```shell
export IP_ADDRESS="PLACEHOLDER"

export CONTAINER_NAME="PLACEHOLDER"

export SERVICE_NAME="PLACEHOLDER"
```

## Debug

### 1. Check if the instance is reachable
```shell
ping ${IP_ADDRESS}
```

### 2. Check the status of the container
```shell
docker ps -a | grep ${CONTAINER_NAME}
```

### 3. Check the logs of the container to see if there are any errors or issues
```shell
docker logs ${CONTAINER_NAME}
```

### 4. Check the status of the service
```shell
systemctl status ${SERVICE_NAME}
```

### 5. Check the system logs for any relevant error messages
```shell
journalctl -u ${SERVICE_NAME}
```

### 7. Check the CPU and memory usage of the container
```shell
docker stats ${CONTAINER_NAME}
```

### 8. Check the container's configuration and environment variables
```shell
docker inspect ${CONTAINER_NAME}
```

### 9. Check the status of the host machine's resources
```shell
top
```

## Repair

### Restart the containers: Try to restart the absent containers using the system's management tools or command-line interface. This can help bring them back online and restore their normal functioning.
```shell


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


```