import 'package:fluttertest/learning/demo/core/utils/api_wrapper.dart';
import 'package:fluttertest/learning/demo/modules/casino/data/net/casino_network_port.dart';

import '../../../../../draft/api/retrofit/demo/casino_games_response.dart';
import 'casino_network_client.dart';

class CasinoNetworkAdapter implements CasinoNetworkPort {
  CasinoNetworkAdapter._();

  static final CasinoNetworkAdapter _instance = CasinoNetworkAdapter._();

  factory CasinoNetworkAdapter() => _instance;

  final _port = CasinoNetworkClient().port;

  // @override
  // Future<ApiWrapper<CasinoGamesResponse>> getGames() async {
  //
  //   final result = await _port.getGames();
  //   return parseResponse(result);
  // }

  @override
  Future<ApiWrapper<CasinoGamesResponse>> getGamesHttp({
    int partnerId = 1,
    String lang = 'eng',
    int isMobile = 1,
    String country = 'AM',
    int limit = 4,
  }) async {
    final result = await _port.getGamesHttp(partnerId: partnerId, lang: lang, isMobile: isMobile, country: country, limit: limit);
    return parseResponse(result);
  }
}
