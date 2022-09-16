import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_development/state.dart';

enum CounterEvent {
  increment,
  decrement,
}

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(const CounterState.initial());

  @override
  Stream<CounterState> mapEventToState(CounterEvent event) async* {
    switch (event) {
      case CounterEvent.increment:
        yield state.copyWith(count: state.count + 1);
        break;
      case CounterEvent.decrement:
        yield state.copyWith(count: state.count - 1);
        break;
      default:
        addError(Exception('unsupported event'));
    }
  }
}
