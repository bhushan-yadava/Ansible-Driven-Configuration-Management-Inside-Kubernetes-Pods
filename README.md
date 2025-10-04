🛠️ Ansible-Driven Configuration Management Inside Kubernetes Pods

📌 Project Overview

This project demonstrates how to run Ansible inside Kubernetes Pods to configure and manage application containers running within the same cluster.

Unlike traditional Ansible setups that run from external servers, here we containerize Ansible and deploy it directly into Kubernetes, making automation cluster-native.


🎯 Objectives

Install Ansible manually inside Kubernetes Pods.

Use Ansible playbooks and inventory to configure applications running in other pods.

Demonstrate Infrastructure as Code (IaC) practices inside a Kubernetes environment.

Showcase real-world DevOps skills: containerization, automation, and orchestration.


---
📂 Repository Structure
ansible-in-kubernetes/
│── Dockerfile                  # Custom Ansible image
│── ansible/
│   ├── ansible.cfg             # Ansible configuration
│   ├── hosts                   # Inventory for pods/services
│   └── playbook.yml            # Example Ansible playbook
│── k8s/
│   ├── ansible-pod.yaml        # Pod spec to run Ansible
│   └── ansible-configmap.yaml  # ConfigMap with playbooks/inventory
│── .vscode/
│   ├── launch.json             # Debugging config (optional)
│   └── settings.json           # Project settings
│── README.md                   # Documentation

---


🛠️ Prerequisites

Before starting, ensure you have:

A Kubernetes cluster (created with kubeadm, Minikube, or cloud provider).

Docker installed and configured.

kubectl CLI access.

A DockerHub account (or private registry) to push the Ansible image.



🚀 Setup Instructions
1️⃣ Build and Push Ansible Docker Image
# Build image
docker build -t <your-dockerhub-username>/ansible-pod:latest .

# Push to DockerHub
docker push <your-dockerhub-username>/ansible-pod:latest

2️⃣ Apply Kubernetes Configurations
Create ConfigMap with Ansible Playbooks and Inventory
kubectl apply -f k8s/ansible-configmap.yaml

Deploy Ansible Pod in the Cluster
kubectl apply -f k8s/ansible-pod.yaml

3️⃣ Verify Pod Status
kubectl get pods

4️⃣ Run Ansible Inside Pod
Option 1: Automatic Execution (entrypoint)

The pod runs the playbook automatically at startup using the ENTRYPOINT defined in the Dockerfile.

Option 2: Manual Execution

Exec into the pod and run playbooks manually:

kubectl exec -it ansible-pod -- bash
ansible-playbook playbook.yml -i hosts

5️⃣ Validate Configuration

Check if Nginx (or your configured service) is installed and running in target pods:

kubectl exec -it <target-pod> -- nginx -v



✅ Expected Output

Ansible Pod runs successfully inside Kubernetes.

Playbook installs and configures Nginx (or other apps) inside containers.

Demonstrates automation of workloads within Kubernetes.



📌 Key Learnings

Embedding Ansible into Kubernetes for cluster-native automation.

Using ConfigMaps to manage playbooks and inventory files.

Running automation tasks inside pods rather than external servers.

Applying Infrastructure as Code (IaC) within cloud-native systems.



🌍 Real-World Use Cases

Automating software configuration inside application pods.

Enforcing consistent environments across containers.

Managing microservices configuration post-deployment.

Building a DevOps portfolio project to showcase Kubernetes + Ansible skills.



🚀 Next Steps (Optional Enhancements)

Integrate with Jenkins for automated playbook execution.

Add Role-based Ansible playbooks for modular management.

Use Secrets for secure credentials inside Ansible pod.

Expand playbooks to manage multiple microservices.
