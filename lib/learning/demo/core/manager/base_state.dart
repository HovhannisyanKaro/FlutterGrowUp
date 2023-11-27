import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertest/learning/demo/core/manager/base_event.dart';

abstract interface class BaseState {}

class BaseBloc<Event extends BaseEvent, State extends BaseState> extends Bloc<Event, State> {

  BaseBloc(super.initialState);
}
