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
  default_cicd_config = {
    access           = []
    contributors     = {}
    build            = {}
    sonarqube        = {}
    dependency_track = {}
    cd               = {}
  }
}

resource "github_repository" "repo" {
  for_each           = local.repos
  name               = each.key
  description        = try(each.value.description, "")
  visibility         = try(each.value.public, false) ? "public" : "private"
  archive_on_destroy = true

  template {
    owner                = "cloudopsworks"
    repository           = "${each.value.language}-app-template"
    include_all_branches = try(each.value.include_all_branches, false)
  }
}

resource "time_sleep" "repo" {
  for_each        = local.repos
  create_duration = "30s"

  depends_on = [
    github_repository.repo
  ]
}

resource "github_repository_file" "pipeline_config" {
  depends_on = [
    time_sleep.repo
  ]
  for_each            = local.repos
  repository          = github_repository.repo[each.key].name
  file                = ".github/cloudopsworks-ci.yaml"
  content             = templatefile("${path.module}/templates/${each.value.language}/cloudopsworks-ci.yaml.tftpl", merge(local.default_cicd_config, try(each.value.cicd_config, {})))
  commit_message      = "Initial CI/CD Configuration"
  overwrite_on_create = true
}