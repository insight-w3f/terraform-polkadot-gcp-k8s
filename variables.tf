########
# Label
########
variable "environment" {
  description = "The environment"
  type        = string
  default     = ""
}

variable "namespace" {
  description = "The namespace to deploy into"
  type        = string
  default     = ""
}

variable "stage" {
  description = "The stage of the deployment"
  type        = string
  default     = ""
}

variable "network_name" {
  description = "The network name, ie kusama / mainnet"
  type        = string
  default     = ""
}

variable "owner" {
  description = "Owner of the infrastructure"
  type        = string
  default     = ""
}

variable "zone" {
  description = "The GCP zone to deploy in"
  type        = string
  default     = "us-east1-b"
}

########
# GCP
########

variable "location" {
  description = "The GCP location to deploy in"
  type        = string
  default     = "us-east1"
}

########
# K8S
########

variable "cluster_name" {
  description = "Name of the k8s cluster"
  type        = string
  default     = "cluster"
}

variable "k8s_version" {
  description = "Version of k8s to use"
  type        = string
  default     = "1.15.11-gke.1"
}

variable "num_workers" {
  description = "Number of workers for worker pool"
  type        = number
  default     = 1
}

variable "worker_instance_type" {
  description = "Instance type for workers"
  type        = string
  default     = "n1-standard-1"
}

variable "cluster_autoscale" {
  description = "Do you want the cluster's worker pool to autoscale?"
  type        = bool
  default     = false
}

variable "cluster_autoscale_min_workers" {
  description = "Minimum number of workers in worker pool"
  type        = number
  default     = 1
}

variable "cluster_autoscale_max_workers" {
  description = "Maximum number of workers in worker pool"
  type        = number
  default     = 1
}

variable "vpc_id" {
  description = "Name or self-link of the GCE VPC to connect to cluster"
  type        = string
}

variable "subnet_id" {
  description = "Name or self-link of the GCE subnet to connect to cluster"
  type        = string
}
