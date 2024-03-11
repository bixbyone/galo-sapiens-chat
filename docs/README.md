Requisitos

galo-sapiens-chat/
├── Dockerfile (ok)
├── README.md (ok)
├── api.sh (pendente)
├── deepautoscale
│   ├── data (pendente)
│   └── model (pendente)
│   └── monitoring
│       ├── docker
│       │   └── log (pendente)
│       └── nginx
│           └── log (pendente)
├── docker-compose.yml (ok)
├── docs
│   └── README.md (ok)
├── executa-test-local.sh (ok)
├── load-test
│   └── user-files
│       └── simulations  (pendente)
│           └── rinhabackend
│               └── class RinhaBackendCrebitosSimulation.scala (ok)
└── sql
    ├── init.sql (ok)
    ├── nginx.conf (ok)
    └── pragma.conf (ok)


**Observações:**

* Adicionei a pasta `data` dentro da pasta `logs` para armazenar os data sets do DeepAutoScale.

**Requisitos Atualizados:**

**Requisitos de Negócio:**

* Desenvolver uma API HTTP em Bash (.sh) com os seguintes endpoints:
* Transações
* Extrato
* Implementar a lógica de controle de concorrência com o tema créditos e débitos (créditos)
* Utilizar o cupom `RINHADEV` da Cubos Academy para desconto em qualquer curso
* Prever inconsistências na Rinha de Backend e evitar HTTP Status Code 200 para requisições de débito que deixem o saldo inconsistente
* Implementar a regra de que uma transação de débito nunca pode deixar o saldo inconsistente
* Utilizar HTTP Status Code 422 para requisições de débito que violarem a regra de consistência do saldo
* Implementar a regra de que se o atributo `[id]` da URL for de uma identificação não existente de cliente, a API deve retornar HTTP Status Code 404
* Implementar a regra de que se a API retornar algo na faixa 2XX, ocorrerá uma inconsistência na Rinha de Backend

**Testes:**

* Testar se a API retorna HTTP Status Code 200 OK para requisições de transações bem-sucedidas
* Testar se a API retorna HTTP Status Code 422 para requisições de débito que violarem a regra de consistência do saldo
* Testar se a API retorna HTTP Status Code 404 para requisições de clientes não existentes
* Testar se a API retorna HTTP Status Code 200 OK para requisições de extrato
* Testar se a API retorna HTTP Status Code 200 OK para requisições de transações com limite de crédito
* Testar se a API retorna HTTP Status Code 200 OK para requisições de transações com limite de débito
* Testar se a API retorna HTTP Status Code 200 OK para requisições de transações com crédito e débito

**Requisitos de Modelo:**

* Utilizar o formato de artefato Docker Compose para descrever a estrutura da API
* Utilizar a tecnologia Bash para implementar a lógica da API
* Utilizar o banco de dados SQLite para armazenar dados do cliente
* Utilizar o servidor Nginx para servir a API

**Requisitos de Documentação:**

* Incluir um arquivo `README.md` com informações sobre a API, como o nome, tecnologias utilizadas, link para o código-fonte e informações de contato
* Incluir um arquivo `docker-compose.yml` para descrever a estrutura da API
* Incluir todos os diretórios e arquivos necessários para que os contêineres subam corretamente

**Requisitos de Validação:**

* Validar se a API retorna os Status Codes corretos para as diferentes requisições
* Validar se a API está inconsistente para requisições de débito que violarem a regra de consistência do saldo
* Validar se a API está inconsistente para requisições de clientes não existentes
* Validar se a API está inconsistente para requisições de extrato

**Requisitos de Qualificação:**

* Qualificar a API com base em seu desempenho em diferentes cenários de uso
* Qualificar a API com base em sua capacidade de lidar com diferentes tipos de requisições
* Qualificar a API com base em sua capacidade de lidar com diferentes volumes de requisitos

**Requisitos de Autoescala:**

* Utilizar o DeepAutoScale para autoescala vertical e horizontal com base nos logs e treino no teste conhecido.

**Observações:**

* Os requisitos de autoescala foram adicionados aos requisitos gerais.
* Os requisitos de modelo, documentação, validação e qualificação permanecem os mesmos.

**Coleta de Logs**

Execute a API com diferentes cargas de trabalho usando uma ferramenta de teste de carga como o Gatling ou JMeter.
Configure o Docker para coletar logs dos contêineres da API usando o comando docker logs.
Armazene os logs em um local centralizado, como um bucket do Amazon S3 ou um servidor ELK.
Treinamento do Modelo de Rede Neural

Use uma estrutura de aprendizado de máquina como o TensorFlow ou PyTorch para criar um modelo de rede neural.
Divida os dados de logs coletados em conjuntos de treinamento e teste.
Treine o modelo de rede neural nos dados de treinamento para prever a escalabilidade da API em diferentes cargas de trabalho.
Previsão de Escalabilidade

Depois que o modelo de rede neural estiver treinado, use-o para prever a escalabilidade da API em diferentes cargas de trabalho.
Isso pode ser feito alimentando o modelo com dados de logs de cargas de trabalho específicas.
Identificação de Problemas de Escalabilidade

Analise as previsões do modelo de rede neural para identificar problemas de escalabilidade.
Por exemplo, o modelo pode prever que a API não será capaz de lidar com uma carga de trabalho específica devido a gargalos de recursos como CPU ou memória.
Medidas Preventivas

Com base nos problemas de escalabilidade identificados, tome medidas preventivas para garantir que a API possa lidar com aumentos de carga de trabalho.
Isso pode incluir:
Aumento dos recursos do contêiner da API (por exemplo, CPU, memória)
Implementação de técnicas de cache
Uso de uma arquitetura de microsserviços
Implementação de balanceamento de carga
Observações:

O processo de coleta de logs, treinamento de modelo e identificação de problemas de escalabilidade pode ser iterativo.
Pode ser necessário ajustar o modelo de rede neural ou coletar dados de logs adicionais para melhorar a precisão das previsões.