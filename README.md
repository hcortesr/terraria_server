# Terraria Server

Goal: Being able to update the server easily. The tcp connection with the server should be tested.

Knowledge:

- Command to start the server: ./TerrariaServer.bin.x86_64 -config config.txt
- To autocrate a world there must be a world property in the config file. The directories should exist, but the world isn't necessary.
- The versions of the game and the server must me the same.
- The t2.micro instance is not powerfull enought to run the server. I should use at least a t2.medium
- When a server open a world from an older version, it automatically upgrades it.
- The only test I need it checking the docker image, because the config.txt is not necessary.
- How to mount a ebs.
- One world doesn't accepts many servers at the same time.
- The terraform should be initialized for the first time.
- Is not recommended to connect to an ec2 instance through ssh in github actions.
- ECS is not an overkill for just one container.
- The cluster needs a two policies to create the volume, attache it and use it.
- Fargate spot is cheaper.
- Is necessary to run a task.
- Not delete on termination.
- sub-bash

Notes:

2. What tests do i need to do? Does it needs to be the exact same file for the pushed to the dev branch and the pull requests to the main branch?

Tasks Done:

1. Connect with the server.
2. Install eksctl
3. Store the world in an external drive.
4. Create image that reads the world, but doesn't create it.
5. Task created
6. Logger v1 created.

Tasks:

1. Generate the Terraforms files.