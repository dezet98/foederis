import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:engineering_thesis/constants/enums.dart';
import 'package:engineering_thesis/models/filter.dart';
import 'package:engineering_thesis/shared/exceptions.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'fetch_event.dart';
part 'fetch_state.dart';

abstract class FetchBloc<T> extends Bloc<FetchEvent, FetchState> {
  FetchBloc() : super(FetchInitialState()) {
    add(FetchEvent());
  }

  Future<T> fetch();

  @override
  Stream<FetchState> mapEventToState(
    FetchEvent event,
  ) async* {
    if (event is FetchEvent) {
      try {
        T data = await fetch();
        yield FetchSuccessState(data: data);
      } on FetchingException catch (e) {
        yield FetchFailureState(
            fetchingError: e.fetchingError, message: e.message);
      }
    }
  }
}
