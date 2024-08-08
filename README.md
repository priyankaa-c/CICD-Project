## CICD-Project 
### Task: Implement a CI/CD Pipeline with GitHub Actions for Automated Deployment and Rollback 
### Project structure 
#### step1: Github Repository Set-up: 
 
|---.github

|           |---workflows

|                      |---main.yml

|---app.py

|---Dockerfile

|---nginx.conf

|---requirements.txt

|---task-definition.json
#### Prerequisites

1. **AWS Account**:need an AWS account to deploy the application using ECS and ECR.
2. **GitHub Repository**:code should be hosted on GitHub.
3. **Docker**:Install Docker and configured on your local machine.

### Setup

•	/.github/workflows/main.yml – YAML file contains the job workflows

•	/app.py – file contains basic web app python code (flask framework)

•	/Dockerfile – file contains instructions to build and run Nginx server.

•	/nginx.conf – Nginix configuration file

•	/task-definition.json – defines the configuration for containers in a task

Created a github repository that contains the aforementioned files. 
#### Step 2: created a public Elastic Container Registry repository using AWS console. 
Public ECR URI: public.ecr.aws/i5u9n7k9/nginix-web-app

#### Step 3: Set up an ECS create cluster and service on AWS console, and created task definition file. 

#### Step 4: Added credentials to the GitHub secrets: 
AWS_ACCESS_KEY_ID
AWS_SECRET_ACCESS_KEY
ECR_REPOSITORY_URI

### Usage 

#### Building and Pushing Docker Images 

The GitHub Actions workflow will automatically build and push Docker images to your ECR repository when push changes to the `main` branch.

#### Deploying to ECS

The workflow deploys the Docker image to your ECS service and forces a new deployment with the updated image.

#### Running Integration Tests

After deployment, the workflow runs integration tests to ensure that the application is working as expected. If the tests fail, the workflow performs a rollback to the previous task definition.


