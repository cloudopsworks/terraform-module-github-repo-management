##
# (c) 2024 - Cloud Ops Works LLC - https://cloudops.works/
#            On GitHub: https://github.com/cloudopsworks
#            Distributed Under Apache v2.0 License
#

locals {
  lang_map = {
    java = {
      template = "java-app-template"
      ci       = true
    }
    node = {
      template = "node-app-template"
      ci       = true
    }
    ruby = {
      template = "ruby-app-template"
      ci       = true
    }
    docker = {
      template = "docker-app-template"
      ci       = true
    }
    go = {
      template = "go-app-template"
      ci       = true
    }
    dotnet = {
      template = "dotnet-app-template"
      ci       = true
    }
    rust = {
      template = "rust-app-template"
      ci       = true
    }
    kotlin = {
      template = "kotlin-app-template"
      ci       = true
    }
    python = {
      template = "python-app-template"
      ci       = true
    }
    xcode = {
      template = "xcode-app-template"
      ci       = true
    }
    terraform = {
      template = "terraform-project-template"
      ci       = true
    }
    terraform-module = {
      template = "terraform-module-template"
      ci       = false
    }
  }
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
    owner                = try(each.value.model_repository, "") != "" ? split("/", each.value.model_repository)[0] : "cloudopsworks"
    repository           = try(each.value.model_repository, "") != "" ? split("/", each.value.model_repository)[1] : local.lang_map[each.value.language].template
    include_all_branches = try(each.value.include_all_branches, false)
  }
}

resource "time_sleep" "repo" {
  for_each        = local.repos
  create_duration = "30s"

  depends_on = [
    github_repository.repo
  ]

  triggers = {
    repo = github_repository.repo[each.key].repo_id
  }
}

resource "github_repository_file" "pipeline_config" {
  depends_on = [
    time_sleep.repo
  ]
  for_each = {
    for k, v in local.repos : k => v
    if local.lang_map[v.language].ci
  }
  repository          = github_repository.repo[each.key].name
  file                = ".github/cloudopsworks-ci.yaml"
  content             = templatefile("${path.module}/templates/${each.value.language}/cloudopsworks-ci.yaml.tftpl", merge(local.default_cicd_config, try(each.value.cicd_config, {})))
  commit_message      = "Initial CI/CD Configuration"
  overwrite_on_create = true

  lifecycle {
    ignore_changes = [
      content,
      commit_message
    ]
  }
}