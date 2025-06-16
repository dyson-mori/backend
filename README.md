# Teste Técnico Pleno II • Ruby on Rails 7.2
Durante o desenvolvimento deste projeto, criei uma documentação de instalação do Ruby on Rails, já que essa foi minha primeira experiência com o framework. O processo me ajudou a entender melhor o ecossistema Rails, e você pode conferir a documentação completa neste link:

🔗[Documentação](https://www.notion.so/Ruby-on-Rails-20291718819a80f48e19e78fb74058db?source=copy_link)

### 📦 Instalação dos Pacotes
No `terminal` ou `CMD` do projeto, execute:
```bash
bundle install
```
depois
```bash
  bundle lock --add-platform x86_64-linux
```
O primeiro comando instala as dependências do projeto, enquanto o segundo garante a compatibilidade com o ambiente Linux.

### 📃 Configuração de Variáveis de Ambiente
Crie os seguintes arquivos:

```bash
touch .env .env.production .env.db
```

E adicione os respectivos conteúdos:

```bash
# .env - Ambiente de Desenvolvimento
POSTGRES_USER=backend_user
POSTGRES_PASSWORD=sq159aw753
POSTGRES_HOST=localhost
POSTGRES_PORT=5432
POSTGRES_DB=porcupine_database
```
```bash
# .env.production - Ambiente de Produção
POSTGRES_USER=backend_user
POSTGRES_PASSWORD=sq159aw753
POSTGRES_HOST=db
POSTGRES_PORT=5432
POSTGRES_DB=porcupine_database
RAILS_ENV=production
DATABASE_URL=postgres://backend_user:sq159aw753@db:5432/porcupine_database
```
```bash
# .env.db - Configuração do Container PostgreSQL
POSTGRES_USER=backend_user
POSTGRES_PASSWORD=sq159aw753
POSTGRES_DB=porcupine_database
```

### 🐳 Iniciando um Container PostgreSQL
Execute o comando abaixo para iniciar um container PostgreSQL local para desenvolvimento:
``` bash
docker run --name porcupine \
  -e POSTGRES_PASSWORD=sq159aw753 \
  -e POSTGRES_USER=backend_user \
  -e POSTGRES_DB=porcupine_database \
  -p 5432:5432 \
  -d postgres
```

### 🔑 Gerando Credenciais de Ambiente (Rails Credentials)
Execute os comandos abaixo para criar chaves de autenticação personalizadas para cada ambiente:

Desenvolvimento
```bash
EDITOR="code --wait" rails credentials:edit --environment development
```
Conteúdo sugerido:
```bash
jwt_secret: "157-953-759-153-684-842-426-268"
```

Produção
```bash
EDITOR="code --wait" rails credentials:edit --environment production
```
Conteúdo sugerido:
```bash
jwt_secret: "258-963-741-789-123-456-842-862"
```

Testes
```bash
EDITOR="code --wait" rails credentials:edit --environment test
```
Conteúdo sugerido:
```bash
jwt_secret: "951-753-852-147-369-456-426-862"
```

### 🧪 Rodando os Testes
Com o Docker em execução, prepare o banco de dados de testes e execute os testes com os comandos:
```bash
rails db:test:prepare
```
```bash
bundle exec rspec --format documentation
```

### 🐳 Subindo o Projeto no Docker
Para iniciar o ambiente completo, execute:
```bash
docker compose up --build
```

### ✔️ Tasks
- [✔️] Registrar o usuário e retornar um token JWT.
- [✔️] Valida e retorna o JWT.
- [✔️] Usar Devise com JWT.
- [✔️] Implementar TDD com RSpec.
- [✔️] Endpoints necessários:
  - [✔️] POST /signup
  - [✔️] POST /login
  - [✔️] GET /me (requer autenticação via JWT)