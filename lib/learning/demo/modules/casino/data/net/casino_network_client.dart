import 'package:dio/dio.dart';
import 'package:fluttertest/learning/demo/modules/casino/data/net/casino_network_web_service.dart';

class CasinoNetworkClient {
  CasinoNetworkClient._();

  static final CasinoNetworkClient _instance = CasinoNetworkClient._();
  factory CasinoNetworkClient() => _instance;

  final Dio _dio = Dio();
  late final CasinoNetworkWebService port = CasinoNetworkWebService(_dio);
}