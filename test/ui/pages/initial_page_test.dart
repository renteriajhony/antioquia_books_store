import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:provider/provider.dart'; // Ajusta el import según tu estructura

import 'package:antioquia_bookstore/antioquia_bookstore.dart';

import '../../api/store_api_test.mocks.dart';
import 'initial_page_test.mocks.dart'; // Archivo generado por mockito

@GenerateMocks([BooksProvider, MainProvider])
void main() {
  late MockMainProvider mockMainProvider;
  late MockBooksProvider mockBooksProvider;
  late MockDio mockDio;
  late BaseOptions mockOptions;

  setUpAll(() {
    mockDio = MockDio();
    mockOptions = BaseOptions();
    when(mockDio.options).thenReturn(mockOptions);
    mockMainProvider = MockMainProvider();
    mockBooksProvider = MockBooksProvider();
  });

  Widget createWidgetUnderTest() {
    return MultiProvider(
      providers: [
       ChangeNotifierProvider(lazy: false, create: (_) => BooksProvider()),
        ChangeNotifierProvider(lazy: false, create: (_) => MainProvider()),
      ],
      child: const MaterialApp(
        home: InitialPage(),
      ),
    );
  }

  testWidgets('Shows CircularProgressIndicator when loading',
      (WidgetTester tester) async {
    // Simula que el proveedor está cargando y no tiene libros
    when(mockMainProvider.isDark).thenReturn(false);
    when(mockBooksProvider.isLoading).thenReturn(true);
    when(mockBooksProvider.books).thenReturn([]);

    // Renderiza el widget
    await tester.pumpWidget(createWidgetUnderTest());

    // Verifica que se muestre el indicador de carga
    expect(find.byType(CircularProgressIndicator), findsOneWidget);
    expect(find.text('No se encontraron libros'), findsNothing);
  });
}
