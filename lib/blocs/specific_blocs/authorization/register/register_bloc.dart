import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../../../repositories/auth_repository.dart';
import '../../../../shared/app_logger.dart';
import '../../../../shared/exceptions.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final AuthRepository _authRepository;

  RegisterBloc({@required AuthRepository authRepository})
      : _authRepository = authRepository,
        super(RegisterInitialState());

  @override
  Stream<RegisterState> mapEventToState(
    RegisterEvent event,
  ) async* {
    if (event is RegisterUserWithEmailAndPasswordEvent) {
      yield RegisterInProgressState();
      yield* mapRegisterUserWithEmailAndPasswordEvent(
          email: event.email, password: event.password);
    }
  }

  Stream<RegisterState> mapRegisterUserWithEmailAndPasswordEvent(
      {@required String email, @required String password}) async* {
    try {
      await _authRepository.createUserWithEmailAndPassword(
          email: email, password: password);
      yield RegisterSuccessState();
    } on RegisterException catch (registerException) {
      AppLogger().log(
          message: registerException.registerError.toString(),
          logLevel: LogLevel.warning);
      yield RegisterFailureState(registerException: registerException);
    }
  }
}
