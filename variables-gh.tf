##
# (c) 2024 - Cloud Ops Works LLC - https://cloudops.works/
#            On GitHub: https://github.com/cloudopsworks
#            Distributed Under Apache v2.0 License
#

##
# Entries object (in YAML) :
# - name: REPO_NAME
#   #prefix_name: REPO_PREFIX_NAME (optional, name will be used if not provided)
#   description: REPO_DESCRIPTION
#   template: java | node | ruby | docker | go | kotlin | python
#   public: true | false
#   include_all_branches: true | false
#   cicd_config:
#     contributors:
#       admin:
#         - cloudopsworks/admin
#         - cloudopsworks-bot
#       triage: []
#       pull: []
#       push:
#         - cloudopsworks/engineering
#       maintain: []
#     reviewers:
#       - cloudopsworks/engineering
#       - cloudopsworks/devops
#       - cloudopsworks/security
#     owners:
#       - cloudopsworks/engineering
#       - cloudopsworks/devops
#     cd:
#       cloud: aws | azure | gcp
#       cloud_type: elasticbeanstalk | eks | lambda | aks | webapp | function | gke | function
variable "repositories" {
  description = "Repositories specification array"
  type        = any
  default     = []
}