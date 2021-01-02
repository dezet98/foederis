part of 'nav_bar_bloc.dart';

abstract class NavBarEvent extends Equatable {
  const NavBarEvent();

  @override
  List<Object> get props => [];
}

class NavBarItemChangedEvent extends NavBarEvent {
  final int index;

  NavBarItemChangedEvent({@required this.index});
}

class NavBarRefreshEvent extends NavBarEvent {}
