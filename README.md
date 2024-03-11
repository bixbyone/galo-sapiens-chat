# API Galo Sapiens Chat#

# Visão Geral
    Esta API foi desenvolvida para a Rinha de Backend 2024/Q1. 
    Ela implementa uma lógica de controle de concorrência para transações de crédito e débito, utilizando o banco de dados SQLite e o servidor Nginx.
## Tecnologias Utilizadas
    * Bash
    * Docker Compose
    * SQLite
    * Nginx
    * DeepAutoScale - fase II
## Estrutura da APIA API   
é composta pelos seguintes serviços:
* **API:** 
    Escrita em Bash, implementa a lógica de negócio da API.
* **Banco de Dados:** 
    SQLite, armazena dados do cliente.
* **Servidor Web:** 
    Nginx, serve a API.## EndpointsA API possui os seguintes endpoints:
* **Transações:**
    * POST /clientes/[id]/transacoes
* **Extrato:**    
    * GET /clientes/[id]/extrato
## Requisitos
    * Docker instalado
    * Bash
    * Nginx
    * Java
## Uso
    docker compose up -d
## Autoescala
    A API utiliza o DeepAutoScale para autoescala vertical e horizontal. Os dados de treinamento para o DeepAutoScale estão armazenados na pasta `logs/data`.
    Uma vez construída a API basica, performatica, concorrente, operando, temos logs/data-sets para alimentar o modelo
## Equipe
    zeh sobrinho e uma caralhada de bot´s pacientes e zueiros
## Contato
    @trainsppotting

galo-sapiens-chat/
├── Dockerfile (ok)
├── README.md (ok)
├── api.bash  compilação bashC (performar ano nivel de rust,c, c++ e java empatados na #rinhabackend23)
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