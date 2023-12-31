import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../manager/base_event.dart';
import '../../manager/base_state.dart';
import '../../manager/manager.dart';

abstract base class BaseWidgetBloc<Event extends BaseEvent, State extends BaseState> extends Bloc<Event, State> with Manager<Event, State> {
  BaseWidgetBloc(super.initialState) {
    init();
  }

  @mustCallSuper
  @override
  Future<void> close() {
    destroy();
    return super.close();
  }
}
