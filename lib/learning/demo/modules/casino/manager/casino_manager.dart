import 'dart:async';

import 'package:fluttertest/learning/demo/core/manager/base_manager.dart';
import 'package:fluttertest/learning/demo/modules/casino/manager/casino_manager_event.dart';
import 'package:fluttertest/learning/demo/modules/casino/manager/casino_manager_state.dart';
import 'package:fluttertest/learning/demo/modules/casino/repository/casino_repository_impl.dart';

import '../../../core/utils/network_resource.dart';

final class CasinoManager extends BaseManager<CasinoManagerEvent, CasinoManagerState>{
  final repo = CasinoRepositoryImpl();

  CasinoManager._();

  static final CasinoManager _instance = CasinoManager._();

  factory CasinoManager() => _instance;

  Future<NetworkResource<String>> _getCasinoGames({
    int partnerId = 1,
    String lang = 'eng',
    int isMobile = 1,
    String country = 'AM',
    int limit = 4,
  }) async {
    return await repo.getGames(partnerId: partnerId, lang: lang, isMobile: isMobile, country: country, limit: limit);
  }

  //TODO: remove testOfUsage fun
  // void testOfUsage() async {
  //   final result = await getCasinoGames();
  //   switch (result.status) {
  //     case Status.success:
  //       updateState();
  //     case Status.error:
  //       updateState();
  //     case Status.loading:
  //       updateState();
  //   }
  // }

  @override
  void handleEvent(CasinoManagerEvent event) {

  }
}