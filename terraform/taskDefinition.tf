resource "aws_ecs_task_definition" "server_task_definition" {
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
        sourceVolume  = "vol-terra"
        containerPath = "/root/.local/share/Terraria/Worlds"
      }
    ]
    
    }
  ])
  cpu = 2048
  memory    = 4096
  
  network_mode             = "awsvpc"
  execution_role_arn = "arn:aws:iam::638668518684:role/ecsTaskExecutionRole"

  runtime_platform {
    operating_system_family = "LINUX"
    cpu_architecture = "X86_64"
  }

  volume {
    name = "vol-terra"
    configure_at_launch = true

  }

  # placement_constraints {
  #   type       = "memberOf"
  #   expression = "attribute:ecs.availability-zone in [us-east-1a]"
  # }
}