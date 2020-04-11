import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

const String _markerIdKey = "my_marker";
final LatLng _mapPosition = LatLng(53.9006, 27.5590);

class MapRoute extends StatefulWidget{
  @override
  _MapRouteState createState() => _MapRouteState();
}

class _MapRouteState extends State<MapRoute> {

  Set<Marker> _markers = {};

  final CameraPosition _cameraPosition = CameraPosition(
    target: _mapPosition,
    zoom: 10,
  );

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      mapType: MapType.normal,
      initialCameraPosition: _cameraPosition,
      markers: _markers,
      onMapCreated: _handleMapCreated,
    );
  }

  void _handleMapCreated(GoogleMapController controller) {
    var newMarker = Marker(
      markerId: MarkerId(_markerIdKey),
      position: _mapPosition
    );
    setState(() {
      _markers.add(newMarker);
    });
  }
}