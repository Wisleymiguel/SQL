# Banco de Dados SQL e NoSQL

Repositório com exercícios práticos do módulo de Banco de Dados do curso de Engenharia de Qualidade de Software da EBAC. Este projeto demonstra a aplicação de conceitos fundamentais tanto em bancos relacionais (SQL) quanto em bancos não relacionais (NoSQL).

## Sobre o Projeto

Este repositório contém a implementação de queries e análises de dados utilizando duas abordagens diferentes de armazenamento: o banco relacional MySQL com o dataset Sakila, e o banco não relacional MongoDB com o dataset de livros (books.json). A proposta é compreender as diferenças práticas entre estas tecnologias e suas aplicações específicas.

## Estrutura do Repositório

O projeto está organizado da seguinte forma:

```
SQL/
├── sakila-db/              # Arquivos do banco de dados Sakila
│   ├── sakila-schema.sql   # Estrutura das tabelas
│   └── sakila-data.sql     # Dados populados
├── exercicios/
│   ├── SQL/                # Exercícios com MySQL (SQL)
│   │   ├── exercicio_1.sql
│   │   └── exercicio_2.sql
│   └── NoSQL/              # Exercícios com MongoDB (NoSQL)
│       ├── exercicio_1.js
│       └── exercicio_2.js
└── README.md
```

## Tecnologias Utilizadas

### SQL (Banco Relacional)
- **MySQL 8.0**: Sistema de gerenciamento de banco de dados relacional
- **Docker**: Para containerização do ambiente MySQL
- **VS Code com extensão Database**: Interface para execução de queries

### NoSQL (Banco Não Relacional)
- **MongoDB 5.0**: Banco de dados orientado a documentos
- **MongoDB Compass**: Interface gráfica para visualização e queries
- **JavaScript**: Linguagem para queries no MongoDB

## Setup do Ambiente

### Configuração do MySQL com Docker

Para iniciar o ambiente MySQL com o banco Sakila, execute os seguintes comandos no terminal:

```bash
# Criar e iniciar o container MySQL
docker run -p 3306:3306 \
  -e MYSQL_ROOT_PASSWORD=ebac \
  -e MYSQL_DATABASE=sakila \
  --name db \
  -d mysql:8.0

# Aguardar 30 segundos para inicialização completa

# Importar o schema do banco Sakila
docker exec -i db mysql -uroot -pebac sakila < sakila-db/sakila-schema.sql

# Importar os dados do banco Sakila
docker exec -i db mysql -uroot -pebac sakila < sakila-db/sakila-data.sql
```

### Conexão no VS Code

Após iniciar o container, configure a conexão no VS Code com os seguintes parâmetros:

- **Host**: 127.0.0.1
- **Porta**: 3306
- **Usuário**: root
- **Senha**: ebac
- **Banco de dados**: sakila

### Configuração do MongoDB

Para os exercícios de NoSQL, você precisará ter o MongoDB instalado localmente ou em um container Docker. Utilize o MongoDB Compass para importar o arquivo books.json disponível no repositório da EBAC.

## Exercícios Realizados

### SQL - Banco Sakila

O banco de dados Sakila é um exemplo completo de um sistema de locadora de filmes, contendo 16 tabelas relacionadas com informações sobre filmes, atores, categorias, clientes e aluguéis.

**Exercício 1** implementa três queries principais que exploram relacionamentos entre tabelas usando JOINs:

A primeira query lista todos os filmes disponíveis juntamente com suas respectivas categorias. Esta consulta demonstra como relacionar dados entre as tabelas de filmes (film), categorias (category) e a tabela intermediária que conecta ambas (film_category). O resultado oferece uma visão completa do catálogo organizado por gênero.

A segunda query analisa a produtividade dos atores, contabilizando quantos filmes cada um participou. Os resultados são ordenados de forma decrescente, permitindo identificar rapidamente quais atores possuem a maior quantidade de participações no catálogo. Esta análise utiliza agregação de dados através da função COUNT combinada com GROUP BY.

A terceira query aplica um filtro adicional, focando especificamente em filmes com duração superior a 120 minutos. Esta consulta combina filtros WHERE com agregações GROUP BY para identificar quais atores trabalharam predominantemente em produções mais longas, oferecendo insights sobre os tipos de projetos em que cada ator se envolve.

**Exercício 2** complementa o primeiro ao adicionar queries de contagem, respondendo à pergunta: quantos registros foram retornados em cada uma das consultas anteriores? Estas contagens são essenciais para validar resultados e entender a dimensão dos dados com os quais estamos trabalhando.

### NoSQL - Coleção Books

O dataset books.json contém informações detalhadas sobre 431 livros, incluindo título, ISBN, descrição, número de páginas, status de publicação, autores e categorias. Este formato não relacional permite estruturas mais flexíveis, onde cada documento pode ter campos opcionais e arrays de dados aninhados.

**Exercício 1** explora diferentes tipos de filtros e buscas no MongoDB:

A primeira query utiliza operadores de comparação para encontrar livros que não estão com status "PUBLISH" e possuem menos de 300 páginas. O operador $ne (not equal) e $lt (less than) demonstram como o MongoDB lida com condições lógicas de forma intuitiva.

A segunda query implementa uma busca complexa usando expressões regulares, procurando livros cujos títulos contenham simultaneamente as palavras "MongoDB" e "SQL Server". Esta busca case-insensitive utiliza o operador $and para garantir que ambas as condições sejam atendidas, demonstrando capacidades avançadas de busca textual.

A terceira query apresenta o uso de expressões regulares para padrões específicos, buscando livros cujo ISBN começa com "18". O símbolo ^ na expressão regular indica o início da string, permitindo buscas precisas baseadas em padrões.

A quarta query combina busca textual com lógica OU, procurando livros que mencionem "JAVA" ou "Mobile" em suas descrições longas. O pipe (|) na expressão regular funciona como operador OR, e a flag "i" garante que a busca ignore diferenças entre maiúsculas e minúsculas.

**Exercício 2** repete cada uma das queries anteriores utilizando o método countDocuments(), retornando apenas a quantidade de documentos que atendem aos critérios especificados. Esta abordagem é mais eficiente quando precisamos apenas de estatísticas, sem necessidade de recuperar os documentos completos.

## Resultados Obtidos

### Queries SQL
- **Query 1**: 1000 registros (todos os filmes com suas categorias)
- **Query 2**: 200 atores com contagem de filmes
- **Query 3**: Atores com participação em filmes longos

### Queries NoSQL
- **Query 1**: 64 documentos (livros não publicados com menos de 300 páginas)
- **Query 2**: 0 documentos (nenhum livro contém ambos os termos no título)
- **Query 3**: 47 documentos (ISBNs iniciando com "18")
- **Query 4**: 122 documentos (livros sobre Java ou Mobile)

## Conceitos Aprendidos

Este projeto proporcionou experiência prática com conceitos fundamentais de banco de dados:

**SQL (Relacional)**: Compreendi como estruturar dados em tabelas normalizadas, utilizando chaves primárias e estrangeiras para estabelecer relacionamentos. Pratiquei o uso de JOINs para combinar informações de múltiplas tabelas, e funções de agregação como COUNT para análise estatística. A ordenação de resultados através de ORDER BY e o agrupamento com GROUP BY ficaram mais claros através da prática.

**NoSQL (Não Relacional)**: Aprendi a trabalhar com documentos JSON flexíveis, onde cada registro pode ter estrutura própria. Dominei o uso de operadores de comparação do MongoDB ($ne, $lt, $gt) e expressões regulares para buscas textuais avançadas. Entendi as diferenças de performance entre find() para recuperação completa de dados e countDocuments() para obtenção apenas de estatísticas.

**Diferenças Práticas**: Ficou evidente que bancos relacionais são ideais para dados estruturados com relacionamentos complexos, enquanto bancos não relacionais oferecem mais flexibilidade para dados semi-estruturados ou que mudam frequentemente. A escolha entre SQL e NoSQL depende fundamentalmente das necessidades específicas de cada aplicação.

## Como Executar os Exercícios

Para reproduzir os exercícios SQL, primeiro certifique-se de que o container Docker está em execução e o banco Sakila está importado. Em seguida, abra os arquivos .sql no VS Code e execute as queries utilizando a extensão Database.

Para os exercícios NoSQL, abra o MongoDB Compass, conecte-se ao servidor local, importe o arquivo books.json para a coleção Biblioteca, e execute as queries copiando o conteúdo dos arquivos .js para o campo de query do Compass.

## Solução de Problemas Comuns

Se você encontrar erro de acesso negado ao conectar no MySQL, verifique se o container foi criado com o parâmetro correto de autenticação. O comando de criação do container deve incluir `--default-authentication-plugin=mysql_native_password` para garantir compatibilidade com ferramentas externas.

Caso o MongoDB Compass não consiga importar o books.json, certifique-se de que o arquivo não está corrompido e que a coleção de destino está vazia antes da importação.

## Autor

**Wisley Miguel do Carmo Camilo**

Este projeto foi desenvolvido como parte do curso de Engenharia de Qualidade de Software da EBAC, demonstrando competências práticas em análise e manipulação de dados tanto em ambientes relacionais quanto não relacionais.

## Licença

Este projeto é de uso educacional, desenvolvido para fins de aprendizado e portfólio profissional.
