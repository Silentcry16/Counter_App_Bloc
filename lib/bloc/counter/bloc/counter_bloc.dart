import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';


part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends HydratedBloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterInitial()) {
//Increment the counterValue by 1
    on<IncrementEvent>((event, emit) {
      emit(incrementState(state.counterValue + 1));
    });

//decrements the counterValue by 1
    on<DecrementEvent>((event, emit) {
      emit(DecrementState(state.counterValue - 1));
    });


  }

  @override
  CounterState? fromJson(Map<String, dynamic> json) {
    return CounterState.fromMap(json);
  }

  @override
  Map<String, dynamic>? toJson(CounterState state) {
    return state.toMap();
  }
}
