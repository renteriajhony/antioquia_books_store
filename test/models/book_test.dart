import 'package:antioquia_bookstore/models/book.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Book', () {
    test('toMap returns a map with the correct values', () {
      final book = Book(
        title: 'title',
        subtitle: 'subtitle',
        isbn13: 'isbn13',
        price: 'price',
        image: 'image',
        url: 'url',
      );
      final map = book.toMap();
      expect(map['title'], 'title');
      expect(map['subtitle'], 'subtitle');
      expect(map['isbn13'], 'isbn13');
      expect(map['price'], 'price');
      expect(map['image'], 'image');
      expect(map['url'], 'url');
    });

    test('fromMap creates a Book instance from a map', () {
      final map = {
        'title': 'title',
        'subtitle': 'subtitle',
        'isbn13': 'isbn13',
        'price': 'price',
        'image': 'image',
        'url': 'url',
      };
      final book = Book.fromMap(map);
      expect(book.title, 'title');
      expect(book.subtitle, 'subtitle');
      expect(book.isbn13, 'isbn13');
      expect(book.price, 'price');
      expect(book.image, 'image');
      expect(book.url, 'url');
    });

    test('toJson returns a JSON string representation of the Book', () {
      final book = Book(
        title: 'title',
        subtitle: 'subtitle',
        isbn13: 'isbn13',
        price: 'price',
        image: 'image',
        url: 'url',
      );
      final json = book.toJson();
      expect(
        json,
        '{"title":"title","subtitle":"subtitle","isbn13":"isbn13","price":"price","image":"image","url":"url"}',
      );
    });

    test('fromJson creates a Book instance from a JSON string', () {
      final json =
          '{"title":"title","subtitle":"subtitle","isbn13":"isbn13","price":"price","image":"image","url":"url"}';
      final book = Book.fromJson(json);
      expect(book.title, 'title');
      expect(book.subtitle, 'subtitle');
      expect(book.isbn13, 'isbn13');
      expect(book.price, 'price');
      expect(book.image, 'image');
      expect(book.url, 'url');
    });
  });
}
