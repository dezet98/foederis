import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'nav_bar_event.dart';
part 'nav_bar_state.dart';

class NavBarBloc extends Bloc<NavBarEvent, NavBarState> {
  int innitialIndex;
  NavBarBloc({@required this.innitialIndex}) : super(NavBarInitialState()) {
    currentIndex = innitialIndex;
  }

  int currentIndex;

  @override
  Stream<NavBarState> mapEventToState(
    NavBarEvent event,
  ) async* {
    if (event is NavBarItemChangedEvent) {
      yield NavBarItemChangeInProgressState();
      currentIndex = event.index;
      yield NavBarItemChangedState(currentIndex: currentIndex);
    }
  }
}
