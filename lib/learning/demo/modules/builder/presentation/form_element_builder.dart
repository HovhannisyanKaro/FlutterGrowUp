import 'package:fluttertest/learning/demo/core/manager/manager.dart';

import 'builder_event.dart';
import 'builder_state.dart';

abstract interface class FormElementBuilder {
  late final String pageTitle;
  late final String primaryButtonTitle;
  late final List<List<String>> items;

  bool validate();

  void performDefinitiveAction();

  void clear();
}

abstract base class AbstractFormElementBuilder<Event extends BuilderEvent, State extends BuilderState> with Manager<Event, State> implements FormElementBuilder {
  @override
  void addEvent(Event event) {
    switch (event) {
      case InitialEvent():
        break;
      case NextEvent():
        _nextEvent(event);
        break;
      case PreviousEvent():
        event.position;
        break;
      case ValueChangeEvent():
        _valueChangeEvent(event);
        break;
    }
    super.addEvent(event);
  }

  void _initialEvent() {}

  void _nextEvent(NextEvent event) {}

  void _previousEvent(PreviousEvent event) {}

  void _valueChangeEvent(ValueChangeEvent valueChangeEvent) {}
}
