import 'dart:math';

import 'package:engineering_thesis/data/models/activity.dart';
import 'package:engineering_thesis/generated/l10n.dart';
import 'package:engineering_thesis/ui/components/abstract/nav_bar_tab.dart';
import 'package:engineering_thesis/ui/components/custom_widgets/maps/custom_google_map.dart';
import 'package:flutter/material.dart';
import 'package:geohash/geohash.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class ActivityDetailsMapTab extends NavBarTab {
  final Activity activity;

  ActivityDetailsMapTab({@required this.activity});

  @override
  Widget build(BuildContext context) {
    Point<double> locationPoint = Geohash.decode(activity.geohash);
    return CustomGoogleMap(
      initialLocation: LatLng(locationPoint.x, locationPoint.y),
      markers: {
        Marker(
          position: LatLng(locationPoint.x, locationPoint.y),
          markerId: MarkerId(activity.geohash),
        ),
      },
    );
  }

  @override
  Widget getIcon(BuildContext context) => null;

  @override
  String getLabel(BuildContext context) =>
      S.of(context).activity_details_screen_map_tab_nav_bar_title;
}
