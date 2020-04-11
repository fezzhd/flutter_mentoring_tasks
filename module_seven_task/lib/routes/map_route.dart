import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapRoute extends StatelessWidget{

  static final CameraPosition mapPosition = CameraPosition(
    target: LatLng(53.9006, 27.5590),
    zoom: 10,
  );
  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      mapType: MapType.normal,
      initialCameraPosition: mapPosition,
    );
  }
}