FROM jenkins:2.60.1

USER root
RUN apt-get update -y && apt-get install -y patch gcc build-essential && rm -rf /var/lib/apt/lists/*
USER jenkins
