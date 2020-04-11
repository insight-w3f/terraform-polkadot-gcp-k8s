output "endpoint" {
  description = "The base URL of the API server on the Kubernetes master node"
  value       = module.this.endpoint
}

output "cluster_ca_cert" {
  description = "The base64 encoded public certificate for the cluster's certificate authority"
  value       = module.this.ca_certificate
}
