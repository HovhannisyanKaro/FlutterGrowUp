import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:fluttertest/learning/demo/core/manager/base_state.dart';

import 'base_event.dart';

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

abstract base class BaseManager<Event extends BaseEvent, State extends BaseState> with Manager<Event, State> {
  BaseManager() {
    init();
  }
}

//Code below just for test!!!
abstract class TestEventClass {}

sealed class B extends TestEventClass {}

class SubOfB extends B {}

abstract class A<T extends B> {
  void test(T t);
}

abstract mixin class AMixin<T extends TestEventClass> {
  void test(T t);
}

abstract class ClassThatMixinAMixin<T extends TestEventClass> with AMixin<T> {}

class C with AMixin<SubOfB> {
  @override
  void test(SubOfB t) {
    // TODO: implement test
  }
}

class COther extends ClassThatMixinAMixin<B> {
  @override
  void test(B t) {}
}
