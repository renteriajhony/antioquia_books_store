# antioquia_bookstore

A new Flutter project.

## Reto tecnico
La Librería de Antioquia requiere ofrecer a sus clientes una aplicación móvil para la búsqueda de libros de tecnología.

 

Esta debe tener las siguientes funcionalidades:

 

Poseer un buscador donde se ingrese el nombre del libro a consultar.

Mostrar el listado de libros encontrados.

Al seleccionar un libro de la lista, debe presentar el detalle de este junto a la imagen asociada.

Almacenar en memoria caché las 5 últimas búsquedas para agilizar la consulta. No implica guardar el listado, solo el criterio o tecnología, ej: php

 

Realizar un diseño de la arquitectura propuesta para la aplicación teniendo en cuenta una arquitectura en nube (preferiblemente componentes en AWS) y donde se tuviera que construir el back que soporta la información de los libros y expone las apis que permiten resolver las funcionalidades mencionadas en los puntos anteriores.

 

Implementar la aplicación en flutter utilizando arquitectura limpia y pruebas unitarias (por lo menos un 30 o 40% de cobertura).

 

La API establecida para las consultas se encuentra descrita en https://api.itbook.store/

  

A considerar: Se evalúa buenas prácticas de desarrollo.

 

Por favor indicar la url del repositorio Git para la revisión de esta.

## Github

[Repositorio para clonar app ](https://github.com/renteriajhony/antioquia_books_store)

![alt text](https://github.com/renteriajhony/antioquia_books_store/blob/main/resource/1.png?raw=true)

![alt text](https://github.com/renteriajhony/antioquia_books_store/blob/main/resource/2.png?raw=true)

![alt text](https://github.com/renteriajhony/antioquia_books_store/blob/main/resource/6.png?raw=true)


## Run App
create the ```.env``` file and use the ```.env.dev``` reference file to populate the variables with production data.
```bash
flutter run
```

## Unit test
### Required lcov 

```bash
# On macos 
brew install lcov  
# On windows 
sudo apt-get update sudo apt-get install lcov
```

### Run unit test
```bash
flutter test --coverage test/widget_test.dart && genhtml coverage/lcov.info -o coverage/html && open coverage/html/index.html
```


### Books Response

```json
{
  "error": "0",
  "total": "80",
  "page": "1",
  "books": [
    {
      "title": "MongoDB in Action, 2nd Edition",
      "subtitle": "Covers MongoDB version 3.0",
      "isbn13": "9781617291609",
      "price": "$19.99",
      "image": "https://itbook.store/img/books/9781617291609.png",
      "url": "https://itbook.store/books/9781617291609"
    },
    {
      "title": "MongoDB and Python",
      "subtitle": "Patterns and processes for the popular document-oriented database",
      "isbn13": "9781449310370",
      "price": "$6.88",
      "image": "https://itbook.store/img/books/9781449310370.png",
      "url": "https://itbook.store/books/9781449310370"
    },
    {
      "title": "Building Node Applications with MongoDB and Backbone",
      "subtitle": "Rapid Prototyping and Scalable Deployment",
      "isbn13": "9781449337391",
      "price": "$4.85",
      "image": "https://itbook.store/img/books/9781449337391.png",
      "url": "https://itbook.store/books/9781449337391"
    },
  ]
}

```
### Book_Details Response

```json
{
  "error": "0",
  "title": "MongoDB in Action, 2nd Edition",
  "subtitle": "Covers MongoDB version 3.0",
  "authors": "Kyle Banker, Peter Bakkum, Shaun Verch, Douglas Garrett, Tim Hawkins",
  "publisher": "Manning",
  "language": "English",
  "isbn10": "1617291609",
  "isbn13": "9781617291609",
  "pages": "480",
  "year": "2016",
  "rating": "4",
  "desc": "MongoDB in Action, 2nd Edition is a completely revised and updated version. It introduces MongoDB 3.0 and the document-oriented database model. This perfectly paced book gives you both the big picture you&#039;ll need as a developer and enough low-level detail to satisfy system engineers.MongoDB in ...",
  "price": "$19.99",
  "image": "https://itbook.store/img/books/9781617291609.png",
  "url": "https://itbook.store/books/9781617291609",
  "pdf": {
    "Chapter 1": "https://itbook.store/files/9781617291609/chapter1.pdf",
    "Chapter 4": "https://itbook.store/files/9781617291609/chapter4.pdf"
  }
}
```