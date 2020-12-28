part of 'stream_bloc.dart';

abstract class StreamEvent extends Equatable {
  const StreamEvent();

  @override
  List<Object> get props => [];
}

class StreamSubscribeEvent<DataType> extends StreamEvent {
  final Stream<DataType> stream;

  StreamSubscribeEvent({@required this.stream});
}

class StreamRefreshEvent<DataType> extends StreamEvent {
  final DataType data;

  StreamRefreshEvent({@required this.data});
}
