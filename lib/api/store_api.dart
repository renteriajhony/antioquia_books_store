import 'dart:io';

import 'package:dio/dio.dart';

class StoreApi {
  static late final Dio _dio;

  void configureDio({Dio? dio}) {
    _dio = dio ?? Dio();
    _dio.options.baseUrl = 'https://api.itbook.store/1.0/';
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
