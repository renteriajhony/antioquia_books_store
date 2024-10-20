import 'dart:convert';

import 'package:antioquia_bookstore/models/http/book_detail_response.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('BookDetailResponse', () {
    test('can be initialized from a map', () {
      final map = {
        'error': 'error',
        'title': 'title',
        'subtitle': 'subtitle',
        'authors': 'authors',
        'publisher': 'publisher',
        'language': 'language',
        'isbn10': 'isbn10',
        'isbn13': 'isbn13',
        'pages': 'pages',
        'year': 'year',
        'rating': 'rating',
        'desc': 'desc',
        'price': 'price',
        'image': 'image',
        'url': 'url',
      };
      final bookDetailResponse = BookDetailResponse.fromMap(map);
      expect(bookDetailResponse.error, 'error');
      expect(bookDetailResponse.title, 'title');
      expect(bookDetailResponse.subtitle, 'subtitle');
      expect(bookDetailResponse.authors, 'authors');
      expect(bookDetailResponse.publisher, 'publisher');
      expect(bookDetailResponse.language, 'language');
      expect(bookDetailResponse.isbn10, 'isbn10');
      expect(bookDetailResponse.isbn13, 'isbn13');
      expect(bookDetailResponse.pages, 'pages');
      expect(bookDetailResponse.year, 'year');
      expect(bookDetailResponse.rating, 'rating');
      expect(bookDetailResponse.desc, 'desc');
      expect(bookDetailResponse.price, 'price');
      expect(bookDetailResponse.image, 'image');
      expect(bookDetailResponse.url, 'url');
    });

    test('can be converted to a map', () {
      final bookDetailResponse = BookDetailResponse(
        error: 'error',
        title: 'title',
        subtitle: 'subtitle',
        authors: 'authors',
        publisher: 'publisher',
        language: 'language',
        isbn10: 'isbn10',
        isbn13: 'isbn13',
        pages: 'pages',
        year: 'year',
        rating: 'rating',
        desc: 'desc',
        price: 'price',
        image: 'image',
        url: 'url',
        pdf: {'key': 'value'},
      );
      final map = bookDetailResponse.toMap();
      expect(map['error'], 'error');
      expect(map['title'], 'title');
      expect(map['subtitle'], 'subtitle');
      expect(map['authors'], 'authors');
      expect(map['publisher'], 'publisher');
      expect(map['language'], 'language');
      expect(map['isbn10'], 'isbn10');
      expect(map['isbn13'], 'isbn13');
      expect(map['pages'], 'pages');
      expect(map['year'], 'year');
      expect(map['rating'], 'rating');
      expect(map['desc'], 'desc');
      expect(map['price'], 'price');
      expect(map['image'], 'image');
      expect(map['url'], 'url');
      expect(map['pdf'], {'key': 'value'});
    });

    test('can be converted to JSON and back', () {
      final bookDetailResponse = BookDetailResponse(
        error: 'error',
        title: 'title',
        subtitle: 'subtitle',
        authors: 'authors',
        publisher: 'publisher',
        language: 'language',
        isbn10: 'isbn10',
        isbn13: 'isbn13',
        pages: 'pages',
        year: 'year',
        rating: 'rating',
        desc: 'desc',
        price: 'price',
        image: 'image',
        url: 'url',
        pdf: {'key': 'value'},
      );
      final json = bookDetailResponse.toJson();
      final bookDetailResponseFromJson = BookDetailResponse.fromJson(json);
      expect(bookDetailResponseFromJson.authors, bookDetailResponse.authors);
    });
  });
}
