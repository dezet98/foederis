part of 'geolocation_filter_bloc.dart';

abstract class GeolocationFilterEvent extends Equatable {
  const GeolocationFilterEvent();

  @override
  List<Object> get props => [];
}

class GeolocationFilterLoadEvent extends GeolocationFilterEvent {}
