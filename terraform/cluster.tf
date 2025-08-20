resource "aws_ecs_cluster" "cluster" {
  name = "cluster-terraria"
}

resource "aws_ecs_service" "cluster-service" {
  name            = "example-service"
  cluster         = aws_ecs_cluster.cluster.id
  task_definition = aws_ecs_task_definition.server_task_definition.arn
  desired_count   = 1

  network_configuration {
    subnets         = ["subnet-009e143a4c1a9fd75"]
    # security_groups = [aws_security_group.fargate_sg.id]
    # assign_public_ip = true
  }
}