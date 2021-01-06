import 'package:engineering_thesis/ui/components/custom_widgets/buttons/custom_button.dart';
import 'package:engineering_thesis/ui/components/custom_widgets/icon/custom_icon.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class CustomGoogleMap extends StatelessWidget {
  final MapType mapType;
  final LatLng initialLocation;
  final Set<Marker> markers;
  final Function(Marker marker) onMarkerTap;
  final Function() onButtonTap;

  CustomGoogleMap({
    @required this.initialLocation,
    this.markers,
    this.onMarkerTap,
    this.mapType = MapType.normal,
    this.onButtonTap,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GoogleMap(
          mapType: mapType,
          initialCameraPosition: CameraPosition(
            target: initialLocation,
            zoom: 16,
          ),
          markers: markers,
        ),
        if (onButtonTap != null)
          Positioned(
            right: 0,
            top: 0,
            child: CustomButton.floatingButton(
              customIcon: CustomIcon.refresh,
              onPressed: onButtonTap,
            ),
          ),
      ],
    );
  }
}
