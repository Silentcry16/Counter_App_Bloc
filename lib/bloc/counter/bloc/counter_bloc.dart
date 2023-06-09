import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterInitial()) {
    on<IncreaseEvent>((event, emit) {
      emit(CounterState(counterValue: state.counterValue + 1));
    });
    on<DecreaseEvent>((event, emit) {
      emit(CounterState(counterValue: state.counterValue - 1));
    });
  }
}
