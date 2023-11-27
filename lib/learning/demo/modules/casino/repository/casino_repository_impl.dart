import 'package:fluttertest/learning/demo/core/utils/extensions/stream_extension.dart';
import 'package:fluttertest/learning/demo/modules/casino/repository/casino_repository.dart';
import 'package:fluttertest/learning/demo/modules/casino/repository/resource/network_bounds_resource_get_games.dart';

import '../../../core/utils/network_resource.dart';
import '../data/net/casino_network_adapter.dart';

class CasinoRepositoryImpl implements CasinoRepository {
  final _port = CasinoNetworkAdapter();

  @override
  Future<NetworkResource<String>> getGames({
    int partnerId = 1,
    String lang = 'eng',
    int isMobile = 1,
    String country = 'AM',
    int limit = 4,
  }) async {
    return GetGamesNetworkBoundResource(
      _port,
      partnerId: partnerId,
      lang: lang,
      isMobile: isMobile,
      country: country,
      limit: limit,
    )().asFuture(); //Callable object.
  }
}