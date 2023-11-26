import '../../../../../draft/api/retrofit/demo/casino_games_response.dart';
import '../../../../core/utils/api_wrapper.dart';

abstract interface class CasinoNetworkPort {
  Future<ApiWrapper<CasinoGamesResponse>> getGames({
    int partnerId = 1,
    String lang = 'eng',
    int isMobile = 1,
    String country = 'AM',
    int limit = 4,
  });
}
