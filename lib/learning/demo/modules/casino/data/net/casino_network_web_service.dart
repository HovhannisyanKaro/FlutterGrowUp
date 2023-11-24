import 'package:dio/dio.dart';
import 'package:fluttertest/learning/demo/modules/casino/configurations/app_constants.dart';
import 'package:retrofit/http.dart';

import '../../../../../draft/api/retrofit/demo/casino_games_response.dart';

part 'casino_network_web_service.g.dart';

@RestApi(baseUrl: casinoBaseUrl)
abstract class CasinoNetworkWebService {
  factory CasinoNetworkWebService(Dio dio, {String baseUrl}) = _CasinoNetworkWebService;

  @GET('/casino/getGames?')
  Future<Response<CasinoGamesResponse?>> getGames({
    @Query('partner_id') int partnerId = 1,
    @Query('lang') String eng = 'eng',
    @Query('is_mobile') int isMobile = 1,
    @Query('country') String country = 'AM',
    @Query('limit') int limit = 4,
  });
}