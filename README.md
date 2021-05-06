# Teste para vaga de DevOps Ciclic

1- Dockerfile:
Crie um ou mais Dockerfile de acordo com nossa stack atual: CentOS 7 /Java 8 ou 9
OBS: Caso queira incluir mais algumas instalações ou configurações fique a vontade! ;)

>Files: dockerfile / ciclicapp_entrypoint.sh
>
>**Wilton's notes:**
>Dockerfile bem básico, precisaria ter mais informações da aplicação para criar as variáveis necessárias para interagir com a aplicação de maneira mais sustentável.
>ps.: Costumo escrever os códigos e comentários tudo em inglês.

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

>**Wilton's notes:**
>Não tenho exp. prática em terraform/Cloudformation, Trabalhei mais com Ansible e Chef mas para infra On-Premisses e pontualmente para gestão de configuração do meu ambiente e >automatização de processos de infra e muito no desenvolvimento em shellscript sendo chamado pelo Rundeck, então não ou colocar um código que não é meu para avaliarem meu >conhecimento que não é a realidade, mas fiz um fork no projeto abaixo e testei a implementação abaixo na minha conta AWS e funcionou certinho.
>
>Terraform-AWS-ECS
>https://github.com/arminc/terraform-ecs
>
>Creio que precisem de alguém com mais conhecimento já nessas tools IaC, mas tudo bem, está no meu roadmap aprender a fundo Terraform. :)

3-  Stack de ferramentas:
Desenhe/descreva um ciclo de CI/CD desde o backlog até o deploy da aplicação, incluindo ferramentas de mercado de infra as code, build, continuous integration, deploy, gestão de dependências e operações (monitoração e logs). Justifique a escolha das ferramentas que achar mais relevantes.

![image](https://user-images.githubusercontent.com/18581841/117316409-f70e4b00-ae5e-11eb-9bcb-9ba78c86ed2a.png)

>**Wilton's notes:**
>O desenho de um ciclo CI/CD, é como demonstrado nesta imagem. Mas vou falar da minha experiência no ciclo ao invés de pontuar o conceitual do ciclo CI/CD. 
>Minha exp. com CI/CD é mais com o processo de CD e On-Premisses, trabalhava com SOA/Middleware e APIM (Api Management), uma stack bem grande de tecnologias mais focado em >infraestrutura.
>
>Stack API:
>ZUP Gateway (Node.Js)
>Couchbase (NoSQL DB do API Gateway)
>RabbitMQ (Fila para recebimento dos eventos das reqs do API Gateway)
>Stack Elastic (Logstash (buscar os eventos no Rabbit e mandar para o Elasticsearch), Kibana e Infrastrutura do ElasticSearch), e o gerenciamento dos Logstashs feitos via >Pipeline do Elastic.
>Google Apigee 
>Cassandra como banco NoSQL do Gateway, com sua stack de zookeeper.
>Apache QPid como fila dos eventos mandando os eventos para o Postgres.
>
>Stack Middleware:
>Apache
>IBM Integration Bus (Monolíto que levamos para container e colocamos no Openshift nosso orquestrador de container (On-Premisses (Prod) e Cloud (DEV/PRE))
>
>Minha exp. no pipeline foi na parte de CD (Continuous Deployment), mas vou explicar como era nosso pipe das integrações do IBM Integration Bus.>
>
>Os devs criavam o code e faziam o push para o Gitlab (nosso SCM) que entrava em nossa esteira de Build e Deploy (Ferramenta que usamos é o Jenkins), essa parte do CI não fui eu quem desenvolveu, outra equipe que faz mais essa interface com a governança dos serviços que criou, que basicamente fazia o build do pacote do gitlab, fazendo steps de teste unitário e qualidade de código com SonarQube, se tudo desse certo o artefato era criado e enviado para o nosso repositório de artefatos (Artifactory (Jfrog)), e via api disparava o CD. 
>Nesta parte que eu entro no processo, temos o Rundeck (Job scheduler) e criei o Job de deploy no ambiente, tanto na criação dos parâmetros do job quando no desenvolvimento de todas validações, distribuição e deploy no ambiente, Tudo em Shellscript (ambiente completamente Linux RHEL7), então validava se estava tudo okay com o download do artefato, validações técnicas, para saber se o deploy poderia ser realizado com a CHG (mundança informada) se o ambiente estava Híbrido ou não (100% VM ou já estava recebendo carga nos conteiners para também realizar o deploy lá) e de fato o deploy no Integration Bus (Parque de mais de 500 Servidores) e mais de 400 deploymentconfigs no Openshift.
>Continuando no processo, após a monitoria da implementação ficava tudo centralizada no Dynatrace, tantos os componentes de Infraestrutura quando a parte de APM, monitoria de erros e drill-down dos erros no código tanto das aplicações do Integration Bus, como java, python, etc de outros projetos é toda monitorada no dynatrace.
>E as squads de desenvolvimento que ficavam mais com a função de entender os erros de negócio da nova aplicação, auxilei mais na disseminação do como fazer e onde fazer no dynatrace apoiando os devs para tirar as métricas necessárias.
>
>Os KPI's do pipeline ficava mais nas métricas das ferramentas mesmo (Jenkins e Rundeck) não tinhamos um Dash de KPI perfornalizado mais robusto.

#Processo de submissão
Fazer um fork desse repositório e nos mandar um pull request.
Nos dar acesso ao seu repositório no github, bitbucket ou gitlab. Email:tiago@ciclic.com.br
