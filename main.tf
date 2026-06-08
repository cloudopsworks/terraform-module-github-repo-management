##
# (c) 2021-2026
#     Cloud Ops Works LLC - https://cloudops.works/
#     Find us on:
#       GitHub: https://github.com/cloudopsworks
#       WebSite: https://cloudops.works
#     Distributed Under Apache v2.0 License
#

locals {
  lang_map = {
    java = {
      template   = "java-app-template"
      ci         = true
      gitversion = true
    }
    node = {
      template   = "node-app-template"
      ci         = true
      gitversion = true
    }
    ruby = {
      template   = "ruby-app-template"
      ci         = true
      gitversion = true
    }
    docker = {
      template   = "docker-app-template"
      ci         = true
      gitversion = true
    }
    go = {
      template   = "go-app-template"
      ci         = true
      gitversion = true
    }
    dotnet = {
      template   = "dotnet-app-template"
      ci         = true
      gitversion = true
    }
    rust = {
      template   = "rust-app-template"
      ci         = true
      gitversion = true
    }
    kotlin = {
      template   = "kotlin-app-template"
      ci         = true
      gitversion = true
    }
    python = {
      template   = "python-app-template"
      ci         = true
      gitversion = true
    }
    xcode = {
      template   = "xcode-app-template"
      ci         = true
      gitversion = true
    }
    terraform = {
      template   = "terraform-project-template"
      ci         = false
      gitversion = false
    }
    terraform-module = {
      template   = "terraform-module-template"
      ci         = false
      gitversion = true
    }
    androidsdk = {
      template   = "androidsdk-app-template"
      ci         = true
      gitversion = true
    }
    flutter = {
      template   = "fluttermobile-app-template"
      ci         = true
      gitversion = true
    }
    fluttermobile = {
      template   = "fluttermobile-app-template"
      ci         = true
      gitversion = true
    }
  }
  path_map = {
    "v5.9"  = ".github"
    "v5.10" = ".cloudopsworks"
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
    cd = {
      automatic = false
    }
    gitflow = {
      enabled                = true
      supportBranchesEnabled = false
      requiredReviewers      = 1
    }
  }
  merged_cicd_config = {
    for k, v in local.repos : k => merge(
      local.default_cicd_config,
      try(v.cicd_config, {}),
      {
        cd = merge(
          local.default_cicd_config.cd,
          try(v.cicd_config.cd, {})
        )
        gitflow = merge(
          local.default_cicd_config.gitflow,
          try(v.cicd_config.gitflow, {})
        )
      }
    )
    if local.lang_map[v.language].ci
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

data "github_repository_file" "pipeline_config_tmpl" {
  for_each = {
    for k, v in local.repos : k => v
    if local.lang_map[v.language].ci
  }
  repository = local.lang_map[each.value.language].template
  branch     = "master"
  file       = "${local.path_map[try(each.value.blueprint, "v5.10")]}/cloudopsworks-ci.yaml.tftpl"

  depends_on = [
    time_sleep.repo
  ]
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
  file                = "${local.path_map[try(each.value.blueprint, "v5.10")]}/cloudopsworks-ci.yaml"
  content             = templatestring(data.github_repository_file.pipeline_config_tmpl[each.key].content, local.merged_cicd_config[each.key])
  commit_message      = "Initial CI/CD Configuration"
  overwrite_on_create = try(each.value.overwrite_on_create, true)

  lifecycle {
    ignore_changes = [
      content,
      commit_message
    ]
  }
}



# Gitversion file
data "github_repository_file" "gitversion_file" {
  for_each = {
    for k, v in local.repos : k => v
    if local.lang_map[v.language].gitversion && try(v.model_repository, "") == ""
  }
  repository = local.lang_map[each.value.language].template
  branch     = "master"
  file       = "${local.path_map["v5.10"]}/gitversion_${local.default_cicd_config.gitflow.enabled ? "gitflow" : "githubflow"}.yaml"
}

resource "github_repository_file" "gitversion_file" {
  for_each = {
    for k, v in local.repos : k => v
    if local.lang_map[v.language].gitversion && try(v.model_repository, "") == ""
  }
  depends_on = [
    time_sleep.repo
  ]
  repository          = github_repository.repo[each.key].name
  content             = data.github_repository_file.gitversion_file[each.key].content
  file                = "${local.path_map["v5.10"]}/gitversion.yaml"
  commit_message      = "Add GitVersion Configuration"
  overwrite_on_create = try(each.value.overwrite_on_create, true)
  lifecycle {
    ignore_changes = [
      content,
      commit_message
    ]
  }
}