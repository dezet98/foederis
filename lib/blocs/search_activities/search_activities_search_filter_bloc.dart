import 'package:engineering_thesis/constants/enums.dart';
import 'package:engineering_thesis/models/fetch_filter.dart';
import 'package:engineering_thesis/models/geolocation.dart';
import 'package:engineering_thesis/repositories/geolocation_repository.dart';
import 'package:flutter/cupertino.dart';
import '../abstract_blocs/search_filter/search_filter_bloc.dart';

class SearchActivitiesSearchFilterBloc extends SearchFilterBloc<Geolocation> {
  GeolocationRepository geolocationRepository;

  SearchActivitiesSearchFilterBloc({@required this.geolocationRepository});

  @override
  Future<List<Geolocation>> fetchRecentSearches() {
    return geolocationRepository.getAllGeolocations();
  }

  @override
  Future<List<Geolocation>> fetchResults() {
    return geolocationRepository.getAllGeolocations();
  }

  @override
  Future<List<Geolocation>> fetchSuggestion() {
    return geolocationRepository.getAllGeolocations();
  }

  @override
  List<Geolocation> filterResults(String query, List<Geolocation> results) {
    return results
        .where((Geolocation element) =>
            element.city.toUpperCase().startsWith(query.toUpperCase()))
        .toList();
  }

  @override
  String display(Geolocation element) {
    return element.city;
  }

  @override
  FetchFilter getFetchFilter(Geolocation selectedOption) {
    return FetchFilter(
      fieldName: 'geolocationRef',
      fieldValue: selectedOption.ref,
      filterType: FetchFilterType.isEqualTo,
    );
  }
}
