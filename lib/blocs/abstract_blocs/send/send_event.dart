part of 'send_bloc.dart';

abstract class SendEvent extends Equatable {
  const SendEvent();

  @override
  List<Object> get props => [];
}

class SendDataEvent extends SendEvent {
  final Map<String, dynamic> valuesMap;

  SendDataEvent({this.valuesMap});
}
