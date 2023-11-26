import 'package:fluttertest/learning/demo/core/utils/network_resource.dart';

abstract interface class CasinoRepository {
  Future<NetworkResource<String>> getGames({
    int partnerId = 1,
    String lang = 'eng',
    int isMobile = 1,
    String country = 'AM',
    int limit = 4,
  });
}