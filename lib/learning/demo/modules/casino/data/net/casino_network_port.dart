
import '../../../../core/utils/api_wrapper.dart';

abstract interface class CasinoNetworkPort {
  ApiWrapper<String> getGames();
}