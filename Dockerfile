FROM jenkins:2.60.1

USER root

RUN apt-get update -y && apt-get install -y make patch gcc build-essential python3 python3-pip curl && rm -rf /var/lib/apt/lists/*

RUN pip3 install jinja2 boto docker

ADD run_sock.sh /run_sock.sh
RUN chmod +x /run_sock.sh && nohup /run_sock.sh &

USER jenkins

