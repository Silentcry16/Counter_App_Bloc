part of 'counter_bloc.dart';

class CounterState extends Equatable {
  final int counterValue;
  const CounterState({required this.counterValue});

  @override
  List<Object> get props => [counterValue];
}

class CounterInitial extends CounterState {
  const CounterInitial() : super(counterValue: 0);
}

class incrementState extends CounterState {
  final int incrementValue;
  const incrementState(this.incrementValue) : super(counterValue: incrementValue);
}

class DecrementState extends CounterState {
  final int DecrementValue;
  const DecrementState(this.DecrementValue) : super(counterValue: DecrementValue);
}
