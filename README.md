# Ambiente de programação Web da GiuSoft
Para desenvolvimento Web com PHP 5.6.40 (com Apache) e MySQL 8.0.27

Este ambiente já vem pré-configurado com as características necessárias para o desenvolvimento web na GiuSoft, exemplo:

- Endereços de IP que simulam o ambiente de produção
- PHP com a versão de produção atual, e parâmetros modificados (short_open_tag, max_execution_time, memory_limit e error_reporting
- Apache com configuração semelhante)
- MySQL com a configuração adequada para interpretar corretamente os códigos de página (Collation e UTF)

## Requisitos

- Você já deve ter o Docker instalado (https://www.docker.com)
- Você já deve ter uma conta corportativa no Github e seu ambiente local já deverá estar configurado.

## Instalação

Digite:
```
mkdir -p ~/Projetos/giusoft
cd Projetos/giusoft
git clone https://github.com/giusoft/gs-docker-php56
cd gs-docker-php56
./instalar.sh
```

## Portas de acesso

Web: localhost:8080
MySQL: localhost:8036 (usuário root, sem senha)

