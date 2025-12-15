// Exercício 2: Contagem de registros das queries

// Query 1: Livros não publicados com pageCount < 300
db.Biblioteca.countDocuments({
  status: { $ne: "PUBLISH" },
  pageCount: { $lt: 300 }
})
// Resultado: 64 documentos

// Query 2: Livros com "MongoDB" E "SQL Server" no título
db.Biblioteca.countDocuments({
  $and: [
    { title: { $regex: "MongoDB", $options: "i" } },
    { title: { $regex: "SQL Server", $options: "i" } }
  ]
})
// Resultado: 0 documentos

// Query 3: ISBN começando com "18"
db.Biblioteca.countDocuments({
  isbn: { $regex: "^18" }
})
// Resultado: 47 documentos

// Query 4: "JAVA" ou "Mobile" na descrição
db.Biblioteca.countDocuments({
  longDescription: { $regex: "java|mobile", $options: "i" }
})
// Resultado: 122 documentos