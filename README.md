# terraform-polkadot-gcp-k8s

[![open-issues](https://img.shields.io/github/issues-raw/insight-w3f/terraform-polkadot-gcp-k8s?style=for-the-badge)](https://github.com/insight-w3f/terraform-polkadot-gcp-k8s/issues)
[![open-pr](https://img.shields.io/github/issues-pr-raw/insight-w3f/terraform-polkadot-gcp-k8s?style=for-the-badge)](https://github.com/insight-w3f/terraform-polkadot-gcp-k8s/pulls)
[![build-status](https://img.shields.io/circleci/build/gh/insight-w3f/terraform-polkadot-gcp-k8s?style=for-the-badge)](https://circleci.com/gh/insight-w3f/terraform-polkadot-gcp-k8s)

## Features

This module...

## Terraform Versions

For Terraform v0.12.0+

## Usage

```
module "this" {
    source = "github.com/insight-w3f/terraform-polkadot-gcp-k8s"

}
```
## Examples

- [defaults](https://github.com/insight-w3f/terraform-polkadot-gcp-k8s/tree/master/examples/defaults)

## Known  Issues
No issue is creating limit on this module.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| google | n/a |
| local | n/a |
| template | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| cluster\_autoscale | Do you want the cluster's worker pool to autoscale? | `bool` | `true` | no |
| cluster\_autoscale\_max\_workers | Maximum number of workers in worker pool | `number` | `0` | no |
| cluster\_autoscale\_min\_workers | Minimum number of workers in worker pool | `number` | `0` | no |
| cluster\_name | Name of the k8s cluster | `string` | `"cluster"` | no |
| environment | The environment | `string` | `""` | no |
| kubernetes\_subnet | Subnet to connect cluster to | `any` | n/a | yes |
| namespace | The namespace to deploy into | `string` | `""` | no |
| network\_name | The network name, ie kusama / mainnet | `string` | `""` | no |
| num\_workers | Number of workers for worker pool | `number` | `1` | no |
| owner | Owner of the infrastructure | `string` | `""` | no |
| project | The GCP project | `string` | n/a | yes |
| region | The GCP region to deploy in | `string` | `"us-east1"` | no |
| stage | The stage of the deployment | `string` | `""` | no |
| vpc\_name | Name of the GCE VPC to connect to cluster | `string` | n/a | yes |
| worker\_instance\_type | Instance type for workers | `string` | `"n1-standard-1"` | no |

## Outputs

| Name | Description |
|------|-------------|
| cluster\_ca\_cert | The base64 encoded public certificate for the cluster's certificate authority |
| endpoint | The base URL of the API server on the Kubernetes master node |
| kube\_config | The full contents of the Kubernetes cluster's kubeconfig file |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Testing
This module has been packaged with terratest tests

To run them:

1. Install Go
2. Run `make test-init` from the root of this repo
3. Run `make test` again from root

## Authors

Module managed by [Richard Mah](https://github.com/shinyfoil)

## Credits

- [Anton Babenko](https://github.com/antonbabenko)

## License

Apache 2 Licensed. See LICENSE for full details.