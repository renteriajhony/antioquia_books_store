import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:provider/provider.dart'; // Ajusta el import según tu estructura

import 'package:antioquia_bookstore/antioquia_bookstore.dart';

import '../../api/store_api_test.mocks.dart';
import 'book_detail_page_test.mocks.dart'; // Archivo generado por mockito

@GenerateMocks([BooksProvider, MainProvider])
void main() {
  late MainProvider mockMainProvider;
  late MockBooksProvider mockBooksProvider;
  late MockDio mockDio;
  late StoreApi storeApi;
  late BaseOptions mockOptions;
  late Book mockBook;

  setUp(() {
    mockMainProvider = MockMainProvider();
    mockBooksProvider = MockBooksProvider();

    // Datos de ejemplo para el libro
    mockBook = Book(
      title: 'Flutter Development',
      subtitle: 'An advanced guide',
      isbn13: '9781234567890',
      image: '',
      price: '39.89',
      url: 'https://example.com/flutter_book.jpg',
    );
  });

  setUpAll(() {
    storeApi = StoreApi();
    mockDio = MockDio();
    mockOptions = BaseOptions();
    when(mockDio.options).thenReturn(mockOptions);
    mockBooksProvider = MockBooksProvider();
  });

  Widget createWidgetUnderTest() {
    return ChangeNotifierProvider<MainProvider>.value(
      value: mockMainProvider,
      child: ChangeNotifierProvider<BooksProvider>.value(
        value: mockBooksProvider,
        child: MaterialApp(
          home: BookDetailPage(
            book: mockBook,
          ),
        ),
      ),
    );
  }

  testWidgets('BookDetailPage shows book details correctly',
      (WidgetTester tester) async {
    // Simula que el detalle del libro fue llamado correctamente
    when(mockBooksProvider.getBookDetail(mockBook.isbn13))
        .thenAnswer((_) async => {});
    when(mockBooksProvider.isLoading).thenReturn(true);
    when(mockMainProvider.isDark).thenReturn(false);

    // Renderiza el widget
    await tester.pumpWidget(createWidgetUnderTest());

    // Verifica que se muestra la imagen del libro
    expect(find.byType(Hero), findsOneWidget);
    // expect(find.byType(Image), findsOneWidget);

    // Verifica que se muestran los detalles del libro (título, subtítulo)
    expect(find.text(mockBook.title), findsOneWidget);
    expect(find.text(mockBook.subtitle), findsOneWidget);
  });

  testWidgets('BookDetailPage calls getBookDetail on init',
      (WidgetTester tester) async {
    when(mockBooksProvider.getBookDetail(mockBook.isbn13))
        .thenAnswer((_) async => {});
    when(mockBooksProvider.isLoading).thenReturn(true);
    when(mockMainProvider.isDark).thenReturn(false);
    // Renderiza el widget
    await tester.pumpWidget(createWidgetUnderTest());

    // Verifica que getBookDetail fue llamado una vez con el ISBN correcto
    verify(mockBooksProvider.getBookDetail(mockBook.isbn13)).called(1);
  });
}
