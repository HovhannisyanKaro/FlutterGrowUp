import 'package:fluttertest/learning/demo/core/manager/base_event.dart';
import 'package:fluttertest/learning/demo/core/manager/base_state.dart';
import 'package:fluttertest/learning/demo/core/manager/manager.dart';

/// ------------------------------------------------------------
/// Event
/// ------------------------------------------------------------
sealed class BuilderEvent extends BaseEvent {}

class InitialEvent extends BuilderEvent {}

class NextEvent extends BuilderEvent {
  final int position;

  NextEvent({required this.position});
}

class PreviousEvent extends BuilderEvent {
  final int position;

  PreviousEvent({required this.position});
}

class ValueChangeEvent<T> extends BuilderEvent {
  final int page;
  final int position;
  final T value;

  ValueChangeEvent({required this.page, required this.position, required this.value});
}

/// ------------------------------------------------------------
/// State
/// ------------------------------------------------------------

sealed class BuilderState extends BaseState {}

class InitialState extends BuilderState {}

abstract interface class FormElementBuilder<Event extends BuilderEvent> {
  late final String pageTitle;
  late final String primaryButtonTitle;
  late final List<List<String>> items;

  bool validate();

  void onNewBuilderEvent(Event event);

  void performDefinitiveAction();

  void clear();
}

abstract base class AbstractFormElementBuilder<Event extends BuilderEvent, State extends BuilderState> with Manager<Event, State> implements FormElementBuilder<Event> {}
