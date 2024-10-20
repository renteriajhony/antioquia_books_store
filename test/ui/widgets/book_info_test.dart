import 'package:antioquia_bookstore/antioquia_bookstore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:provider/provider.dart';

import 'book_info_test.mocks.dart';

@GenerateMocks([BooksProvider])
void main() {
  late MockBooksProvider mockBooksProvider;

  setUp(() {
    mockBooksProvider = MockBooksProvider();
  });

  Widget createWidgetUnderTest() => MaterialApp(
        home: ChangeNotifierProvider<BooksProvider>.value(
          value: mockBooksProvider,
          child: const MaterialApp(
            home: Scaffold(
              body: BookInfo(),
            ),
          ),
        ),
      );

  testWidgets('should show CircularProgressIndicator when isLoading is true',
      (WidgetTester tester) async {
    when(mockBooksProvider.isLoading).thenReturn(true);

    await tester.pumpWidget(createWidgetUnderTest());

    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  });

  testWidgets('should show book details when isLoading is false',
      (WidgetTester tester) async {
    when(mockBooksProvider.isLoading).thenReturn(false);
    when(mockBooksProvider.bookDetailResponse).thenReturn(
      BookDetailResponse(
        error: '0',
        title: 'HolaMundo',
        subtitle: 'Subtitle',
        authors: 'Douglas Adams',
        publisher: 'Pan Books',
        language: 'English',
        isbn10: '0330258648',
        isbn13: '978-0330258647',
        pages: '224',
        year: '1979',
        rating: '4.2',
        desc:
            'HolaMundo is a comic science fiction series created by Douglas Adams.',
        price: '10.00',
        image:
            'https://upload.wikimedia.org/wikipedia/en/b/bd/H2G2_UK_front_cover.jpg',
        url:
            'https://www.amazon.com/Hitchhikers-Guide-Galaxy-Douglas-Adams/dp/0330258648',
        pdf: {},
      ),
    );

    await tester.pumpWidget(createWidgetUnderTest());

    expect(find.byKey(const Key('rich_text_author')), findsOneWidget);
    // expect(find.text('Douglas Adams'), findsOneWidget);
    // expect(find.text('Pan Books'), findsOneWidget);
    // expect(find.text('English'), findsOneWidget);
    // expect(find.text('224'), findsOneWidget);
    // expect(find.text('1979'), findsOneWidget);
    // expect(find.text('4.2'), findsOneWidget);
    // expect(find.text('10.00'), findsOneWidget);
    // expect(
    //     find.text(
    //         'HolaMundo is a comic science fiction series created by Douglas Adams.'),
    //     findsOneWidget);
    // expect(
    //     find.text(
    //         'https://www.amazon.com/Hitchhikers-Guide-Galaxy-Douglas-Adams/dp/0330258648'),
    //     findsOneWidget);
  });
}
