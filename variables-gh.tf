##
# (c) 2021-2026
#     Cloud Ops Works LLC - https://cloudops.works/
#     Find us on:
#       GitHub: https://github.com/cloudopsworks
#       WebSite: https://cloudops.works
#     Distributed Under Apache v2.0 License
#

##
# repositories: # (Optional) Repository specifications to create and configure. Default: []
#   - name: "sample-api" # (Required) Repository name when prefix_name is not used; also used as the map key.
#     prefix_name: "sample" # (Optional) Prefix used to generate "<prefix>-<org_unit>-<environment>-<type>" repository names. Default: null.
#     description: "Sample API repository" # (Optional) GitHub repository description. Default: "".
#     language: "java" # (Required) Template language. Valid values: androidsdk, docker, dotnet, fluttermobile, flutter, go, java, kotlin, node, python, ruby, rust, terraform, terraform-module, xcode.
#     public: false # (Optional) Set true for a public repository; false creates a private repository. Default: false.
#     include_all_branches: false # (Optional) Copy every branch from the template repository. Default: false.
#     model_repository: "cloudopsworks/java-app-template" # (Optional) Override template repository as "owner/name". Default: selected by language.
#     blueprint: "v5.10" # (Optional) Blueprint generation path. Valid values: v5.9 writes .github/cloudopsworks-ci.yaml; v5.10 writes .cloudopsworks/cloudopsworks-ci.yaml. Default: v5.10.
#     overwrite_on_create: true # (Optional) Replace an existing CI/CD config file during initial repository creation. Default: true.
#     cicd_config: # (Optional) Values rendered into the language CI/CD template. Default: {}.
#       access: # (Optional) Branch-protection reviewers and owners. Default: no reviewers or owners.
#         reviewers: # (Optional) GitHub users or teams required for review, teams as org/team-slug. Default: [].
#           - "cloudopsworks/engineering"
#         owners: # (Optional) GitHub users or teams allowed to administer protected branches. Default: [].
#           - "cloudopsworks/admin"
#       contributors: # (Optional) Repository collaborators and team permissions. Default: no contributors.
#         admin: [] # (Optional) Users or teams with admin permission. Default: [].
#         maintain: [] # (Optional) Users or teams with maintain permission. Default: [].
#         push: [] # (Optional) Users or teams with push permission. Default: [].
#         triage: [] # (Optional) Users or teams with triage permission. Default: [].
#         pull: [] # (Optional) Users or teams with pull permission. Default: [].
#       build: # (Optional) Language build settings consumed by selected templates. Default: {}.
#         version: "17" # (Optional) Runtime, SDK, or toolchain version. Default: template-specific.
#         dist: "temurin" # (Optional) Runtime distribution when supported. Default: template-specific.
#       sonarqube: # (Optional) SonarQube integration settings. Default: enabled by template.
#         disabled: false # (Optional) Disable SonarQube when true. Default: false.
#       branch: # (Optional) Branch-protection rendering settings. Default: protection enabled, Conventional Commits validation disabled.
#         protectionEnabled: true # (Optional) Render branch-protection configuration into the CI/CD config. Default: true.
#         conventionalCommitsEnabled: false # (Optional) Enable Conventional Commits message validation on protected branches. Default: false.
#         conventionalCommitsPattern: "^(build|ci|chore|docs|feat|fix|perf|refactor|revert|style|test)(\\([a-z0-9\\-]+\\))?: .+" # (Optional) Regex used to validate Conventional Commits messages. Default: shown value.
#       enforce: # (Optional) Commit-message enforcement settings rendered into the CI/CD config. Default: enforcement disabled.
#         conventionalCommitsEnforced: false # (Optional) Enforce (block) commits that do not match the Conventional Commits pattern when true. Default: false.
#         customCommitsPatternEnabled: false # (Optional) Enforce a custom commit-message pattern when true. Default: false.
#         customCommitsPattern: "PROJECT-[0-9]+.+" # (Optional) Regex used to validate custom commit messages, e.g. requiring an issue key. Default: shown value.
#       dependency_track: # (Optional) Dependency-Track integration settings. Default: enabled by template.
#         disabled: false # (Optional) Disable Dependency-Track when true. Default: false.
#         type: "Application" # (Optional) Project classifier. Valid values: Application, Library. Default: Application.
#       cd: # (Optional) Continuous-delivery settings rendered into the CI/CD config. Default: automatic disabled.
#         automatic: false # (Optional) Enable automatic continuous deployment. Default: false.
#         cloud: "aws" # (Optional) Deployment cloud. Valid values depend on template; common values: aws, azure, gcp. Default: unset.
#         cloud_type: "eks" # (Optional) Deployment target type such as eks, lambda, elasticbeanstalk, aks, webapp, function, gke. Default: unset.
#       gitflow: # (Optional) Git workflow settings rendered into the CI/CD config. Default: GitFlow enabled.
#         enabled: true # (Optional) Use GitFlow branching when true; false selects GitHubFlow (also controls the generated gitversion.yaml). Default: true.
#         supportBranchesEnabled: false # (Optional) Enable support/* branch handling. Default: false.
#         requiredReviewers: 1 # (Optional) Number of required pull-request reviewers. Default: 1.
variable "repositories" {
  description = "Repository specification list used to create GitHub repositories from language templates and render their CloudOpsWorks CI/CD configuration."
  type        = any
  default     = []
}
