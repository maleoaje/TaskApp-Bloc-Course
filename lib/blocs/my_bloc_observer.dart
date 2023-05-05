import 'dart:developer';

import 'package:bloc/bloc.dart';

class MyBlocObserver extends BlocObserver {
  @override
  void onEvent(Bloc bloc, Object? event) {
    super.onEvent(bloc, event);
    log('1.${bloc.runtimeType} \n event:$event');
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    log('2.$error');
    log('2.$bloc');
    log('2.$stackTrace');

    super.onError(bloc, error, stackTrace);
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    log("3.$change");
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    log("4.$transition");
  }
}
