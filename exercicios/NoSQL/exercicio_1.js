// Exercício 1: Queries do banco books.json (MongoDB)

// Query 1: Livros não publicados com pageCount < 300
db.Biblioteca.find({
  status: { $ne: "PUBLISH" },
  pageCount: { $lt: 300 }
})

// Query 2: Livros com "MongoDB" E "SQL Server" no título
db.Biblioteca.find({
  $and: [
    { title: { $regex: "MongoDB", $options: "i" } },
    { title: { $regex: "SQL Server", $options: "i" } }
  ]
})

// Query 3: ISBN começando com "18" (expressão regular)
db.Biblioteca.find({
  isbn: { $regex: "^18" }
})

// Query 4: "JAVA" ou "Mobile" na descrição (case insensitive)
db.Biblioteca.find({
  longDescription: { $regex: "java|mobile", $options: "i" }
})