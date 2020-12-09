# ---------------------------------------------------------------------------------------------------------------------
# OPTIONAL PARAMETERS
# These parameters have reasonable defaults.
# ---------------------------------------------------------------------------------------------------------------------

variable "key_name" {
  description = "The name for the key pair."
  type        = string
  default     = null
}

variable "key_name_prefix" {
  description = "Creates a unique name beginning with the specified prefix. Conflicts with key_name."
  type        = string
  default     = null
}

variable "tags" {
  description = "A map of tags to add to key pair resource."
  type        = map(string)
  default     = {}
}