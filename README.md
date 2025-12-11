# SQL - Exercícios e Setup

Repositório com exercícios do módulo SQL do curso EBAC.

## Estrutura

- `sakila-db/` - Arquivos do banco de dados Sakila
- `exercicios/SQL/` - Exercícios SQL
- `exercicios/NoSQL/` - Exercícios NoSQL (em breve)

## Setup do Banco Sakila

### Com Docker (Recomendado)
```bash
# Criar container MySQL
docker run -p 3306:3306 \
  -e MYSQL_ROOT_PASSWORD=ebac \
  -e MYSQL_DATABASE=sakila \
  --name db \
  -d mysql:8.0

# Importar banco Sakila
docker exec -i db mysql -uroot -pebac sakila < sakila-db/sakila-schema.sql
docker exec -i db mysql -uroot -pebac sakila < sakila-db/sakila-data.sql
```

### Conexão no VS Code

- Host: 127.0.0.1
- Porta: 3306
- Usuário: root
- Senha: ebac
- Banco: sakila

## Exercícios

- **Exercício 1**: Queries básicas com JOINs
- **Exercício 2**: Contagem de registrosS