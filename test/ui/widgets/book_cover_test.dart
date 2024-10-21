import 'package:antioquia_bookstore/antioquia_bookstore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:provider/provider.dart';

import 'book_cover_test.mocks.dart';

@GenerateMocks([MainProvider])
void main() {
  late MainProvider mockMainProvider;
  late Book book;

  setUp(() {
    mockMainProvider = MockMainProvider();
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
    when(mockMainProvider.isDark).thenReturn(false);
    await tester.pumpWidget(ChangeNotifierProvider<MainProvider>.value(
      value: mockMainProvider,
      child: MaterialApp(
        home: Scaffold(
          body: BookCover(book: book),
        ),
      ),
    ));

    expect(find.byType(Hero), findsOneWidget);
    expect(find.text(book.title), findsOneWidget);
    expect(find.text('Precio: ${book.price}'), findsOneWidget);
  });
}
