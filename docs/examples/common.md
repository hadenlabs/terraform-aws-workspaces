### common

```hcl

  module "main" {
    source  = "hadenlabs/workspaces/aws"
    version = "0.1.0"

    providers = {
      aws = aws.main
    }
  }

```
