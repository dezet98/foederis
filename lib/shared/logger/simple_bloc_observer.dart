import 'package:bloc/bloc.dart';

import 'app_logger.dart';

class SimpleBlocObserver extends BlocObserver {
  @override
  void onEvent(Bloc bloc, Object event) {
    AppLogger().log(message: event.toString(), logLevel: LogLevel.info);
    super.onEvent(bloc, event);
  }

  @override
  void onChange(Cubit cubit, Change change) {
    String msg =
        "Changing state: '${change.currentState}' -> '${change.nextState}'";
    AppLogger().log(message: msg, logLevel: LogLevel.info);
    super.onChange(cubit, change);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    String msg =
        "Transition(event: ${transition.event}): '${transition.currentState}' -> '${transition.nextState}'";
    AppLogger().log(message: msg, logLevel: LogLevel.info);
    super.onTransition(bloc, transition);
  }

  @override
  void onError(Cubit cubit, Object error, StackTrace stackTrace) {
    AppLogger().log(message: error.toString(), logLevel: LogLevel.error);
    super.onError(cubit, error, stackTrace);
  }
}
