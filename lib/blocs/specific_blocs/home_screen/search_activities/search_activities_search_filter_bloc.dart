import 'package:engineering_thesis/blocs/abstract_blocs/search_filter/search_filter_bloc.dart';
import 'package:engineering_thesis/blocs/specific_blocs/shared_preferences/shared_preferences_bloc.dart';
import 'package:engineering_thesis/shared/local_database/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:geohash/geohash.dart';
import 'package:google_maps_webservice/places.dart';

class SearchActivitiesSearchFilterBloc
    extends SearchFilterBloc<PlacesSearchResult> {
  final SharedPreferencesBloc sharedPreferencesBloc;

  SearchActivitiesSearchFilterBloc({@required this.sharedPreferencesBloc})
      : super(dealWithNewSelectedOption:
            (PlacesSearchResult selectedOption) async {
          Location location = selectedOption.geometry.location;
          sharedPreferencesBloc.add(
            SharedPreferencesUpdateEvent(
              SharedPreferencesName.geohash,
              Geohash.encode(location.lat, location.lng),
            ),
          );
          sharedPreferencesBloc.add(
            SharedPreferencesUpdateEvent(
              SharedPreferencesName.address,
              selectedOption.formattedAddress,
            ),
          );
        });

  final places =
      new GoogleMapsPlaces(apiKey: DotEnv().env['GOOGLE_BROWSER_KEY']);

  @override
  String display(PlacesSearchResult element) {
    return element.formattedAddress;
  }

  @override
  Future<List<PlacesSearchResult>> fetchRecentSearches() {
    return Future.wait([]);
  }

  @override
  Future<List<PlacesSearchResult>> fetchResults(String query) async {
    return (await places.searchByText(query)).results;
  }

  @override
  Future<List<PlacesSearchResult>> fetchSuggestion() {
    return Future.wait([]);
  }
}
