FROM jenkins:2.60.1

USER root

RUN apt-get update -y && apt-get install -y make patch gcc build-essential python3 python3-pip curl && rm -rf /var/lib/apt/lists/*

RUN pip3 install jinja2 boto
RUN curl -sSL https://get.docker.com/ | sh
RUN usermod -aG docker jenkins

ADD run.sh /run.sh
RUN chmod +x /run.sh
RUN /run.sh

USER jenkins
