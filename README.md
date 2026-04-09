# DevOps Capstone Project

A production-grade DevOps platform built from scratch demonstrating end-to-end automation.

## Architecture
Developer pushes code -> GitHub Actions CI/CD Pipeline -> Test → Build → Push → Deploy -> DockerHub (Image Registry) -> Kubernetes Cluster (minikube) -> 2 replicas, auto-healing, rolling updates -> Flask Application -> /health, /metrics-test endpoints -> Prometheus + Grafana -> Real-time monitoring + alerts

## Tech Stack

| Layer | Technology |
|---|---|
| Application | Python Flask |
| Containerization | Docker |
| Orchestration | Kubernetes |
| CI/CD | GitHub Actions |
| Infrastructure | Terraform (AWS) |
| Monitoring | Prometheus + Grafana |
| Registry | DockerHub |

## Features

- **Auto-healing**: ReplicaSet maintains desired pod count
- **Zero-downtime deploys**: Rolling updates with readiness probes
- **GitOps-ready**: Every commit triggers full pipeline
- **IaC**: AWS infrastructure provisioned with Terraform modules
- **Observability**: Live metrics, dashboards and alerts
- **Config management**: ConfigMaps for environment config

## Project Structure
devops-capstone/
├── app/                    # Flask application
│   ├── app.py
│   ├── requirements.txt
│   └── Dockerfile
├── k8s/                    # Kubernetes manifests
│   ├── deployment.yaml     # With liveness/readiness probes
│   ├── service.yaml
│   └── configmap.yaml
├── terraform/              # AWS Infrastructure as Code
│   ├── main.tf
│   ├── variables.tf
│   └── modules/
│       ├── vpc/
│       └── ec2/
└── .github/workflows/
└── ci-cd.yaml          # Full CI/CD pipeline

## CI/CD Pipeline
git push → test (9s) → build+push (20s) → deploy (19s) → LIVE

1. **Test**: Python dependencies installed, tests run
2. **Build**: Docker image built and tagged with commit SHA
3. **Push**: Image pushed to DockerHub with versioning
4. **Deploy**: Self-hosted runner deploys to Kubernetes

## Quick Start

```bash
# Clone
git clone https://github.com/alok2502/devops-capstone.git

# Deploy infrastructure
cd terraform && terraform init && terraform apply

# Deploy app
kubectl apply -f k8s/

# Verify
kubectl get pods
curl http://<node-ip>:<nodeport>/health
```

## API Endpoints

| Endpoint | Description |
|---|---|
| `GET /` | App info with version and environment |
| `GET /health` | Health check (used by k8s probes) |
| `GET /metrics-test` | Monitoring status |

## Monitoring

Prometheus + Grafana deployed via Helm:
- CPU/Memory dashboards
- Pod health tracking  
- Custom alert: fires when memory < 500MB

## Author

Alok Kumar — DevOps Engineer
- GitHub: github.com/alok2502
- LinkedIn: linkedin.com/in/alok2502
