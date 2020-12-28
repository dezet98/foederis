import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:engineering_thesis/shared/constants/enums.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'stream_event.dart';
part 'stream_state.dart';

abstract class StreamBloc<DataType> extends Bloc<StreamEvent, StreamState> {
  StreamSubscription _streamSubscription;

  StreamBloc(Stream<DataType> stream) : super(StreamInitialState()) {
    add(StreamSubscribeEvent<DataType>(stream: stream));
  }

  @override
  Stream<StreamState> mapEventToState(
    StreamEvent event,
  ) async* {
    if (event is StreamSubscribeEvent) {
      yield* mapStreamSubscribeEvent(event.stream);
    } else if (event is StreamRefreshEvent) {
      yield* mapStreamRefreshEvent(event.data);
    }
  }

  Stream<StreamState> mapStreamRefreshEvent(DataType data) async* {
    try {
      yield StreamRefreshInProgressState();
      yield StreamRefreshSuccessState(data: data);
    } catch (e) {
      yield StreamRefreshFailureState(
          streamError: StreamError.undefined, message: e.toString());
    }
  }

  Stream<StreamState> mapStreamSubscribeEvent(Stream<DataType> stream) async* {
    try {
      _streamSubscription?.cancel();

      _streamSubscription = stream.listen((DataType data) {
        add(StreamRefreshEvent(data: data));
      });
    } catch (e) {
      yield StreamSubscribeFailed(
          streamError: StreamError.undefined, message: e.toString());
    }
  }
}
