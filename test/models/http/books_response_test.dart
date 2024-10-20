import 'package:antioquia_bookstore/models/book.dart';
import 'package:antioquia_bookstore/models/http/books_response.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('BooksResponse', () {
    test('toMap returns a map with the correct values', () {
      final booksResponse = BooksResponse(
        books: [
          Book(
            title: 'title',
            subtitle: 'subtitle',
            isbn13: 'isbn13',
            price: 'price',
            image: 'image',
            url: 'url',
          ),
        ],
        error: 'error',
        total: 'total',
        page: 'page',
      );
      final map = booksResponse.toMap();
      expect(map['books'], [
        {
          'title': 'title',
          'subtitle': 'subtitle',
          'isbn13': 'isbn13',
          'price': 'price',
          'image': 'image',
          'url': 'url',
        }
      ]);
      expect(map['error'], 'error');
      expect(map['total'], 'total');
      expect(map['page'], 'page');
    });

    test('fromMap creates a BooksResponse instance from a map', () {
      final map = {
        'books': [
          {
            'title': 'title',
            'subtitle': 'subtitle',
            'isbn13': 'isbn13',
            'price': 'price',
            'image': 'image',
            'url': 'url',
          }
        ],
        'error': 'error',
        'total': 'total',
        'page': 'page',
      };
      final booksResponse = BooksResponse.fromMap(map);
      expect(booksResponse.books.length, 1);
      expect(booksResponse.error, 'error');
      expect(booksResponse.total, 'total');
      expect(booksResponse.page, 'page');
    });

    test('toJson returns a JSON string representation of the BooksResponse',
        () {
      final booksResponse = BooksResponse(
        books: [
          Book(
            title: 'title',
            subtitle: 'subtitle',
            isbn13: 'isbn13',
            price: 'price',
            image: 'image',
            url: 'url',
          ),
        ],
        error: 'error',
        total: 'total',
        page: 'page',
      );
      final json = booksResponse.toJson();
      expect(json,
          '{"books":[{"title":"title","subtitle":"subtitle","isbn13":"isbn13","price":"price","image":"image","url":"url"}],"error":"error","total":"total","page":"page"}');
    });

    test('fromJson creates a BooksResponse instance from a JSON string', () {
      const json =
          '{"books":[{"title":"title","subtitle":"subtitle","isbn13":"isbn13","price":"price","image":"image","url":"url"}],"error":"error","total":"total","page":"page"}';
      final booksResponse = BooksResponse.fromJson(json);
      expect(booksResponse.books.length, 1);
      expect(booksResponse.error, 'error');
      expect(booksResponse.total, 'total');
      expect(booksResponse.page, 'page');
    });
  });
}
