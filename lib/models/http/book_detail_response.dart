class BookDetailResponse {
  BookDetailResponse({
    required this.error,
    required this.title,
    required this.subtitle,
    required this.authors,
    required this.publisher,
    required this.language,
    required this.isbn10,
    required this.isbn13,
    required this.pages,
    required this.year,
    required this.rating,
    required this.desc,
    required this.price,
    required this.image,
    required this.url,
    required this.pdf,
  });

  String error;
  String title;
  String subtitle;
  String authors;
  String publisher;
  String language;
  int isbn10;
  int isbn13;
  int pages;
  int year;
  int rating;
  String desc;
  String price;
  String image;
  String url;
  Map<String, String> pdf;
}

// {
// "error": "0",
// "title": "MongoDB in Action, 2nd Edition",
// "subtitle": "Covers MongoDB version 3.0",
// "authors": "Kyle Banker, Peter Bakkum, Shaun Verch, Douglas Garrett, Tim Hawkins",
// "publisher": "Manning",
// "language": "English",
// "isbn10": "1617291609",
// "isbn13": "9781617291609",
// "pages": "480",
// "year": "2016",
// "rating": "4",
// "desc": "MongoDB in Action, 2nd Edition is a completely revised and updated version. It introduces MongoDB 3.0 and the document-oriented database model. This perfectly paced book gives you both the big picture you&#039;ll need as a developer and enough low-level detail to satisfy system engineers.MongoDB in ...",
// "price": "$19.99",
// "image": "https://itbook.store/img/books/9781617291609.png",
// "url": "https://itbook.store/books/9781617291609",
// "pdf": {
// "Chapter 1": "https://itbook.store/files/9781617291609/chapter1.pdf",
// "Chapter 4": "https://itbook.store/files/9781617291609/chapter4.pdf"
// }
// }