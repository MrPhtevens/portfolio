variable "machine_learning_compute_cluster_name" {
  type        = string
  description = "Name of the compute cluster"
}

variable "location" {
  type        = string
  description = "Azure region"
}

variable "machine_learning_workspace_id" {
  type        = string
  description = "ID of the Machine Learning workspace"
}

variable "vm_size" {
  type        = string
  description = "Size of the virtual machines in the cluster"
}

variable "vm_priority" {
  type        = string
  description = "VM priority: 'Dedicated' or 'LowPriority'"
}

variable "min_node_count" {
  type        = number
  description = "Minimum number of nodes"
}

variable "max_node_count" {
  type        = number
  description = "Maximum number of nodes"
}

variable "scale_down_nodes_after_idle_duration" {
  type        = string
  description = "Idle time before scaling down (ISO 8601 format, e.g. PT30S | PT5M | PT2M)"
}

variable "tags" {
  type        = map(string)
  description = "Tags to assign to the compute cluster"
}
