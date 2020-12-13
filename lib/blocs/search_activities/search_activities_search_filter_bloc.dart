import 'package:engineering_thesis/constants/enums.dart';
import 'package:engineering_thesis/models/collections/activity_collection.dart';
import 'package:engineering_thesis/models/fetch_filter.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
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

  FetchFilter getFetchFilter() {
    return FetchFilter(
      fieldName: ActivityCollection.geohash.fieldName,
      fieldValue: '', //this.selectedOption.,
      filterType: FetchFilterType.isNotEqualTo,
    );
  }
}
