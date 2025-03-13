<!-- 
  ** DO NOT EDIT THIS FILE
  ** 
  ** This file was automatically generated. 
  ** 1) Make all changes to `README.yaml` 
  ** 2) Run `make init` (you only need to do this once)
  ** 3) Run`make readme` to rebuild this file. 
  -->
[![README Header][readme_header_img]][readme_header_link]

[![cloudopsworks][logo]](https://cloudops.works/)

# Terraform GitHub Repository Management




**Terraform GitHub Repository Management** is a Terraform module designed to help you automate and standardize the
creation and ongoing management of GitHub repositories. It streamlines tasks like configuring repository settings, 
managing access levels, and integrating with both GitHub-native and third-party services—without the need to switch 
between multiple interfaces.


---

This project is part of our comprehensive approach towards DevOps Acceleration. 
[<img align="right" title="Share via Email" width="24" height="24" src="https://docs.cloudops.works/images/ionicons/ios-mail.svg"/>][share_email]
[<img align="right" title="Share on Google+" width="24" height="24" src="https://docs.cloudops.works/images/ionicons/logo-googleplus.svg" />][share_googleplus]
[<img align="right" title="Share on Facebook" width="24" height="24" src="https://docs.cloudops.works/images/ionicons/logo-facebook.svg" />][share_facebook]
[<img align="right" title="Share on Reddit" width="24" height="24" src="https://docs.cloudops.works/images/ionicons/logo-reddit.svg" />][share_reddit]
[<img align="right" title="Share on LinkedIn" width="24" height="24" src="https://docs.cloudops.works/images/ionicons/logo-linkedin.svg" />][share_linkedin]
[<img align="right" title="Share on Twitter" width="24" height="24" src="https://docs.cloudops.works/images/ionicons/logo-twitter.svg" />][share_twitter]


[![Terraform Open Source Modules](https://docs.cloudops.works/images/terraform-open-source-modules.svg)][terraform_modules]



It's 100% Open Source and licensed under the [APACHE2](LICENSE).







We have [*lots of terraform modules*][terraform_modules] that are Open Source and we are trying to get them well-maintained!. Check them out!













## Makefile Targets
```
Available targets:

  help                                Help screen
  help/all                            Display help for all targets
  help/short                          This help short screen
  lint                                Lint terraform/opentofu code
  tag                                 Tag the current version

```
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.3 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_github"></a> [github](#provider\_github) | n/a |
| <a name="provider_time"></a> [time](#provider\_time) | n/a |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_tags"></a> [tags](#module\_tags) | cloudopsworks/tags/local | 1.0.9 |

## Resources

| Name | Type |
|------|------|
| [github_repository.repo](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/repository) | resource |
| [github_repository_file.pipeline_config](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/repository_file) | resource |
| [time_sleep.repo](https://registry.terraform.io/providers/hashicorp/time/latest/docs/resources/sleep) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_extra_tags"></a> [extra\_tags](#input\_extra\_tags) | n/a | `map(string)` | `{}` | no |
| <a name="input_org"></a> [org](#input\_org) | n/a | <pre>object({<br/>    organization_name = string<br/>    organization_unit = string<br/>    environment_type  = string<br/>    environment_name  = string<br/>  })</pre> | n/a | yes |
| <a name="input_repositories"></a> [repositories](#input\_repositories) | Repositories specification array | `any` | `[]` | no |

## Outputs

No outputs.



## Help

**Got a question?** We got answers. 

File a GitHub [issue](https://github.com/cloudopsworks/terraform-module-github-repo-management/issues), send us an [email][email] or join our [Slack Community][slack].

[![README Commercial Support][readme_commercial_support_img]][readme_commercial_support_link]

## DevOps Tools

## Slack Community


## Newsletter

## Office Hours

## Contributing

### Bug Reports & Feature Requests

Please use the [issue tracker](https://github.com/cloudopsworks/terraform-module-github-repo-management/issues) to report any bugs or file feature requests.

### Developing




## Copyrights

Copyright © 2024-2025 [Cloud Ops Works LLC](https://cloudops.works)





## License 

[![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](https://opensource.org/licenses/Apache-2.0) 

See [LICENSE](LICENSE) for full details.

    Licensed to the Apache Software Foundation (ASF) under one
    or more contributor license agreements.  See the NOTICE file
    distributed with this work for additional information
    regarding copyright ownership.  The ASF licenses this file
    to you under the Apache License, Version 2.0 (the
    "License"); you may not use this file except in compliance
    with the License.  You may obtain a copy of the License at

      https://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing,
    software distributed under the License is distributed on an
    "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
    KIND, either express or implied.  See the License for the
    specific language governing permissions and limitations
    under the License.









## Trademarks

All other trademarks referenced herein are the property of their respective owners.

## About

This project is maintained by [Cloud Ops Works LLC][website]. 


### Contributors

|  [![Cristian Beraha][berahac_avatar]][berahac_homepage]<br/>[Cristian Beraha][berahac_homepage] |
|---|

  [berahac_homepage]: https://github.com/berahac
  [berahac_avatar]: https://github.com/berahac.png?size=50

[![README Footer][readme_footer_img]][readme_footer_link]
[![Beacon][beacon]][website]

  [logo]: https://cloudops.works/logo-300x69.svg
  [docs]: https://cowk.io/docs?utm_source=github&utm_medium=readme&utm_campaign=cloudopsworks/terraform-module-github-repo-management&utm_content=docs
  [website]: https://cowk.io/homepage?utm_source=github&utm_medium=readme&utm_campaign=cloudopsworks/terraform-module-github-repo-management&utm_content=website
  [github]: https://cowk.io/github?utm_source=github&utm_medium=readme&utm_campaign=cloudopsworks/terraform-module-github-repo-management&utm_content=github
  [jobs]: https://cowk.io/jobs?utm_source=github&utm_medium=readme&utm_campaign=cloudopsworks/terraform-module-github-repo-management&utm_content=jobs
  [hire]: https://cowk.io/hire?utm_source=github&utm_medium=readme&utm_campaign=cloudopsworks/terraform-module-github-repo-management&utm_content=hire
  [slack]: https://cowk.io/slack?utm_source=github&utm_medium=readme&utm_campaign=cloudopsworks/terraform-module-github-repo-management&utm_content=slack
  [linkedin]: https://cowk.io/linkedin?utm_source=github&utm_medium=readme&utm_campaign=cloudopsworks/terraform-module-github-repo-management&utm_content=linkedin
  [twitter]: https://cowk.io/twitter?utm_source=github&utm_medium=readme&utm_campaign=cloudopsworks/terraform-module-github-repo-management&utm_content=twitter
  [testimonial]: https://cowk.io/leave-testimonial?utm_source=github&utm_medium=readme&utm_campaign=cloudopsworks/terraform-module-github-repo-management&utm_content=testimonial
  [office_hours]: https://cloudops.works/office-hours?utm_source=github&utm_medium=readme&utm_campaign=cloudopsworks/terraform-module-github-repo-management&utm_content=office_hours
  [newsletter]: https://cowk.io/newsletter?utm_source=github&utm_medium=readme&utm_campaign=cloudopsworks/terraform-module-github-repo-management&utm_content=newsletter
  [email]: https://cowk.io/email?utm_source=github&utm_medium=readme&utm_campaign=cloudopsworks/terraform-module-github-repo-management&utm_content=email
  [commercial_support]: https://cowk.io/commercial-support?utm_source=github&utm_medium=readme&utm_campaign=cloudopsworks/terraform-module-github-repo-management&utm_content=commercial_support
  [we_love_open_source]: https://cowk.io/we-love-open-source?utm_source=github&utm_medium=readme&utm_campaign=cloudopsworks/terraform-module-github-repo-management&utm_content=we_love_open_source
  [terraform_modules]: https://cowk.io/terraform-modules?utm_source=github&utm_medium=readme&utm_campaign=cloudopsworks/terraform-module-github-repo-management&utm_content=terraform_modules
  [readme_header_img]: https://cloudops.works/readme/header/img
  [readme_header_link]: https://cloudops.works/readme/header/link?utm_source=github&utm_medium=readme&utm_campaign=cloudopsworks/terraform-module-github-repo-management&utm_content=readme_header_link
  [readme_footer_img]: https://cloudops.works/readme/footer/img
  [readme_footer_link]: https://cloudops.works/readme/footer/link?utm_source=github&utm_medium=readme&utm_campaign=cloudopsworks/terraform-module-github-repo-management&utm_content=readme_footer_link
  [readme_commercial_support_img]: https://cloudops.works/readme/commercial-support/img
  [readme_commercial_support_link]: https://cloudops.works/readme/commercial-support/link?utm_source=github&utm_medium=readme&utm_campaign=cloudopsworks/terraform-module-github-repo-management&utm_content=readme_commercial_support_link
  [share_twitter]: https://twitter.com/intent/tweet/?text=Terraform+GitHub+Repository+Management&url=https://github.com/cloudopsworks/terraform-module-github-repo-management
  [share_linkedin]: https://www.linkedin.com/shareArticle?mini=true&title=Terraform+GitHub+Repository+Management&url=https://github.com/cloudopsworks/terraform-module-github-repo-management
  [share_reddit]: https://reddit.com/submit/?url=https://github.com/cloudopsworks/terraform-module-github-repo-management
  [share_facebook]: https://facebook.com/sharer/sharer.php?u=https://github.com/cloudopsworks/terraform-module-github-repo-management
  [share_googleplus]: https://plus.google.com/share?url=https://github.com/cloudopsworks/terraform-module-github-repo-management
  [share_email]: mailto:?subject=Terraform+GitHub+Repository+Management&body=https://github.com/cloudopsworks/terraform-module-github-repo-management
  [beacon]: https://ga-beacon.cloudops.works/G-7XWMFVFXZT/cloudopsworks/terraform-module-github-repo-management?pixel&cs=github&cm=readme&an=terraform-module-github-repo-management
