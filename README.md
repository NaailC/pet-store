# DevOps Final Group Project

## Table of Contents
- Brief
  - Scope 
  - Requirements
- Architecture
  - Application Architecture
  - Database Structure
  - CI/CD Pipeline
- Strategy
- Tech Stack
- Project Tracking
- Risk Assessment
- Front-End
- Cost Estimations
- Future Improvements

## Brief

The purpose of this project is to test how well we can apply the DevOps knowledge gained over the last 10 weeks to deploy a pre-developed application. Full freedom of choice on which tools to use has been given to all group members who must work together to meet the project deliverables by following an agile scrum framework.

### Scope

The scope of this project does not cover development of code as we will be working with externally developed applications:

- front-end: https://github.com/spring-petclinic/spring-petclinic-angular
- back-end: https://github.com/spring-petclinic/spring-petclinic-rest

Please find above the repositories for the well documented 'Spring Pet Clinic' application, one  of which serves as a front end client using AngularJS and the other as an API using Java.

### Requirements

The automation of the development workflows and the successful deployment of the applicaiton were the two main focuses on this project. There were no restrictions or requirements on which tools to use although, the reasons for use of each tool should be discussed in an end-of-project presentation accompanied by a demonstration of the workflows developed. 

## Architecture 

### Application Architecture

<img width="454" alt="app structure" src="https://user-images.githubusercontent.com/74771160/108360421-1941e680-71e9-11eb-8311-5da1d88311f2.PNG">

### Database Structure
Below is an ER diagram of the Petclinic app:
![petclinic-ermodel](https://user-images.githubusercontent.com/74771160/108348381-a2512180-71d9-11eb-926b-d410d99dc94e.png)


### CI/CD Pipeline

![CICDPIPELINE (2)](https://user-images.githubusercontent.com/74771160/108403413-9768b200-7216-11eb-9c38-77dd59e58d2c.png)

## Stategy 

  - There were 3 stages to our strategy for

  #### Stage 1 :
  - Agree on a tech stack that everyone on the team would be able to be productive on. 
  
      - the problem with having divided competancy accross the tech stack is that as a team , it would make us less agile. By using technologies that everyone had a level of competency on we could react faster and be more flexible with our time and hopfully avoid any production Bottlenecks that may occur. 


  #### Stage 2 : Sprint towards a minimum viable product
      

  #### Stage 3 : Expand on the Minimum viable product


## Tech Stack

Below are the tools chosen and their roles in this project: 

![TecStack (1)](https://user-images.githubusercontent.com/74771160/108371597-d20e2280-71f5-11eb-9b67-c854cba50f5f.png)


### Cloud Provider : Microsoft Azure

  - Azure was our cloud provider that we used for our development and deployment of this application 

### Version Control System : GIT

  -  Git is a popular version control system . useful for keeping track of a collective codebase

### Remote Repository : GITHUB

  - GitHub is a popular remote repository service . Allowing different developers to push to the same codebase 

### Containerisation : Docker / Docker-Compose 

  - Docker is a containerisation tool used to build Images from Dockerfiles
  - Docker- Compose is a container orchestration tool used to build and deploy containerised applications . In this project it was used to build and push the images required    for our application to the artifact repository

### CI/CD Pipeline : Jenkins Build Server 

- Jenkins was used as our build server , Every member of the team was familiar with how the jenkins pipeline works and how they are configured and deployed.

### Artifact Repository : DockerHub
- DockerHub is a repository for container images 
- DockerHub was our Artifact Repository of choice for this project

### Infrastucture Deployment : Terraform 

- Terraform is an opensource infrastructure as code tool it was used to provsion the infrastructure neccessary to run our application on Azure 

### Infrastructure Provisioning : Kubectl

- Kubectl is the kubernetes commandline tool used for provisioning kubernetes clusters. kubernetes is compatible with docker and as a result is able to pull images to provision our terraform infrastructure from dockerhub onto our clusters on Azure 


## Project Tracking

Azure Boards were used for project tracking. At the start of the project, an initial Sprint Planning meeting was held. A scrum master was chosen, and the product backlog was filled out with all the functionalities desired in the final product to be completed for the Sprint. Discussions held in this meeting also led to the finalisation on which tools should be used to develop workflows and carry out app deployment. 

Following the agile scrum framework, daily stand-ups held with the scrum team, orchestrated by the scrum master. In this way, every morning team members communicated to the team the work they had completed on the previous working day and any blockers experienced in the process. Issues encountered were listed on the board and systematically labeled as work to be done, doing or done - and moved along accordingly. 

<img width="800" alt="boards" src="https://user-images.githubusercontent.com/74771160/108357162-fa415580-71e4-11eb-9c3d-bf363f1f274f.PNG">

## Risk Assessment
A risk assessment was carried out, exploring possible risks, their likelihoods, and mitigations. A colour-coded risk matrix was used to illustrate the severity of risks. This can be seen documentated below:

<img width="800" alt="RS1" src="https://user-images.githubusercontent.com/74771160/108356329-ec3f0500-71e3-11eb-9db1-0b29bac5be21.PNG">
<img width="800" alt="RS2" src="https://user-images.githubusercontent.com/74771160/108356346-efd28c00-71e3-11eb-89ed-017c7448d0f5.PNG">

## Front-end

![MicrosoftTeams-image](https://user-images.githubusercontent.com/74771160/108401442-41930a80-7214-11eb-841a-f02441918fe2.png)

![MicrosoftTeams-image (1)](https://user-images.githubusercontent.com/74771160/108401451-435cce00-7214-11eb-999a-a685250b307c.png)

## Cost Estimations

A big part of this project was monitoring the monthly costs of the resources being utilized. During the planning stage of the project, we came up with a monthly budget for the overall resource costs. The main resources used include the Build Server, Development Server and MySQL Database Server. For the Build Server, we prioritised using a more enhanced virtual machine due to the workload of running and automating deployment of the application, among other variables such as software, containers and images. Additionally, we set up cost alerts within Azure to be notified in case our resources began to exceed the budget. This helped us plan for any potential increases to the running costs.

<img width="400" alt="cost estimation " src="https://user-images.githubusercontent.com/74771160/108382577-de4bad00-7200-11eb-98ad-794d989a37c1.PNG">


## Future Improvements 


