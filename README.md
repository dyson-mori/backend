# Teste Técnico Pleno II • Ruby on Rails 7.2
Durante o desenvolvimento desse projeto acabei criando uma documentação instalação do Ruby on Rails.
O motivo é que eu nunca tinha usado esse framework então acabei estudando um pouco mais sobre ele e criando essa [Documentação](https://www.notion.so/Ruby-on-Rails-20291718819a80f48e19e78fb74058db?source=copy_link)

### 📦 Instalando os Pacotes
Abra o `terminal` ou `CMD` do projeto e execute `bundle install` e depois `bundle lock --add-platform x86_64-linux` para instalar os pacotes do projeto.

### 📃 Criando as Variáveis
Com o `terminal` aberto, execute `touch .env` e adicione essas variáveis a baixo.
```shell
POSTGRES_USER=backend_user
POSTGRES_PASSWORD=sq159aw753
POSTGRES_HOST=localhost
POSTGRES_PORT=5432
POSTGRES_DB=porcupine_database
```

### 🐳 Iniciando um Container PostgreSQL
No seu `terminal` execute esse comando a baixo para criar um container onde ficará o seu banco para que assim você possa testar sua aplicação localmente.
```
docker run --name porcupine \
  -e POSTGRES_PASSWORD=sq159aw753 \
  -e POSTGRES_USER=backend_user \
  -e POSTGRES_DB=porcupine_database \
  -p 5432:5432 \
  -d postgres
```

### 🔑 Criando as chaves de Desenvolvimento | Produção | Testes
Em seguida no mesmo `terminal` ou `CMD` do projeto, execute esses três comandos a baixo, em cada uma delas você adicionará `jwt_secret:"uma_chave_secreta"`

  Desenvolvimento: `EDITOR="code --wait" rails credentials:edit --environment development`<br />
  Chave Aleatória: `jwt_secret: "157-953"`

  Produção: `EDITOR="code --wait" rails credentials:edit --environment production`<br />
  Chave Aleatória: `jwt_secret: "147-963"`

  Testes: `EDITOR="code --wait" rails credentials:edit --environment test`<br />
  Chave Aleatória: `jwt_secret: "456-321"`

### 🧪 Testes
Com o Docker e o terminal do projeto aberto, execute `rails db:test:prepare` e em seguida `bundle exec rspec --format documentation` para ver os testes rodar.
- [✔️] Testar criação de usuário
- [✔️] Testar login e geração de JWT
- [✔️] Testar rota /me com e sem token

### 🐳 Subindo o Projeto no Docker
Agora execute `docker compose up --build` para criar o Container do projeto.

### 📅 Modo de uso

### ✔️ Tasks
- [✔️] Registrar o usuário e retornar um token JWT.
- [✔️] Valida e retorna o JWT.
- [✔️] Usar Devise com JWT.
- [✔️] Implementar TDD com RSpec.
- [✔️] Endpoints necessários:
  - [✔️] POST /signup
  - [✔️] POST /login
  - [✔️] GET /me (requer autenticação via JWT)