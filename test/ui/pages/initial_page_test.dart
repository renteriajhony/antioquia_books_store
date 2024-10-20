import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:provider/provider.dart'; // Ajusta el import según tu estructura

import 'package:antioquia_bookstore/antioquia_bookstore.dart';

import '../../api/store_api_test.mocks.dart';
import 'initial_page_test.mocks.dart'; // Archivo generado por mockito

@GenerateMocks([BooksProvider])
void main() {
  late MockBooksProvider mockBooksProvider;
  late MockDio mockDio;
  late StoreApi storeApi;
  late BaseOptions mockOptions;

  setUpAll(() {
    storeApi = StoreApi();
    mockDio = MockDio();
    mockOptions = BaseOptions();
    when(mockDio.options).thenReturn(mockOptions);
    mockBooksProvider = MockBooksProvider();
  });

  Widget createWidgetUnderTest() {
    return ChangeNotifierProvider<BooksProvider>.value(
      value: mockBooksProvider,
      child: const MaterialApp(
        home: InitialPage(),
      ),
    );
  }

  testWidgets('Shows CircularProgressIndicator when loading',
      (WidgetTester tester) async {
    // Simula que el proveedor está cargando y no tiene libros
    when(mockBooksProvider.isLoading).thenReturn(true);
    when(mockBooksProvider.books).thenReturn([]);

    // Renderiza el widget
    await tester.pumpWidget(createWidgetUnderTest());

    // Verifica que se muestre el indicador de carga
    expect(find.byType(CircularProgressIndicator), findsOneWidget);
    expect(find.text('No se encontraron libros'), findsNothing);
  });

  testWidgets('Shows "No se encontraron libros" when there are no books',
      (WidgetTester tester) async {
    // Simula que no está cargando pero no hay libros
    when(mockBooksProvider.isLoading).thenReturn(false);
    when(mockBooksProvider.books).thenReturn([]);

    // Renderiza el widget
    await tester.pumpWidget(createWidgetUnderTest());

    // Verifica que se muestre el mensaje de que no se encontraron libros
    expect(find.text('No se encontraron libros'), findsOneWidget);
    expect(find.byType(CircularProgressIndicator), findsNothing);
  });
}
