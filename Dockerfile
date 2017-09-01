FROM jenkins:2.60.1

USER root
RUN apt-get update -y && apt-get install -y patch && rm -rf /var/lib/apt/lists/*
USER ${user}