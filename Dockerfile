FROM jenkins:2.60.1

USER root
RUN apt-get update -y && apt-get install -y patch gcc openssl build-essential libssl-dev libbz2-dev \
    libreadline5 && rm -rf /var/lib/apt/lists/*
USER jenkins
