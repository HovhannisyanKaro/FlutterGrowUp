import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';

final class NetworkStateManager {
  final StreamController<NetworkState> _states = StreamController(sync: true);

  Stream<NetworkState> get states => _states.stream;

  NetworkStateManager._() {
    _init();
  }

  static final NetworkStateManager _instance = NetworkStateManager._();

  factory NetworkStateManager() => _instance;

  final _connectivity = Connectivity();

  void _init() {
    _connectivity.onConnectivityChanged.listen((event) {
      switch (event) {
        case ConnectivityResult.none:
          _updateState(ChangedState(isOnline: true));
        default:
          _updateState(ChangedState(isOnline: false));
      }
    });
  }

  Future<bool> isNetworkAvailable() async {
    final isConnected = await (_connectivity.checkConnectivity());
    return isConnected != ConnectivityResult.none;
  }

  void _updateState(NetworkState state) {
    _states.add(state);
  }

  void close() {
    _states.close();
  }
}

sealed class NetworkState {}

class ChangedState extends NetworkState {
  bool isOnline;

  ChangedState({required this.isOnline});
}