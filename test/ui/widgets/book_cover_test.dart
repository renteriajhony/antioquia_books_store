import 'package:antioquia_bookstore/antioquia_bookstore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late Book book;

  setUp(() {
    book = Book(
      title: 'Flutter Development',
      subtitle: 'An advanced guide',
      isbn13: '9781234567890',
      image: '',
      price: '39.89',
      url: 'https://example.com/flutter_book',
    );
  });

  testWidgets('BookCover shows book details correctly',
      (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: BookCover(book: book),
      ),
    ));

    expect(find.byType(Hero), findsOneWidget);
    expect(find.text(book.title), findsOneWidget);
    expect(find.text('Precio: ${book.price}'), findsOneWidget);
  });
}
