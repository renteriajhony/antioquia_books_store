# antioquia_bookstore

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.


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