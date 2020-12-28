import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:engineering_thesis/blocs/abstract_blocs/validators/validator.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'validators_event.dart';
part 'validators_state.dart';

abstract class ValidatorsBloc extends Bloc<ValidatorsEvent, ValidatorsState> {
  List<Validator> _validators;

  ValidatorsBloc() : super(ValidatorsInitialState()) {
    add(ValidatorsInitEvent());
  }

  Future<List<Validator>> initValidator();

  bool checkValid() {
    for (Validator validator in _validators)
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
    try {
      yield ValidatorsValidationInProgressState();
      _validators = await initValidator();
      yield ValidatorsValidState();
    } catch (e) {
      yield ValidatorsInvalidState(messsage: e.toString());
    }
  }
}
