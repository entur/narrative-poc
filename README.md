> [!WARNING]
>
> # Work in progress
>
> Please dont use as reference yet

# Getting Started

Hello and welcome!

## Introduction

`getting-started` showcases a minimal best-practice setup for running an application on the Entur developer platform.

> [!TIP]
>
> Use this repository as a reference.
> Adopt names and placeholders to your specific application.
> Follow the steps in the accompanying chapter in the DevOps Handbook.
> Good luck!

## Repository structure

Your Golden Path repository will have this structure. When following this structure, you will reap the benefits later. We promise!

```sh
.
├── Dockerfile                   # Create a runnable container using a Dockerfile
├── README.md                    # Please explain what your repository achieves and why
├── CONTRIBUTING.md              # Instructions for how to get up and running, and how to contribute
├── .github                      # Configuration and resources for GitHub
│   ├── dependabot.yml           # Dependabot configuration for keeping dependencies up to date
│   └── workflows                # Your workflows for CI and CD
│       └── ci.yml               # Starter Workflow for simple CI, search DevOps Handbook for `Starter Workflows`
├── helm                         # We use `helm` as a templating engine for kubernetes specs
│   └── getting-started          # The name of your chart, same as repository for Golden Path
│       ├── Chart.lock           # Version pinning of chart dependencies
│       ├── Chart.yaml           # Top level specification, and a list of versioned dependencies
│       ├── env                  # Environment specific configuration
│       │   ├── values-kub-ent-dev.yaml   # Value overrides for dev
│       │   └── values-kub-ent-tst.yaml   # Value overrides for tst
│       │   ├── values-kub-ent-prd.yaml   # Value overrides for prd
│       └── values.yaml          # General values for your application
├── src                          # Place your application somewhere, typically in `src` folder
└── terraform                    # Infrastructure as Code, prescribe your infrastructure requirements
    ├── backend.tf               # Where is your state stored?
    ├── env                      # Environment specific configuration
    │   ├── kub-ent-dev.tfvars   # Variable definitions for dev
    │   └── kub-ent-tst.tfvars   # Variable definitions for tst
    │   ├── kub-ent-prd.tfvars   # Variable definitions for prd
    ├── main.tf                  # Prescribe your infrastructure here (can be split up into multiple .tf files)
    ├── variables.tf             # Declare your variables here
    └── versions.tf              # Pin down required versions here
```

## Highlights

* Templated Kubernetes specifications with [Helm](https://helm.sh/) and our [Common Chart](https://github.com/entur/helm-charts/tree/main/charts/common)
* Infrastructure as Code (IaC) with [Terraform](https://www.terraform.io/)

## Recommendations

* Agree on a formatter and a linter for your source files
* Use [Conventional Commits](https://www.conventionalcommits.org/en/v1.0.0/)
* Use [Semantic Versioning](https://semver.org/)

## Hands on steps

While we encourage you to follow the guides in the DevOps Handbook, we understand that you may just want to get your hands dirty.
Here's a quick summary of what you should do if you want to adopt this repository for you new application named `amazing-app`:

* Rename the helm chart at `/helm/getting-started` with `mv helm/getting-started helm/amazing-app`
* Edit the chart files to fit your application, further examples can be found [here](https://github.com/entur/helm-charts/tree/main/examples/common)
* Edit the terraform configuration, at least [backend.tf](./terraform/backend.tf) and [main.tf](./terraform/main.tf)
