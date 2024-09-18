##
# (c) 2024 - Cloud Ops Works LLC - https://cloudops.works/
#            On GitHub: https://github.com/cloudopsworks
#            Distributed Under Apache v2.0 License
#

locals {
  repos = merge({
    for repo in var.repositories : repo.name => repo
    if try(repo.name, "") != ""
    },
    {
      for repo in var.repositories : format("%s-%s", repo.prefix_name, local.system_name) => repo
      if try(repo.prefix_name, "") != ""
  })
}

resource "github_repository" "repo" {
  for_each    = local.repos
  name        = each.key
  description = try(each.value.description, "")
  visibility  = try(each.value.public, false) ? "public" : "private"
  archive_on_destroy = true

  template {
    owner                = "cloudopsworks"
    repository           = "${each.value.template}-app-template"
    include_all_branches = try(each.value.include_all_branches, false)
  }
}