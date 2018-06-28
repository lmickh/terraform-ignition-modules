variable "docker_opts" {
  default     = ""
  description = "String of options.  Consider using `--log-opt max-size=500m --log-opt max-file=3` to reduce log bloat"
  type        = "string"
}
