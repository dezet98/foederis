import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:engineering_thesis/models/geolocation.dart';
import 'package:engineering_thesis/repositories/geolocation_repository.dart';
import 'package:equatable/equatable.dart';

part 'geolocation_filter_event.dart';
part 'geolocation_filter_state.dart';

class GeolocationFilterBloc
    extends Bloc<GeolocationFilterEvent, GeolocationFilterState> {
  final GeolocationRepository geolocationRepository;

  GeolocationFilterBloc(this.geolocationRepository)
      : super(GeolocationFilterInitialState()) {
    add(GeolocationFilterLoadEvent());
  }

  List<Geolocation> _results = <Geolocation>[];
  List<Geolocation> _suggestion = <Geolocation>[];
  List<Geolocation> _recentSearches = <Geolocation>[];

  List<Geolocation> results(String query) => _results
      .where((Geolocation element) =>
          element.city.toUpperCase().startsWith(query.toUpperCase()))
      .toList();

  List<Geolocation> get suggestion => _suggestion;
  List<Geolocation> get recentSearches => _recentSearches;

  @override
  Stream<GeolocationFilterState> mapEventToState(
    GeolocationFilterEvent event,
  ) async* {
    if (event is GeolocationFilterLoadEvent) {
      yield* mapGeolocationFilterLoadEvent();
    }
  }

  Stream<GeolocationFilterState> mapGeolocationFilterLoadEvent() async* {
    try {
      _suggestion = await this.geolocationRepository.getAllGeolocations();
      _results = await this.geolocationRepository.getAllGeolocations();
      _recentSearches = await this.geolocationRepository.getAllGeolocations();
      yield GeolocationFilterLoadResultsSuccessState();
    } catch (e) {
      yield GeolocationFilterLoadSuggestionFailureState(message: e.toString());
    }
  }
}
