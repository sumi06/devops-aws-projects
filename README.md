# 🚀 DevOps AWS Project Repository

This repository demonstrates a real-world DevOps pipeline leveraging AWS cloud infrastructure. It automates the build, test, and deployment of a sample application using tools like Jenkins, GitHub, SonarQube, Nexus, and Terraform, with infrastructure hosted on AWS EC2 and EKS.

## 📁 Project Structure

```bash
.
├── terraform/           # Infrastructure as Code scripts for AWS resources
├── jenkins/             # Jenkins pipeline scripts and jobs
├── helm/                # Helm charts for Kubernetes app deployment
├── kubernetes/          # K8s manifests for deployment, service, ingress
├── ansible/             # Playbooks for EC2 configuration (if used)
├── scripts/             # Helper scripts (e.g., init, cleanup)
└── README.md
```

🧩 Tech Stack
Cloud: AWS (EC2, EKS, S3, IAM, VPC)

CI/CD: Jenkins, GitHub Actions

Containerization: Docker, Kubernetes

Monitoring: Prometheus, Grafana, CloudWatch

Code Quality: SonarQube

Artifact Management: Nexus Repository

IaC: Terraform, Ansible

Others: Slack (notifications), Helm, Git

📌 Features
CI/CD pipeline using Jenkins and GitHub

Static code analysis with SonarQube

Dockerized applications deployed to EKS

Infrastructure provisioned using Terraform

Slack alerts for build status

Version-controlled pipeline configurations

Secrets managed securely (demo uses base64, production should use AWS KMS or Sealed Secrets)

🙌 Author
Mohanasundram Sumangaly
Cloud Engineer | Devops enthusiast
