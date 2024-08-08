## CICD-Project##
##Task: Implement a CI/CD Pipeline with GitHub Actions for Automated Deployment and Rollback##
###step1: Github Repository Set-up:
 
|---.github
|           |---workflows
|                      |---main.yml
|---app.py
|---Dockerfile
|---nginx.conf
|---requirements.txt
|---task-definition.json

•	/.github/workflows/main.yml – YAML file contains the job workflows
•	/app.py – file contains basic web app python code (flask framework)
•	/Dockerfile – file contains instructions to build and run Nginx server.
•	/nginx.conf – Nginix configuration file
•	/task-definition.json – defines the configuration for containers in a task
•	/README.md

Created a github repository that contains the aforementioned files. 
###Step 2: created a public Elastic Container Registry repository using AWS console. 
~~~Public ECR URI: public.ecr.aws/i5u9n7k9/nginix-web-app~~~

###Step 3: Set up an ECS create cluster and service on AWS console, and created task definition file.


###Step 4: Added credentials to the GitHub secrets:
~~~AWS_ACCESS_KEY_ID~~~
~~~AWS_SECRET_ACCESS_KEY~~~
~~~ECR_REPOSITORY_URI~~~
###Step 5: Once the environment setup is completed, commit and pushed the code to github repository.
~~~It will trigger the github workflow actions, below given are the snapshots of the jobs.~~~
