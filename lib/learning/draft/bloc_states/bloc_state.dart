import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'bloc_state.freezed.dart';

void main() {
  runApp(MaterialApp(
    home: BlocProvider(
      create: (context) => MySubSubBloc(),
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

class FakeSubSecondEvent extends ParentEvent {}

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

class MySubSubBloc extends Bloc<ParentEvent, SimpleOfStateFreezed> {
  MySubSubBloc() : super(SimpleOfStateFreezed(items: [CarHardClass('zzz'), CarHardClass('aaa'), CarHardClass('ccc'), CarHardClass('qqq')])) {
    Future.delayed(const Duration(milliseconds: 3000), () {
      add(FakeSubEvent());
    });

    on<FakeSubEvent>((event, emitter) {
      // emitter(state.copyWith(carHardClass:  CarHardClass(name: 'Lexus RX300')));
      var newState = state.copyWith();
      newState.items[0].name = 'BBB';
      // newState.carHardClass?.name = 'Lexus RX 300';
      emitter(newState);
    });

    on<FakeSubSecondEvent>((event, emitter) {
      // emitter(state.copyWith(carHardClass: CarHardClassEquatable(name: 'Lexus RX300')));
    });
  }
}

class MyBlocWidget extends StatelessWidget {
  const MyBlocWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var bloc = BlocProvider.of<MySubSubBloc>(context);

    return Scaffold(
        appBar: AppBar(
          title: const Text('ActionBar unknown'),
        ),
        body: BlocSelector<MySubSubBloc, SimpleOfStateFreezed, List<CarHardClass?>>(
          selector: (state) => state.items,
          builder: (context, items) {
            debugPrint('HK_LOG');
            return ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) {
                return BlocSelector<MySubSubBloc, SimpleOfStateFreezed, String?>(
                  selector: (state) => state.items[index].name,
                  builder: (context, item) => Text(item ?? 'deepValue is null'),
                );
              },
            );
          },
        )
        // Column(
        //   children: [
        //     // BlocSelector<MySubSubBloc, SimpleOfStateFreezed, String?>(
        //     //   // selector: (state) => state.fakeData,
        //     //   selector: (state) => state.carHardClass?.name,
        //     //   builder: (context, data) => Text(data ?? 'null car hard class name is null'),
        //     // ),
        //     BlocSelector<MySubSubBloc, SimpleOfStateFreezed, bool?>(
        //       // selector: (state) => state.otherFakeData,
        //       selector: (state) => state.isSomethingTrue,
        //       builder: (context, data) => Text(data.toString()),
        //     ),
        //     MaterialButton(
        //       onPressed: () {
        //         bloc.add(FakeSubEvent());
        //       },
        //       child: const Text('Click me please'),
        //     ),
        //   ],
        // ),
        );
  }
}

@immutable
final class SimpleOfState extends Equatable {
  final int age;
  final bool isSomethingTrue;

  const SimpleOfState({required this.age, required this.isSomethingTrue});

  @override
  List<Object?> get props => [age, isSomethingTrue];
}

@freezed
class SimpleOfStateFreezed with _$SimpleOfStateFreezed {
  const factory SimpleOfStateFreezed({int? age, bool? isSomethingTrue, @Default([]) List<CarHardClass> items}) = _SimpleOfStateFreezed;
}

class CarHardClassEquatable extends Equatable {
  String? name;
  int? year;

  CarHardClassEquatable({this.name, this.year});

  @override
  // TODO: implement props
  List<Object?> get props => [name, year];
}

class CarHardClass {
  String? name;
  int? year;

  CarHardClass(this.name);

  @override
  bool operator ==(Object other) => identical(this, other) || other is CarHardClass && runtimeType == other.runtimeType && name == other.name && year == other.year;

  @override
  int get hashCode => name.hashCode ^ year.hashCode;
}
