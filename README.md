# Teste Técnico Pleno II • Ruby on Rails 7.2
Durante o desenvolvimento dessa aplicação, acabei criando o nome de ***Porcupine***.

### 📦 Instalando os Pacotes
Abra o `terminal` ou `CMD` do projeto e execute `bundle install` para instalar os pacotes do projeto.

### 🐳 Criando os Containers no Docker
Com o `terminal` aberto, execute `docker compose up --build`, pronto.

### 🐳 Criando o Banco de Desenvolvimento | Produção | Testes
Abra um novo `terminal` ou `CMD` do projeto e execute esses três comandos a baixo, em cada uma delas você adicionará `jwt_secret:"uma_chave_secreta"`

  Desenvolvimento: `EDITOR="code --wait" rails credentials:edit --environment development`

  Produção: `EDITOR="code --wait" rails credentials:edit --environment production`

  Testes: `EDITOR="code --wait" rails credentials:edit --environment test`

Em seguida execute o comando `rails db:migrate` para criar as tabelas no `🐳Docker`.

### 🧪 Testes
Com o Docker e o terminal do projeto aberto, execute `bundle exec rspec --format documentation`
- [✔️] Testar criação de usuário
- [✔️] Testar login e geração de JWT
- [✔️] Testar rota /me com e sem token

### ✔️ Taks
- [✔️] Registrar o usuário e retornar um token JWT.
- [✔️] Valida e retorna o JWT.
- [✔️] Usar Devise com JWT.
- [✔️] Implementar TDD com RSpec.
- [✔️] Endpoints necessários:
  - [✔️] POST /signup
  - [✔️] POST /login
  - [✔️] GET /me (requer autenticação via JWT)
