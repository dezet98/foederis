part of 'nav_bar_bloc.dart';

abstract class NavBarState extends Equatable {
  const NavBarState();

  @override
  List<Object> get props => [];
}

class NavBarInitialState extends NavBarState {}

class NavBarItemChangeInProgressState extends NavBarState {}

class NavBarItemChangedState extends NavBarState {
  final int currentIndex;
  final Widget currentTab;

  NavBarItemChangedState(
      {@required this.currentTab, @required this.currentIndex});
}
