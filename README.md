# Projeto 02: Infraestrutura Automatizada WordPress (Vagrant + Ansible + Docker)

Este projeto foi desenvolvido individualmente para a disciplina de **Administração de Sistemas Abertos (Período 2026.1)** no Instituto Federal da Paraíba (IFPB). O objetivo principal é criar uma infraestrutura totalmente automatizada via código (Infrastructure as Code) para rodar uma aplicação WordPress protegida por um Proxy Reverso/Load Balancer Nginx.

---

## 🛠️ Pré-requisitos

Antes de iniciar, certifique-se de ter instalado em seu computador:

* [Vagrant](https://www.vagrantup.com/)
* [VirtualBox](https://www.virtualbox.org/)
* [Ansible](https://www.ansible.com/) *(instalado no ambiente host)*

---

## 🧭 Passo a Passo para Execução

### 1. Clonar o Repositório

Abra o terminal do seu computador e execute os comandos:

```bash
git clone https://github.com/victorfariaz/projeto-docker-vagrant.git
cd projeto-docker-vagrant

```

### 2. Inicializar a Infraestrutura

Para criar a máquina virtual, instalar as dependências e subir os containers automaticamente, execute apenas:

```bash
vagrant up

```

### 3. Acessar o WordPress

Após a finalização do comando acima, abra o seu navegador e acesse:
👉 **`http://192.168.56.114:8080`**

Você será direcionado diretamente para a tela de instalação e configuração do WordPress!

---

## 📂 Estrutura e Arquivos do Projeto

O projeto é composto por apenas 4 arquivos principais de configuração, conforme exigido no edital:

* **`Vagrantfile`**: Responsável por criar e provisionar a máquina virtual Linux baseada na Box `debian/bookworm64` com 1024 MB de RAM, IP estático e chamada para o provisionador Ansible.
* **`playbook_ansible.yml`**: Automatiza a atualização do sistema operacional da VM, a instalação do Docker, Docker Compose e inicia a execução dos containers.
* **`docker-compose.yml`**: Define e orquestra a rede isolada (`wordpress`), os volumes persistentes (`app` e `my`) e os três containers da aplicação (`webproxy`, `webserver` e `database`).
* **`Dockerfile`**: Camada de receita que customiza a imagem oficial do Nginx adicionando ferramentas de rede e injetando as configurações de proxy.
* **`nginx.conf`**: Configuração técnica que dita o comportamento do Nginx.

---

## 🐳 Imagem Docker Personalizada

Como requisito do projeto, foi gerada uma imagem personalizada do Nginx, construída e publicada no Docker Hub:

🔗 **Repositório:** `victorfariaz/nginx-proxy-victor:latest`

### Características da Imagem:

* **Base:** `nginx:latest` (Debian-based).
* **Load Balance de Camada 4 (TCP):** Utiliza o bloco `stream` para escutar requisições na porta `8080` e encaminhá-las diretamente para o container `webserver` na porta `80`.
* **Ferramentas Inclusas:** Vem com os pacotes `iputils-ping` e `curl` previamente instalados para testes de conectividade internos.
