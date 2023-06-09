part of 'counter_bloc.dart';

abstract class CounterEvent {}

class IncreaseEvent extends CounterEvent {}

class DecreaseEvent extends CounterEvent {}
