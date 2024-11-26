FROM openjdk:17-jdk-slim

# Environment variables for customization
ENV SWARM_VERSION=3.48
ENV SWARM_CLIENT_JAR=/usr/share/jenkins/swarm-client.jar

# Download Swarm Client JAR
RUN apt-get update && apt-get install -y curl && apt-get clean \
  && mkdir -p /usr/share/jenkins \
  && curl -L -o ${SWARM_CLIENT_JAR} https://repo.jenkins-ci.org/releases/org/jenkins-ci/plugins/swarm-client/${SWARM_VERSION}/swarm-client-${SWARM_VERSION}.jar \
  && chmod +x ${SWARM_CLIENT_JAR}

# Set working directory
WORKDIR /usr/share/jenkins

# Use entrypoint script
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# Default entrypoint
ENTRYPOINT ["/entrypoint.sh"]
