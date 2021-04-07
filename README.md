# Teste para vaga de DevOps Ciclic

1- Dockerfile:

Crie um ou mais Dockerfile de acordo com nossa stack atual: 
CentOS 7
Java 8 ou 9

OBS: Caso queira incluir mais algumas instalações ou configurações fique a vontade! ;)

2- Infra as code:

Desenvolva um código para criar uma parte da infra que utilizamos na Ciclic. A idéia é criar um cluster ECS, pelo menos um service e uma task. Se achar necessário pode incluir
outros elementos de infraestrutura como VPC, subnets, Auto Scaling Group e launch configuration.

OBS: Pode ser tanto em Terraform quanto em Cloudformation.

Links de suporte:

https://www.terraform.io/docs/providers/aws/r/ecs_service.html


https://www.terraform.io/docs/providers/aws/r/ecs_cluster.html


https://www.terraform.io/docs/providers/aws/r/ecr_repository.html


https://www.terraform.io/docs/providers/aws/r/ecs_task_definition.html


https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-resource-ecs-cluster.html
https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-resource-ecs-service.html
https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-resource-ecs-taskdefinition.html
https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-resource-ecr-repository.htm

3-  Stack de ferramentas:

Desenhe/descreva um ciclo de CI/CD desde o backlog até o deploy da aplicação, incluindo ferramentas de mercado de infra as code, build, continuous integration, deploy, gestão de dependências e operações (monitoração e logs). Justifique a escolha das ferramentas que achar mais relevantes.


#Processo de submissão

Fazer um fork desse repositório e nos mandar um pull request.
Nos dar acesso ao seu repositório no github, bitbucket ou gitlab. Email:tiago@ciclic.com.br
