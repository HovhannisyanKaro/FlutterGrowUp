import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:fluttertest/learning/demo/core/manager/base_state.dart';

import 'base_event.dart';

abstract base class BaseManager<Event extends BaseEvent, State extends BaseState> {
  final StreamController<Event> _events = StreamController(sync: true);
  final StreamController<State> _states = StreamController(sync: true);

  Stream<State> get states => _states.stream;

  BaseManager() {
    _events.stream.listen(handleEvent);
  }

  @nonVirtual
  void addEvent(Event event) {
    _events.add(event);
  }

  void handleEvent(Event event);

  @protected
  void updateState(State state) {
    _states.add(state);
  }

  @mustCallSuper
  void close() {
    _events.close();
    _states.close();
  }
}
