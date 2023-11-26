import 'package:fluttertest/learning/demo/modules/casino/repository/repository_impl.dart';

import '../../core/utils/network_resource.dart';

class CasinoManager {
  CasinoManager._();

  static final CasinoManager _instance = CasinoManager._();

  factory CasinoManager() => _instance;

  final repo = CasinoRepositoryImpl();

  Future<NetworkResource<String>> getCasinoGames({
    int partnerId = 1,
    String lang = 'eng',
    int isMobile = 1,
    String country = 'AM',
    int limit = 4,
  }) async {
    return await repo.getGames(partnerId: partnerId, lang: lang, isMobile: isMobile, country: country, limit: limit);
  }

  //TODO: remove testOfUsage fun
  void testOfUsage() async {
    final result = await getCasinoGames();
    switch (result.status) {
      case Status.success:
        updateState();
      case Status.error:
        updateState();
      case Status.loading:
        updateState();
    }
  }

  void updateState() {
    //Todo('Not Implemented Yet')
  }
}
