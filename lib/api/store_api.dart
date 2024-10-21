import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class StoreApi {
  static late final Dio _dio;

  void configureDio({Dio? dio}) {
    _dio = dio ?? Dio();
    _dio.options.baseUrl = dotenv.env['BASE_URL'] ?? '';
    _dio.options.headers = {};
  }

  Future<Map<String, dynamic>> httpGet(String path) async {
    try {
      final resp = await _dio.get(path);
      return resp.data;
    } on DioException catch (e) {
      throw HttpException('Error get $e');
    }
  }
}
