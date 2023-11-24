import 'package:fluttertest/learning/demo/modules/casino/data/net/casino_network_client.dart';

abstract interface class CasinoRepository{
  Future<String> getGames();
}

class CasinoRepositoryImpl extends CasinoRepository{
  final _port = CasinoNetworkClient().port;

  @override
  Future<String> getGames() {
    // TODO: implement getGames
    throw UnimplementedError();
  }
}