import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Map',
      home: MapPage(),
    );
  }
}

class MapPage extends StatefulWidget {
  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  MapController mapController = MapController();

  List<LatLng> _latLngList = [
    LatLng(19.074343, 72.90035),
    LatLng(19.074465, 72.90037),
    LatLng(19.07478, 72.89966),
    LatLng(19.074831, 72.89968),
    LatLng(19.075026, 72.8988),
    LatLng(19.075045, 72.89885),
    LatLng(19.075077, 72.898834),
    LatLng(19.075083, 72.89883),
    LatLng(19.07515, 72.89891),
    LatLng(19.07504, 72.89896),
    LatLng(19.075377, 72.89886),
    LatLng(19.075384, 72.8989),
    LatLng(19.075388, 72.898994),
  ];

  List<Marker> _markers = [];

  @override
  void initState() {
    super.initState();
    _markers = _latLngList.map((point) => Marker(
      point: point,
      width: 60,
      height: 60,
      builder: (context) => Icon(
        Icons.pin_drop,
        size: 60,
        color: Colors.blueAccent,
      ),
    )).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Map Demo'),
      ),
      body: FlutterMap(
        mapController: mapController,
        options: MapOptions(
          center: _latLngList[0],
          zoom: 10.0,
        ),
        layers: [
          TileLayerOptions(
            minZoom: 1,
            maxZoom: 18,
            backgroundColor: Colors.black,
            urlTemplate: 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
            subdomains: ['a', 'b', 'c'],
          ),
          MarkerLayerOptions(
            markers: _markers,
          ),
        ],
      ),
    );
  }
}
