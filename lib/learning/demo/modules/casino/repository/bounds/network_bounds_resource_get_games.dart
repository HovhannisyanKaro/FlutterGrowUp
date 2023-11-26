import '../../../../../draft/api/retrofit/demo/casino_games_response.dart';
import '../../../../core/exceptions/exception_error.dart';
import '../../../../core/exceptions/exception_network.dart';
import '../../../../core/exceptions/exception_unknown.dart';
import '../../../../core/utils/api_wrapper.dart';
import '../../../../core/utils/network_bound_resource.dart';
import '../../data/net/casino_network_port.dart';

class GetGamesNetworkBoundResource extends NetworkBoundResource<String, ApiWrapper<CasinoGamesResponse>> {
  final CasinoNetworkPort _port;
  final int partnerId;
  final String lang;
  final int isMobile;
  final String country;
  final int limit;

  GetGamesNetworkBoundResource(
      this._port, {
        this.partnerId = 1,
        this.lang = 'eng',
        this.isMobile = 1,
        this.country = 'AM',
        this.limit = 4,
      });

  @override
  String? processResponse(String? data, ApiWrapper<CasinoGamesResponse>? response) {
    return switch (response) {
      Success<CasinoGamesResponse>() => response.value?.toString(),
      _ => data,
    };
  }

  @override
  Exception? isError(ApiWrapper<CasinoGamesResponse>? response) {
    return switch (response) {
      null || UnknownError() => UnknownException(),
      NetworkError() => NetworkException(),
      Error() => switch (response.error) {
        null => UnknownException(),
        _ => ErrorException(message: response.error!, code: response.code),
      },
      _ => null,
    };
  }

  @override
  Future<ApiWrapper<CasinoGamesResponse>?> fetchFromNetwork() {
    return _port.getGamesHttp(partnerId: partnerId, lang: lang, isMobile: isMobile, country: country, limit: limit);
  }
}