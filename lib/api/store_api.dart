import 'dart:io';

import 'package:dio/dio.dart';

class StoreApi {
  static final Dio _dio = Dio();

  static void configureDio() {
    // Base url
    _dio.options.baseUrl = 'https://api.itbook.store/1.0/';

    // Configurar Headres
    _dio.options.headers = {
      // 'x-token': LocalStorage.prefs.get('token') ?? '',
    };
  }

  static Future<Map<String, dynamic>> httpGet(String path) async {
    try {
      final resp = await _dio.get(path);
      return resp.data;
    } on DioException catch (e) {
      print(e.error);
      throw HttpException('Error get $e');
    }
  }
}
