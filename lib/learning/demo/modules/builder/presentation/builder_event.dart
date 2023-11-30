import '../../../core/manager/base_event.dart';

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