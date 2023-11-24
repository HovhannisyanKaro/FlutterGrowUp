import 'package:dio/dio.dart';

import '../api/retrofit/api_service.dart';

class MySingleton {
  MySingleton._();

  static final MySingleton _instance = MySingleton._();
  static MySingleton get instance => _instance;

  final Dio _dio = Dio();
  late final ApiService apiService = ApiService(_dio);

  void test() {}
}

void forTesting() {
  MySingleton.instance.test();
}