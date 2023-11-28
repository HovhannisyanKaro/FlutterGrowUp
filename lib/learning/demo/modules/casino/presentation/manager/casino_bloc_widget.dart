import 'package:fluttertest/learning/demo/core/presentation/manager/base_bloc_widget.dart';
import 'package:fluttertest/learning/demo/modules/casino/presentation/manager/casino_bloc_event.dart';
import 'package:fluttertest/learning/demo/modules/casino/presentation/manager/casino_bloc_state.dart';

final class CasinoBlocWidget extends BaseBlocWidget<CasinoBlocEvent, CasinoBlocState> {
  CasinoBlocWidget(super.initialState);

  @override
  void handleEvent(CasinoBlocEvent event) {
    switch (event) {}
  }
}
