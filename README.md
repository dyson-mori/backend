# Teste Técnico Pleno II • Ruby on Rails 7.2
Durante o desenvolvimento dessa aplicação, acabei criando o nome de ***Porcupine***.

### 📦 Instalando os Pacotes
Abra o `terminal` ou `CMD` do projeto e execute `bundle install` e depois `bundle lock --add-platform x86_64-linux` para instalar os pacotes do projeto.

### 📃 Criando as Variáveis
Com o `terminal` aberto, execute `touch .env.development` e `touch .env.test` e adicione essas variáveis a baixo.
```.env.development
POSTGRES_USER=backend_user
POSTGRES_PASSWORD=sq159aw753
POSTGRES_HOST=db
POSTGRES_PORT=5432
```
```.env.test
POSTGRES_USER=backend_user
POSTGRES_PASSWORD=sq159aw753
POSTGRES_DB=porcupine_database_test
POSTGRES_HOST=localhost
POSTGRES_PORT=5433
```

### 🐳 Criando o Banco de Desenvolvimento | Produção | Testes
Em seguida no mesmo `terminal` ou `CMD` do projeto, execute esses três comandos a baixo, em cada uma delas você adicionará `jwt_secret:"uma_chave_secreta"`

  Desenvolvimento: `EDITOR="code --wait" rails credentials:edit --environment development`<br />
  Chave Aleatória: `jwt_secret: "157-953"`

  Produção: `EDITOR="code --wait" rails credentials:edit --environment production`<br />
  Chave Aleatória: `jwt_secret: "147-963"`

  Testes: `EDITOR="code --wait" rails credentials:edit --environment test`<br />
  Chave Aleatória: `jwt_secret: "456-321"`

### 🐳 Criando os Containers no Docker
Agora execute `docker compose up --build` para criar o Container do projeto.

### 📅 Salvando as tabelas no Docker
Abra um novo `terminal` ou `CMD` e execute o comando `docker compose exec backend bundle exec rails db:migrate` para criar as tabelas no `🐳Docker`.

`docker compose exec backend bundle exec rails db:migrate RAILS_ENV=test`

### 🧪 Testes
Com o Docker e o terminal do projeto aberto, execute `bundle exec rspec --format documentation`
- [✔️] Testar criação de usuário
- [✔️] Testar login e geração de JWT
- [✔️] Testar rota /me com e sem token

### ✔️ Tasks
- [✔️] Registrar o usuário e retornar um token JWT.
- [✔️] Valida e retorna o JWT.
- [✔️] Usar Devise com JWT.
- [✔️] Implementar TDD com RSpec.
- [✔️] Endpoints necessários:
  - [✔️] POST /signup
  - [✔️] POST /login
  - [✔️] GET /me (requer autenticação via JWT)
