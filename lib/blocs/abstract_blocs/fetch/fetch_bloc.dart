import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../../shared/constants/enums.dart';
import '../../../shared/exceptions.dart';
import 'fetch_args.dart';

part 'fetch_event.dart';
part 'fetch_state.dart';

abstract class FetchBloc<ResultType, FetchArgsType extends FetchArgs>
    extends Bloc<FetchEvent, FetchState> {
  FetchBloc({FetchArgs initialFetchArgs}) : super(FetchInitialState()) {
    add(FetchInitialEvent(initialFetchArgs: initialFetchArgs));
  }

  Future<ResultType> fetch(FetchArgsType fetchArgs);

  @override
  Stream<FetchState> mapEventToState(
    FetchEvent event,
  ) async* {
    if (event is FetchInitialEvent) {
      yield* mapFetchInitialEvent(event.initialFetchArgs);
    } else if (event is FetchRefreshEvent) {
      yield* mapFetchRefreshEvent(event.fetchArgs);
    }
  }

  Stream<FetchState> mapFetchInitialEvent(FetchArgs fetchArgs) async* {
    try {
      yield FetchInitialInProgressState();
      ResultType data = await fetch(fetchArgs);
      yield FetchInitialSuccessState(data: data);
    } catch (e) {
      if (e is FetchingException)
        yield FetchInitialFailureState(fetchingException: e);
      else
        yield FetchInitialFailureState(
          fetchingException: FetchingException(
            fetchingError: FetchingError.undefined,
            message: e.toString(),
          ),
        );
    }
  }

  Stream<FetchState> mapFetchRefreshEvent(FetchArgs fetchArgs) async* {
    try {
      yield FetchRefreshInProgressState();
      ResultType data = await fetch(fetchArgs);
      yield FetchRefreshSuccessState(data: data);
    } catch (e) {
      if (e is FetchingException)
        yield FetchRefreshFailureState(fetchingException: e);
      else
        yield FetchRefreshFailureState(
          fetchingException: FetchingException(
            fetchingError: FetchingError.undefined,
            message: e.toString(),
          ),
        );
    }
  }
}
