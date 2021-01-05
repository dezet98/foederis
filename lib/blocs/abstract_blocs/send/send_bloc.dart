import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:engineering_thesis/shared/constants/errors.dart';
import 'package:engineering_thesis/shared/exceptions/exceptions.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'send_event.dart';
part 'send_state.dart';

abstract class SendBloc extends Bloc<SendEvent, SendState> {
  SendBloc() : super(SendInitialState());

  Future<void> query(Map<String, dynamic> valuesMap);

  @override
  Stream<SendState> mapEventToState(
    SendEvent event,
  ) async* {
    if (event is SendDataEvent) {
      yield* mapSendDataEvent(event.valuesMap);
    }
  }

  Stream<SendState> mapSendDataEvent(Map<String, dynamic> valuesMap) async* {
    try {
      yield SendDataInProgressState();
      // if (sendValidators == null || sendValidators.isValid())
      await query(valuesMap);
      // else
      //   yield SendDataFailureState(
      //     sendingDataException: SendingDataException(
      //       sendingDataError: UploadDataError.data_not_valid,
      //       message: 'Send data was invalid, not pass validators',
      //     ),
      //   );
      yield SendDataSuccessState();
    } catch (e) {
      if (e is SendingDataException)
        yield SendDataFailureState(sendingDataException: e);
      else
        yield SendDataFailureState(
          sendingDataException: SendingDataException(
            sendingDataError: UploadDataError.undefined,
            message: e.toString(),
          ),
        );
    }
  }
}
