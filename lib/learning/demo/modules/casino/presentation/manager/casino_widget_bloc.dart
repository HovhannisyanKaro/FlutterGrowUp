import 'package:fluttertest/learning/demo/core/presentation/manager/base_bloc_widget.dart';
import 'package:fluttertest/learning/demo/modules/casino/presentation/manager/casino_widget_bloc_event.dart';
import 'package:fluttertest/learning/demo/modules/casino/presentation/manager/casino_widget_bloc_state.dart';

final class CasinoWidgetBloc extends BaseWidgetBloc<CasinoWidgetBlocEvent, CasinoWidgetBlocState> {
  CasinoWidgetBloc(super.initialState);

  @override
  void handleEvent(CasinoWidgetBlocEvent event) {
    switch (event) {}
  }
}