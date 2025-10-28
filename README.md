hashicorp account: https://app.terraform.io/app/hashicorp-learn-aws-org/workspaces/terraform-aws-vpc-demo

### Main Commands
`terrafrom init`

`terrafrom plan`

`terrafrom apply`


### View resources
`terraform state list`

`terraform state show <ITEM_IN_LIST>`

terrafrom console

#### View public ec2:
`aws_instance.MyEC2Instance.public_ip`

### Create Graph
`terraform graph | dot -Tpng > graph.png`


