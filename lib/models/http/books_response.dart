// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

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

  BooksResponse copyWith({
    List<Book>? books,
    String? error,
    String? total,
    String? page,
  }) {
    return BooksResponse(
      books: books ?? this.books,
      error: error ?? this.error,
      total: total ?? this.total,
      page: page ?? this.page,
    );
  }

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

  @override
  String toString() {
    return 'BooksResponse(books: $books, error: $error, total: $total, page: $page)';
  }

  @override
  bool operator ==(covariant BooksResponse other) {
    if (identical(this, other)) return true;

    return listEquals(other.books, books) &&
        other.error == error &&
        other.total == total &&
        other.page == page;
  }

  @override
  int get hashCode {
    return books.hashCode ^ error.hashCode ^ total.hashCode ^ page.hashCode;
  }
}
