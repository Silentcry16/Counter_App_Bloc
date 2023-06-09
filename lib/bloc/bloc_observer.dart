import 'package:bloc/bloc.dart';

class CounterBlocObserver extends BlocObserver {
  @override
  void onEvent(Bloc bloc, Object? event) {
    super.onEvent(bloc, event);
    print(onEvent);
  }   

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    print(onError);
    super.onError(bloc, error, stackTrace);
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    print(onChange);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    print(onTransition);
  }
}
