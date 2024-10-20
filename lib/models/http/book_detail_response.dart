import 'dart:convert';

class BookDetailResponse {
  BookDetailResponse({
    this.error,
    this.title,
    this.subtitle,
    this.authors,
    this.publisher,
    this.language,
    this.isbn10,
    required this.isbn13,
    this.pages,
    this.year,
    this.rating,
    this.desc,
    this.price,
    this.image,
    this.url,
    this.pdf,
  });

  String? error;
  String? title;
  String? subtitle;
  String? authors;
  String? publisher;
  String? language;
  String? isbn10;
  String? isbn13;
  String? pages;
  String? year;
  String? rating;
  String? desc;
  String? price;
  String? image;
  String? url;
  Map<String, String>? pdf;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'error': error,
      'title': title,
      'subtitle': subtitle,
      'authors': authors,
      'publisher': publisher,
      'language': language,
      'isbn10': isbn10,
      'isbn13': isbn13,
      'pages': pages,
      'year': year,
      'rating': rating,
      'desc': desc,
      'price': price,
      'image': image,
      'url': url,
      'pdf': pdf,
    };
  }

  factory BookDetailResponse.fromMap(Map<String, dynamic> map) {
    return BookDetailResponse(
      error: map['error'] != null ? map['error'] as String : null,
      title: map['title'] != null ? map['title'] as String : null,
      subtitle: map['subtitle'] != null ? map['subtitle'] as String : null,
      authors: map['authors'] != null ? map['authors'] as String : null,
      publisher: map['publisher'] != null ? map['publisher'] as String : null,
      language: map['language'] != null ? map['language'] as String : null,
      isbn10: map['isbn10'] != null ? map['isbn10'] as String : null,
      isbn13: map['isbn13'] != null ? map['isbn13'] as String : null,
      pages: map['pages'] != null ? map['pages'] as String : null,
      year: map['year'] != null ? map['year'] as String : null,
      rating: map['rating'] != null ? map['rating'] as String : null,
      desc: map['desc'] != null ? map['desc'] as String : null,
      price: map['price'] != null ? map['price'] as String : null,
      image: map['image'] != null ? map['image'] as String : null,
      url: map['url'] != null ? map['url'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory BookDetailResponse.fromJson(String source) =>
      BookDetailResponse.fromMap(json.decode(source) as Map<String, dynamic>);
}
