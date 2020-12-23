import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:engineering_thesis/constants/enums.dart';
import 'package:engineering_thesis/models/collections/activity_collection.dart';
import 'package:engineering_thesis/models/fetch_filter.dart';
import 'package:engineering_thesis/shared/shared_preferences.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:geohash/geohash.dart';
import 'package:google_maps_webservice/places.dart';
import '../abstract_blocs/search_filter/search_filter_bloc.dart';

class SearchActivitiesSearchFilterBloc
    extends SearchFilterBloc<PlacesSearchResult> {
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

  List<FetchFilter> getFetchFilters() {
    Location location = this.selectedOption.geometry.location;
    int distanceKm = int.parse(SharedPreferences().distanceKm);

    var lowerLat = location.lat - 0.0144927536231884 * distanceKm;
    var lowerLon = location.lng - 0.0181818181818182 * distanceKm;
    var upperLat = location.lat + 0.0144927536231884 * distanceKm;
    var upperLon = location.lng + 0.0181818181818182 * distanceKm;

    return [
      FetchFilter(
        fieldName: ActivityCollection.geohash.fieldName,
        fieldValue: Geohash.encode(lowerLat, lowerLon),
        filterType: FetchFilterType.isGreaterThanOrEqualTo,
      ),
      // FetchFilter(
      //   fieldName: ActivityCollection.startDate.fieldName,
      //   fieldValue: DateTime.now(),
      //   filterType: FetchFilterType.isGreaterThan,
      // ),
      FetchFilter(
        fieldName: ActivityCollection.geohash.fieldName,
        fieldValue: Geohash.encode(upperLat, upperLon),
        filterType: FetchFilterType.isLessThanOrEqualTo,
      ),
    ];
  }
}
