import 'package:fluttertest/learning/demo/core/utils/api_wrapper.dart';
import 'package:fluttertest/learning/demo/modules/casino/data/net/casino_network_port.dart';

class CasinoNetworkAdapter implements CasinoNetworkPort {
  @override
  ApiWrapper<String> getGames() {
    throw UnimplementedError();
  }
}
