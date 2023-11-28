import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MaterialApp(
    home: BlocProvider(
      create: (context) => MySubBloc(InitialState()),
      child: const MyBlocWidget(),
    ),
  ));
}

//State
abstract class AbstractParentState {}

sealed class ParentState extends AbstractParentState {
  final String? fakeData;
  final String? otherFakeData;

  ParentState({this.fakeData, this.otherFakeData});

  ParentState copyWith(ParentState obj) {
    return obj;
  }
}

class InitialState extends ParentState {}

class UpdateListState extends ParentState {
  final bool someBool;

  UpdateListState({required this.someBool});
}

//Event
abstract class AbstractParentEvent {}

sealed class ParentEvent extends AbstractParentEvent {}

class FakeSubEvent extends ParentEvent {}

class MyBloc<Event extends AbstractParentEvent, State extends AbstractParentState> extends Bloc<Event, State> {
  MyBloc(State state) : super(state);
}

class MySubBloc extends MyBloc<ParentEvent, ParentState> {
  MySubBloc(super.state) {
    on<FakeSubEvent>((event, emitter) {
      emitter(UpdateListState(someBool: true));
    });
  }
}

class MyBlocWidget extends StatelessWidget {
  const MyBlocWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var bloc = BlocProvider.of<MySubBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('ActionBar unknown'),
      ),
      body: Column(
        children: [
          BlocSelector<MySubBloc, ParentState, String?>(
            // selector: (state) => state.fakeData,
            selector: (state) {
              if (state is InitialState) {
                return 'State is Initial State';
              }
              return null;
            },
            builder: (context, data) => Text(data ?? 'null fakeData'),
          ),
          BlocSelector<MySubBloc, ParentState, String?>(
            // selector: (state) => state.otherFakeData,
            selector: (state) {
              if (state is! InitialState) {
                return 'state is not in initial state';
              }
              return null;
            },
            builder: (context, data) => Text(data ?? 'null otherFakeData'),
          ),
          MaterialButton(
            onPressed: () {
              bloc.add(FakeSubEvent());
            },
            child: const Text('Click me please'),
          )
        ],
      ),
    );
  }
}
