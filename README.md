# B-Safe - CI/CD Pipeline Project

## 1. Project Title

B-Safe - CI/CD Pipeline to Convert Legacy Development Process to DevOps Process

---

## 2. Project Description

B-Safe is a Course-End Project that demonstrates the implementation of a CI/CD pipeline using AWS EC2, Jenkins, Docker and Git.

The objective of this project is to automate application testing, Docker image creation, Docker image publishing and application deployment.

The project demonstrates how a traditional application delivery process can be converted into an automated DevOps workflow.

---

## 3. Problem Statement

A leading healthcare organization followed a long release cycle which affected business agility.

The objective is to improve the software delivery process through:

- Continuous Integration
- Automated Testing
- Containerization
- Continuous Deployment
- Faster Release Cycles
- Improved Application Availability

---

## 4. Tools Used

- AWS EC2
- Jenkins
- Docker
- Git
- GitHub
- Docker Hub
- Nginx
- Linux/Ubuntu

---

## 5. Project Architecture

GitHub
   |
   v
Jenkins
   |
   +---- Automated Tests
   |
   +---- Docker Build
   |
   +---- Docker Hub
   |
   +---- Docker Deployment
   |
   v
AWS EC2
   |
   v
B-Safe Application

---

## 6. Repository Structure

```text
b-safe-app/
|
├── index.html
├── Dockerfile
├── Jenkinsfile
├── README.md
├── .dockerignore
|
└── test/
    └── test.sh
