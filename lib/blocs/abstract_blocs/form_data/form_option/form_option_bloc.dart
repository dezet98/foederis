import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

part 'form_option_event.dart';
part 'form_option_state.dart';

abstract class FormOptionBloc<ResultType>
    extends Bloc<FormOptionEvent, FormOptionState> {
  ResultType result;

  FormOptionBloc({@required initialResult}) : super(FormOptionInitialState()) {
    result = initialResult;
  }

  bool checkValid(ResultType result);

  bool get isValid => checkValid(result);

  @override
  Stream<FormOptionState> mapEventToState(
    FormOptionEvent event,
  ) async* {
    if (event is FormOptionChangeOptionEvent) {
      yield FormOptioChangeInProgressState();
      result = event.result;
      yield FormOptionChangedState();
    }
  }
}
