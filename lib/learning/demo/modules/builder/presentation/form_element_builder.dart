import 'package:fluttertest/learning/demo/core/manager/base_event.dart';
import 'package:fluttertest/learning/demo/core/manager/base_state.dart';

abstract interface class FormElementBuilder<Event extends BuilderEvent> {
  late final String pageTitle;
  late final String primaryButtonTitle;
  late final List<List<String>> items;

  bool validate();

  void onNewBuilderEvent(Event event);

  void performDefinitiveAction();

  void clear();
}

sealed class BuilderEvent extends BaseEvent {}

sealed class BuilderState extends BaseState {}