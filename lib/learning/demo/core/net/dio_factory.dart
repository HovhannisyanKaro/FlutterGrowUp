import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioClient {
  late String baseUrl;
  late Dio? dio;

  DioClient({this.dio, required this.baseUrl});

  Future<Dio?> getDio() async {
    dio?.options = BaseOptions(baseUrl: baseUrl);
    if (!kReleaseMode) {
      dio!.interceptors.add(PrettyDioLogger(
          requestHeader: true, requestBody: true, responseHeader: true));
    }
    return dio;
  }
}