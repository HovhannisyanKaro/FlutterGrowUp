import 'dart:async';

import 'package:flutter/foundation.dart';

import 'base_event.dart';
import 'base_state.dart';

abstract mixin class Manager<Event extends BaseEvent, State extends BaseState> {
  final StreamController<Event> _events = StreamController(sync: true);
  final StreamController<State> _states = StreamController(sync: true);

  Stream<State> get states => _states.stream;

  void init() {
    _events.stream.listen(handleEvent);
  }

  @mustCallSuper
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
  void destroy() {
    _events.close();
    _states.close();
  }
}