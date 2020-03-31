output "id" {
  description = "A unique ID that can be used to identify and reference a Kubernetes cluster"
  value       = google_container_cluster.this.id
}

output "endpoint" {
  description = "The base URL of the API server on the Kubernetes master node"
  value       = google_container_cluster.this.endpoint
}

output "kube_config" {
  description = "The full contents of the Kubernetes cluster's kubeconfig file"
  value       = local_file.kubeconfiggke.filename
}

output "cluster_ca_cert" {
  description = "The base64 encoded public certificate for the cluster's certificate authority"
  value       = google_container_cluster.this.master_auth.0.cluster_ca_certificate
}

output "cluster_client_key" {
  description = "The base64 encoded private key used by clients to access the cluster"
  value       = google_container_cluster.this.master_auth.0.client_key
}

output "cluster_client_certificate" {
  description = "The base64 encoded public certificate used by clients to access the cluster"
  value       = google_container_cluster.this.master_auth.0.client_certificate
}
