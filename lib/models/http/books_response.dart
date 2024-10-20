import 'dart:convert';

import '../book.dart';

class BooksResponse {
  final List<Book> books;
  final String? error;
  final String? total;
  final String? page;

  BooksResponse({
    required this.books,
    this.error,
    this.total,
    this.page,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'books': books.map((x) => x.toMap()).toList(),
      'error': error,
      'total': total,
      'page': page,
    };
  }

  factory BooksResponse.fromMap(Map<String, dynamic> map) {
    return BooksResponse(
      books: List<Book>.from(
        map['books'].map(
          (x) => Book.fromMap(x as Map<String, dynamic>),
        ),
      ),
      error: map['error'] != null ? map['error'] as String : null,
      total: map['total'] != null ? map['total'] as String : null,
      page: map['page'] != null ? map['page'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory BooksResponse.fromJson(String source) =>
      BooksResponse.fromMap(json.decode(source) as Map<String, dynamic>);
}
