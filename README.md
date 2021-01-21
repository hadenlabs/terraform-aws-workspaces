<!--


  ** DO NOT EDIT THIS FILE
  **
  ** 1) Make all changes to `README.yaml`
  ** 2) Run`make readme` to rebuild this file.
  **
  ** (We maintain HUNDREDS of open source projects. This is how we maintain our sanity.)
  **


  -->
 

# terraform-aws-workspaces [![Build Status](https://travis-ci.org/hadenlabs/terraform-aws-workspaces.svg?branch=main)](https://travis-ci.org/hadenlabs/terraform-aws-workspaces) [![Latest Release](https://img.shields.io/github/release/hadenlabs/terraform-aws-workspaces.svg)](https://travis-ci.org/hadenlabs/terraform-aws-workspaces/releases)

 Terraform module to provision an workspace instance. 

---

This project is part of our comprehensive ["Hadenlabs"](https://hadenlabs.com) modules of terraform.

    

  

## Usage

```hcl
  module "main" {
    source  = "hadenlabs/workspaces/aws"
    version = "0.1.0"

    providers = {
      aws = aws.main
    }

  }
```

Full working example can be found in [example](./example) folder.





 <!-- DO NOT EDIT. THIS FILE IS GENERATED BY THE MAKEFILE. -->
# Terraform variables
This document gives an overview of variables used in the platform of the terraform-aws-workspaces.
## Requirements

| Name | Version |
|------|---------|
| terraform | >= 0.13 |

## Providers

| Name | Version |
|------|---------|
| aws | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| bundle\_id | id of bunlde | `string` | `"wsb-bh8rsxt14"` | no |
| create\_directory | Create managed AWS AD/AD Connector | `bool` | `true` | no |
| directory\_edition | If MicrosoftAD, select either Standard or Enterprise | `string` | `"Standard"` | no |
| directory\_name | Directory Name (DNS name) | `string` | `"org.hadenlabs.com"` | no |
| directory\_pass | password for directory | `string` | n/a | yes |
| directory\_size | Directory Size. If SimpleAD or AD Connector, select either Small or Large. | `string` | `"Small"` | no |
| directory\_type | Type of Directory to create. Options: SimpleAD, ADConnector or MicrosoftAD | `string` | `"MicrosoftAD"` | no |
| root\_volume\_encryption\_enabled | This root volume encryption enabled | `bool` | `true` | no |
| tags | This is to help you add tags to your cloud objects | `map(any)` | `null` | no |
| update\_dhcp\_options | Use AD DNS servers to resolve queries on VPC | `bool` | `true` | no |
| user\_name | name user for directory | `string` | `"Administrator"` | no |
| user\_volume\_encryption\_enabled | This user volume encryption enabled | `bool` | `true` | no |
| volume\_encryption\_key | key for encryption volume | `string` | `"alias/aws/workspaces"` | no |

## Outputs

| Name | Description |
|------|-------------|
| directory | The directory |
| workspace | The workspace |

  

## Help

**Got a question?**

File a GitHub [issue](https://github.com/hadenlabs/terraform-aws-workspaces/issues), send us an [email][email] or join our [Slack Community][slack].

## Contributing

### Bug Reports & Feature Requests

Please use the [issue tracker](https://github.com/hadenlabs/terraform-aws-workspaces/issues) to report any bugs or file feature requests.

### Developing

If you are interested in being a contributor and want to get involved in developing this project or [help out](https://github.com/hadenlabs) with our other projects, we would love to hear from you! Shoot us an [email](mailto:hola@hadenlabs.com).

In general, PRs are welcome. We follow the typical "fork-and-pull" Git workflow.

1.  **Fork** the repo on GitHub
2.  **Clone** the project to your own machine
3.  **Commit** changes to your own branch
4.  **Push** your work back up to your fork
5.  Submit a **Pull Request** so that we can review your changes

**NOTE:** Be sure to merge the latest changes from "upstream" before making a pull request!



## Copyright

Copyright © 2018-2021 [Hadenlabs, LLC](https://hadenlabs.com) 

 







## Trademarks

All other trademarks referenced herein are the property of their respective owners.

## About

This project is maintained and funded by [Hadenlabs, LLC][website]. Like it? Please let us know at <hola@hadenlabs.com>



### Contributors

|  [![Luis Mayta][luismayta_avatar]][luismayta_homepage]<br/>[Luis Mayta][luismayta_homepage] |
|---|

  [luismayta_homepage]: https://github.com/luismayta
  [luismayta_avatar]: https://github.com/luismayta.png?size=150



