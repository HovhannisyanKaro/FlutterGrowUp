import 'package:fluttertest/learning/demo/core/manager/base_state.dart';

import 'base_event.dart';
import 'manager.dart';

abstract base class BaseManager<Event extends BaseEvent, State extends BaseState> with Manager<Event, State> {
  BaseManager() {
    init();
  }
}