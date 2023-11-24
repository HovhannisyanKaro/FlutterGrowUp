import 'package:fluttertest/learning/demo/core/utils/api_wrapper.dart';
import 'package:fluttertest/learning/demo/modules/casino/data/net/casino_network_port.dart';

import '../../../../../draft/api/retrofit/demo/casino_games_response.dart';
import 'casino_network_client.dart';

class CasinoNetworkAdapter implements CasinoNetworkPort {
  final _port = CasinoNetworkClient().port;

  @override
  Future<ApiWrapper<CasinoGamesResponse>> getGames() async {

    final result = await _port.getGames();
    return parseResponse(result);
  }
}