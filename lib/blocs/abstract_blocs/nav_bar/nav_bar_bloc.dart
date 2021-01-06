import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:engineering_thesis/ui/components/abstract/nav_bar_tab.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:meta/meta.dart';

part 'nav_bar_event.dart';
part 'nav_bar_state.dart';

abstract class NavBarBloc extends Bloc<NavBarEvent, NavBarState> {
  List<NavBarTab> get navBarTabs;
  int get initialIndex;

  NavBarBloc() : super(NavBarInitialState()) {
    assert(navBarTabs.length > initialIndex,
        'initialIndex for navbar is out of range');
    currentIndex = initialIndex;
  }

  int currentIndex;

  int get tabLenght => navBarTabs.length;
  Widget get currentTab => navBarTabs.elementAt(currentIndex);

  @override
  Stream<NavBarState> mapEventToState(
    NavBarEvent event,
  ) async* {
    if (event is NavBarItemChangedEvent) {
      yield NavBarItemChangeInProgressState();
      currentIndex = event.index;
      yield NavBarItemChangedState(
        currentTab: navBarTabs[currentIndex],
        currentIndex: currentIndex,
      );
    } else if (event is NavBarRefreshEvent) {
      yield NavBarRefreshInProgressState();
      yield NavBarRefreshSuccessState();
    }
  }
}
