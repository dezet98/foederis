import 'package:bloc/bloc.dart';
import 'package:engineering_thesis/shared/app_logger.dart';

class SimpleBlocObserver extends BlocObserver {
  @override
  void onEvent(Bloc bloc, Object event) {
    AppLogger().log(message: event.toString(), logLevel: LogLevel.info);
    super.onEvent(bloc, event);
  }

  @override
  void onChange(Cubit cubit, Change change) {
    AppLogger().log(message: change.toString(), logLevel: LogLevel.info);
    super.onChange(cubit, change);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    AppLogger().log(message: transition.toString(), logLevel: LogLevel.info);
    super.onTransition(bloc, transition);
  }

  @override
  void onError(Cubit cubit, Object error, StackTrace stackTrace) {
    AppLogger().log(message: error.toString(), logLevel: LogLevel.error);
    super.onError(cubit, error, stackTrace);
  }
}