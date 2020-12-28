part of 'send_bloc.dart';

abstract class SendState extends Equatable {
  const SendState();

  @override
  List<Object> get props => [];
}

class SendInitialState extends SendState {}

class SendDataInProgressState extends SendState {}

class SendDataSuccessState extends SendState {}

class SendDataFailureState extends SendState {
  final SendingDataException sendingDataException;
  final String message;

  SendDataFailureState({@required this.sendingDataException, this.message});
}
