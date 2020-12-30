import 'dart:math';

import 'package:engineering_thesis/components/abstract/nav_bar_tab.dart';
import 'package:engineering_thesis/components/custom_widgets/maps/custom_google_map.dart';
import 'package:engineering_thesis/models/activity.dart';
import 'package:flutter/material.dart';
import 'package:geohash/geohash.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class ActivityDetailsMapTab extends NavBarTab {
  final Activity activity;

  ActivityDetailsMapTab({@required this.activity});

  @override
  Widget build(BuildContext context) {
    Point<double> locationPoint = Geohash.decode(activity.geohash);
    // todo create locate there
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
  String getLabel(BuildContext context) => 'Localization';
}
