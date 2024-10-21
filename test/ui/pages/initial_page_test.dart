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
  late StoreApi storeApi;
  late BaseOptions mockOptions;

  setUpAll(() {
    storeApi = StoreApi();
    mockDio = MockDio();
    mockOptions = BaseOptions();
    when(mockDio.options).thenReturn(mockOptions);
    mockMainProvider = MockMainProvider();
    mockBooksProvider = MockBooksProvider();
  });

  Widget createWidgetUnderTest() {
    return ChangeNotifierProvider<MockMainProvider>.value(
      value: mockMainProvider,
      child: ChangeNotifierProvider<BooksProvider>.value(
        value: mockBooksProvider,
        child: const MaterialApp(
          home: InitialPage(),
        ),
      ),
    );
  }
}
