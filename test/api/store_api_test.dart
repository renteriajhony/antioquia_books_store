import 'dart:io';

import 'package:antioquia_bookstore/api/store_api.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart'; // Ajusta el import según tu estructura
import 'store_api_test.mocks.dart'; // Importa el archivo generado por Mockito

@GenerateMocks([Dio])
void main() {
  late StoreApi storeApi;
  late MockDio mockDio;
  late BaseOptions mockOptions;

  setUpAll(() {
    storeApi = StoreApi();
    mockDio = MockDio();
    mockOptions = BaseOptions();
    when(mockDio.options).thenReturn(mockOptions);
    storeApi.configureDio(dio: mockDio);
  });

  test('httpGet returns data when Dio request is successful', () async {
    // Define la respuesta simulada
    final mockResponse = Response(
      requestOptions: RequestOptions(path: '/books'),
      data: {'success': true, 'books': []},
      statusCode: 200,
    );

    // Simula el comportamiento del método get de Dio
    when(mockDio.get('/books')).thenAnswer((_) async => mockResponse);

    // Llama al método y comprueba el resultado
    final result = await storeApi.httpGet('/books');
    expect(result, {'success': true, 'books': []});
  });

  test('httpGet throws HttpException when Dio request fails', () async {
    // Simula un error en el método get de Dio
    when(mockDio.get('/books')).thenThrow(
        DioException(requestOptions: RequestOptions(path: '/books')));

    // Verifica que se lance una excepción
    expect(() => storeApi.httpGet('/books'), throwsA(isA<HttpException>()));
  });
}
