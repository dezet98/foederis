import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:engineering_thesis/blocs/abstract_blocs/validators/validator.dart';
import 'package:equatable/equatable.dart';

part 'validators_event.dart';
part 'validators_state.dart';

abstract class ValidatorsBloc extends Bloc<ValidatorsEvent, ValidatorsState> {
  ValidatorsBloc() : super(ValidatorsInitialState()) {
    add(ValidatorsInitEvent());
  }

  List<Validator> validators();

  bool checkValid() {
    for (Validator validator in validators())
      if (!validator.isValid()) return false;
    return true;
  }

  @override
  Stream<ValidatorsState> mapEventToState(
    ValidatorsEvent event,
  ) async* {
    if (event is ValidatorsInitEvent) {
      yield* mapValidatorsInitEvent();
    }
  }

  Stream<ValidatorsState> mapValidatorsInitEvent() async* {
    // try {
    //   yield ValidatorsInitInProgressState();
    //   yield ValidatorsInitSuccessState();
    // } catch (e) {
    //   yield ValidatorsInitFailureState(message: e.toString());
    // }
  }
}
