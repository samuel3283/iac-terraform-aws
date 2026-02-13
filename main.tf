data "aws_vpc" "default" {
  default = true
}

data "aws_subnets" "default" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.default.id]
  }
}

module "ecs_cluster" {
  source = "./modules/ecs-cluster"

  name = "${var.project_name}-cluster"
  tags = local.common_tags
}

module "task_execution_role" {
  source = "./modules/iam-task-execution"

  name = "${var.project_name}-execution-role"
  tags = local.common_tags
}

module "ecs_service" {
  source = "./modules/ecs-service"

  project_name       = var.project_name
  cluster_id         = module.ecs_cluster.cluster_id
  execution_role_arn = module.task_execution_role.role_arn
  subnets            = data.aws_subnets.default.ids
  tags               = local.common_tags
}
