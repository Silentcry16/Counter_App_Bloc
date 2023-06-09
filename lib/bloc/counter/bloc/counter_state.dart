// ignore_for_file: public_member_api_docs, sort_constructors_first

part of 'counter_bloc.dart';

class CounterState extends Equatable {
  final int counterValue;
  const CounterState({required this.counterValue});

  @override
  List<Object> get props => [counterValue];

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'counterValue': counterValue,
    };
  }

  factory CounterState.fromMap(Map<String, dynamic> map) {
    return CounterState(
      counterValue: map['counterValue'] as int,
    );
  }
}

class CounterInitial extends CounterState {
  const CounterInitial() : super(counterValue: 0);
}

class incrementState extends CounterState {
  final int incrementValue;
  const incrementState(this.incrementValue)
      : super(counterValue: incrementValue);
}

class DecrementState extends CounterState {
  final int DecrementValue;
  const DecrementState(this.DecrementValue)
      : super(counterValue: DecrementValue);
}
