import 'dart:async';
import 'dart:ui';
import 'package:engineering_thesis/models/activity.dart';
import 'package:engineering_thesis/shared/components/buttons/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_cluster_manager/google_maps_cluster_manager.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class CustomGoogleMap extends StatefulWidget {
  final MapType mapType;
  final LatLng initialLocation;
  final List<ClusterItem<Activity>> clusterItems;
  final Function(Cluster<Activity> cluster) onClusterTap;
  final Function() onButtonTap;

  CustomGoogleMap({
    @required this.initialLocation,
    this.clusterItems,
    this.onClusterTap,
    this.mapType = MapType.normal,
    this.onButtonTap,
  });

  @override
  _CustomGoogleMapState createState() => _CustomGoogleMapState();
}

class _CustomGoogleMapState extends State<CustomGoogleMap> {
  ClusterManager _manager;
  Completer<GoogleMapController> _controller = Completer();
  Set<Marker> markers = Set();

  @override
  void initState() {
    _manager = _buildClusterManager();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GoogleMap(
          mapType: widget.mapType,
          initialCameraPosition: CameraPosition(
            target: widget.initialLocation,
            zoom: 12,
          ),
          markers: markers,
          onMapCreated: (GoogleMapController controller) {
            _controller.complete(controller);
            _manager.setMapController(controller);
          },
          onCameraMove: _manager.onCameraMove,
          onCameraIdle: _manager.updateMap,
        ),
        if (widget.onButtonTap != null)
          Positioned(
            right: 0,
            top: 0,
            child: CustomButton.floatingButton(
              materialIconData: Icons.refresh_outlined,
              onPressed: widget.onButtonTap,
            ),
          ),
      ],
    );
  }

  ClusterManager _buildClusterManager() {
    return ClusterManager<Activity>(
      widget.clusterItems,
      (Set<Marker> markers) {
        setState(() {
          this.markers = markers;
        });
      },
      markerBuilder: _buildMarker,
      initialZoom: 12, // todo , it have to be more concrete
      stopClusteringZoom: 17.0,
    );
  }

  Future<Marker> _buildMarker(Cluster<Activity> cluster) async {
    return Marker(
      markerId: MarkerId(cluster.getId()),
      position: cluster.location,
      onTap: () => widget.onClusterTap(cluster),
      icon: await _getMarkerBitmap(
        cluster.isMultiple ? 125 : 75,
        text: cluster.isMultiple ? cluster.count.toString() : null,
      ),
    );
  }

  // todo change to other, maybe custom
  Future<BitmapDescriptor> _getMarkerBitmap(int size, {String text}) async {
    assert(size != null);

    final PictureRecorder pictureRecorder = PictureRecorder();
    final Canvas canvas = Canvas(pictureRecorder);
    final Paint paint1 = Paint()..color = Colors.orange;
    final Paint paint2 = Paint()..color = Colors.white;

    canvas.drawCircle(Offset(size / 2, size / 2), size / 2.0, paint1);
    canvas.drawCircle(Offset(size / 2, size / 2), size / 2.2, paint2);
    canvas.drawCircle(Offset(size / 2, size / 2), size / 2.8, paint1);

    if (text != null) {
      TextPainter painter = TextPainter(textDirection: TextDirection.ltr);
      painter.text = TextSpan(
        text: text,
        style: TextStyle(
            fontSize: size / 3,
            color: Colors.white,
            fontWeight: FontWeight.normal),
      );
      painter.layout();
      painter.paint(
        canvas,
        Offset(size / 2 - painter.width / 2, size / 2 - painter.height / 2),
      );
    }

    final img = await pictureRecorder.endRecording().toImage(size, size);
    final data = await img.toByteData(format: ImageByteFormat.png);

    return BitmapDescriptor.fromBytes(data.buffer.asUint8List());
  }

  @override
  void dispose() {
    super.dispose();
  }
}
