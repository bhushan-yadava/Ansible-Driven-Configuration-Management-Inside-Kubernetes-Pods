FROM python:3.9-slim

# Install Ansible and dependencies
RUN apt-get update && apt-get install -y \
    ansible sshpass openssh-client && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

WORKDIR /ansible
COPY ansible/ /ansible/

ENTRYPOINT ["ansible-playbook", "playbook.yml", "-i", "hosts"]
