resource "aws_ecs_task_definition" "Server_task_definition" {
  family = "Terraria-server"
  container_definitions = jsonencode([
    {
      name      = "t-server"
      image     = "hectorcortesr/terra_server:1449_auto_safe_60"
      cpu       = 2048
      memory    = 4096
      essential = true
      
      portMappings = [
        {
          containerPort = 7777
          hostPort      = 7777
        }
      ]
      mountPoints = [
      {
        sourceVolume  = "service-storage"
        containerPath = "/root/.local/share/Terraria/Worlds"
      }
    ]
    
    }
  ])
  cpu = 2048
  memory    = 4096
  
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  execution_role_arn = "arn:aws:iam::638668518684:role/ecsTaskExecutionRole"
  volume {
    name      = "service-storage"
    configure_at_launch = true
  }

  # placement_constraints {
  #   type       = "memberOf"
  #   expression = "attribute:ecs.availability-zone in [us-east-1a]"
  # }
}