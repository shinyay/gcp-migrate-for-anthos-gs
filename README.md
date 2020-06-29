# Migrate VM to Contaier with Migrate for Anthos Getting Started

[Migrate for Anthos](https://cloud.devsite.corp.google.com/migrate/anthos/docs) allows you to generate a Container from Virtual Machine.

## Description

## Demo

### 0. Prepare Sample VM
![marketplace-tomcat](images/marketplace-tomcat.png)

### 1. Create a processing cluster

- [gke-cluster-create.fish](script/gke-cluster-create.fish)

```
$ gcloud container clusters create migration-processing \
    --num-nodes 1 \
    --scopes "cloud-platform" \
    --project (gcloud config get-value project) \
    --zone us-central1-a \
    --machine-type n1-standard-4 \
    --image-type ubuntu \
    --enable-stackdriver-kubernetes

$ gcloud container clusters get-credentials migration-processing \
    --zone us-central1-a \
    --project (gcloud config get-value project)
```

### 2. Install Migrate for Anthos on Processing Cluster
```
$ migctl setup install
```

```
$ migctl doctor
[✓] Deployment
```

### 3. Specify the migration source

- [migctl-source-create.sh](script/migctl-source-create.sh)

```
$ migctl source create ce vm-source --project $(gcloud config get-value project) --zone <ZONE>
```

Available Commands:
- aws          
  - add AWS Source cloud configuration to the processing cluster
- azure        
  - add Azure Source cloud configuration to the processing cluster
- ce          
  - add Compute Engine Source cloud configuration to the processing cluster
- vmware       
  - add VMware Source cloud configuration to the processing cluster

```
$ migctl source list

NAME            TYPE            DEFAULT-PROJECT                 DEFAULT-ZONE    CLOUD-DETAILS   CLOUD-EXTENSION MANAGER-ADDRESS
vm-source       Compute Engine  *************************       us-central1-a   N/A             N/A             N/A
```

#### 4. Create Migration Plan

```
$ migctl migration create <MIGRATION_NAME> \
  --source vm-source \
  --vm-id <TARGET_VM_INSTANCE_NAME> --intent Image
```

## Features

- feature:1
- feature:2

## Requirement

## Usage

## Installation

## Licence

Released under the [MIT license](https://gist.githubusercontent.com/shinyay/56e54ee4c0e22db8211e05e70a63247e/raw/34c6fdd50d54aa8e23560c296424aeb61599aa71/LICENSE)

## Author

[shinyay](https://github.com/shinyay)
