import 'package:flutter_bloc/flutter_bloc.dart';

import '../../manager/base_event.dart';
import '../../manager/base_manager.dart';
import '../../manager/base_state.dart';

abstract base class BaseBlocWidget<Event extends BaseEvent, State extends BaseState> extends Bloc<Event, State> with Manager<Event, State> {
  BaseBlocWidget(super.initialState) {
    init();
  }
}