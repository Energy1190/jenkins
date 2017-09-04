FROM jenkins:2.60.1

USER root

RUN apt-get update -y && apt-get install -y make patch gcc build-essential python3 python-pip && rm -rf /var/lib/apt/lists/*

USER jenkins
