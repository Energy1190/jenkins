FROM jenkins:2.60.1

USER root
RUN apt-get update -y && apt-get install -y make patch gcc openssl build-essential libssl-dev libbz2-dev \
    libreadline5 zlib1g-dev libsqlite3-dev && rm -rf /var/lib/apt/lists/*
USER jenkins
