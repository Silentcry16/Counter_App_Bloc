import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterInitial()) {
    on<IncrementEvent>((event, emit) {
      emit(incrementState(state.counterValue + 1));
    });
    on<DecrementEvent>((event, emit) {
      emit(DecrementState(state.counterValue - 1));
    });
  }
}
