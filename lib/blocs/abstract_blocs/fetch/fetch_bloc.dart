import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:engineering_thesis/constants/enums.dart';
import 'package:engineering_thesis/models/fetch_filter.dart';
import 'package:engineering_thesis/shared/exceptions.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'fetch_event.dart';
part 'fetch_state.dart';

abstract class FetchBloc<T> extends Bloc<FetchEvent, FetchState> {
  List<dynamic> get initialFilters;

  FetchBloc() : super(FetchInitialState()) {
    add(FetchInitialEvent(initialFilters: initialFilters));
  }

  Future<T> fetch(List<FetchFilter> filters);

  @override
  Stream<FetchState> mapEventToState(
    FetchEvent event,
  ) async* {
    if (event is FetchInitialEvent) {
      yield* mapFetchInitialEvent(initialFilters: event.initialFilters);
    } else if (event is FetchRefreshEvent) {
      yield* mapFetchRefreshEvent(filters: event.filters);
    }
  }

  Stream<FetchState> mapFetchInitialEvent({@required initialFilters}) async* {
    try {
      yield FetchInProgressState();
      T data = await fetch(initialFilters);
      yield FetchSuccessState(data: data);
    } catch (e) {
      if (e is FetchingException)
        yield FetchFailureState(
            fetchingError: e.fetchingError, message: e.message);
      else
        yield FetchFailureState(
            fetchingError: FetchingError.undefined, message: e.message);
    }
  }

  Stream<FetchState> mapFetchRefreshEvent({@required filters}) async* {
    try {
      yield FetchInProgressState();
      T data = await fetch(filters);
      yield FetchSuccessState(data: data);
    } catch (e) {
      if (e is FetchingException)
        yield FetchFailureState(
            fetchingError: e.fetchingError, message: e.message);
      else
        yield FetchFailureState(
            fetchingError: FetchingError.undefined, message: e.message);
    }
  }
}
