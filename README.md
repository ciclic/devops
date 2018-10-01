# Teste para vaga de DevOps Ciclic

## Dockerfile

A imagem do Dockerfile utiliza multistage builds para dividir o processo de build e execução do container em duas etapas:

1 - Build do pacote WAR: com base no container no maven, é criado uma layer com um cache das dependências e posteriormente o pacote WAR

2 - Application server: É utilizada uma imagem do Wildfly como servidor de aplicação (ele utiliza o CentOS como SO base), copiando o WAR do stage anterior.

## Infra as code

Ferramenta escolhida: Terraform

Inicialmente optei por utilizar a VPC e subnet padrão da conta por questões de simplicidade.

https://www.terraform.io/docs/providers/aws/r/ecs_cluster.html

https://www.terraform.io/docs/providers/aws/r/ecr_repository.html

https://www.terraform.io/docs/providers/aws/r/ecs_service.html

https://www.terraform.io/docs/providers/aws/r/ecs_task_definition.html

## Ciclo de CI/CD

Principais passos:

 - Checkout: a partir da ferramenta de versionamento (GitHub ou GitLab) é baixado a versão do código a ser trabalho a partir de um webhook. A partir da branch de origem pode ser determinado os próximos passos do pipeline, por exemplo, caso esteja trabalhando na branch master, será feito um deploy para produção

  - Build: Cria um build dos containers do projeto. Aqui como um passo opcional pode ser configurado o Nexus para gerenciar localmente dependencias internas e privadas. No cenário atual isso pode ser desconsiderado porque as layers de cache do Docker já fornecem um tempo de build bem otimizado, sem precisar baixar todas as dependencias do Maven toda vez.

  - Tests: Execução de testes automatizados do projeto. O tipo de teste executado pode variar dependendo da Branch executada (testes de aceitação em develop e master, smoke test na master).

  - Deployment: Envio da imagem construida para o registry do AWS ECS, considerando a automação da autenticação com o serviço.

## Stack de ferramentas

- Gestão do backlog: Jira para auxiliar na concepção e detalhamento das histórias. Ele tem opções para gerenciamento com SCRUM, Kanban e integração com sistemas de SCM (GitHub e GitLab)

- Ferramenta de SCM: GitHub ou GitLab. Ambos permitem que os projetos tenham níveis de permissão para acesso ao código e seu uso para code review é interessante para garantir a qualidade do que é desenvolvido, inclusive se tratando de Infra como código.

- Infra as code: Terraform e Ansible. Ambas ferramentas são opensource e possuem uma variedade de modulos para trabalhar com diversos serviços e providers de nuvem. Ambos são complementares, podendo tarefas focadas em infra serem realizadas com Terraform e configuração de serviços executadas pelo ansible, todos podendo serem automatizados em pipelines de CI ou com automatizadores de tasks, como o Rundeck.

- CI: Jenkins. Ferramenta já consolidada e com uma gama enorme de plugins para ser executada em muitos cenários. Pode ser utilizado no modelo de Master e Slaves para não precisar acoplar dependencias da aplicação no master do Jenkins e usar spot instances como slaves para a execução dos jobs. O Jenkins tem sofrido boas melhorias, como o pipeline declarativo, com uma configuração fácil de ser trabalhada junto com o time de desenvolvimento e melhorias de interface, como o Blue Ocean, deixando com uma melhor usabilidade.

- Logs: Cloudwatch. Por estar rodando na AWS, usar o Cloudwatch para centralizar os logs de infra e da aplicação do ECS é uma opção interessante, usando serviços já integrados dentro do provider. Pensando num cenário multi cloud, pode ser interessante enviar esses logs para uma stack ELK a fim de se manter desacoplado de um vendor específico.

- Monitoramento: New Relic. Existem várias ferramentas para atingir esse objetivo, principalmente algumas opensource como Prometheus em conjunto com Grafana. Mas pelo ponto de simplicidade de instalação e integração com a AWS, o New Relic é uma opção que funciona out-of-the-box, precisando fazer poucas alterações na aplicação para o envio de eventos customizados.
