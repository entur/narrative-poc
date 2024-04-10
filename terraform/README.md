# How to locally test terraform

## Prerequisites

Use [asdf](https://asdf-vm.com/) as a way to stay in sync with the terraform version your CI/CD uses. Terraform may complain if you use a newer version locally.

```bash
asdf plugin-add terraform https://github.com/asdf-community/asdf-hashicorp.git
asdf plugin-add terraform-ls https://github.com/asdf-community/asdf-hashicorp.git
```

Then you can

```bash
asdf install
```

Congratulations! You are ready to go!

## Steps

### Make sure you are logged in with gcloud and select correct project

```bash
gcloud auth application-default login
gcloud config set project $MY_PROJECT_ID
```

### Create and set the Kubernetes kube config file in the environment variables

This example connects to the dev k8s cluster in the ent-kub-dev project.
You should check if your `gcloud` is up to date, and your components.

```bash
gcloud components update
gcloud components install kubectl
```

```bash
gcloud container clusters get-credentials "kub-ent-dev-001" --region europe-west1 --project ent-kub-dev
# If you get weird messages about localhost, you may need to export your KUBE_CONFIG_PATH
# export KUBE_CONFIG_PATH="~/.kube/config"
```

### Run terraform init

```bash
terraform init
```

### Switch to the correct workspace or create it if it does not exist

```bash
terraform workspace select kub-ent-dev
# terraform workspace new kub-ent-dev
```

### Run plan

```bash
terraform plan -var-file=env/kub-ent-dev-tfvars
```
