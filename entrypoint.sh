#!/bin/sh

# Ensure required variables are set
if [ -z "$MASTER" ]; then
  echo "Error: MASTER environment variable is required."
  exit 1
fi
if [ -z "$USERNAME" ]; then
  echo "Error: USERNAME environment variable is required."
  exit 1
fi
if [ -z "$PASSWORD" ]; then
  echo "Error: PASSWORD environment variable is required."
  exit 1
fi

# Run the Swarm client with provided arguments
exec java -jar /usr/share/jenkins/swarm-client.jar \
  -url "${MASTER}" \
  -username "${USERNAME}" \
  -password "${PASSWORD}" \
  -name "${NAME:-swarm-agent}" \
  -labels "${LABELS:-docker swarm linux}" \
  -executors "${EXECUTORS:-2}"
