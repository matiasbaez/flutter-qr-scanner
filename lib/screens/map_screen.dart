
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:qr_reader/models/models.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  Completer<GoogleMapController> _controller = Completer();
  MapType mapType = MapType.normal;

  @override
  Widget build(BuildContext context) {

    final ScanModel scan = ModalRoute.of(context)?.settings.arguments as ScanModel;

    final CameraPosition initialCameraPosition = CameraPosition(
      target: scan.getLatLng(),
      zoom: 15,
    );

    Set<Marker> markers = new Set<Marker>();
    markers.add(Marker(markerId: MarkerId('geo-place'), position: scan.getLatLng()));

    return Scaffold(
      appBar: AppBar(
        title: Text('Ubication'),
        actions: [
          IconButton(
            onPressed: () async {
              final GoogleMapController controller = await _controller.future;
              controller.animateCamera(CameraUpdate.newCameraPosition(initialCameraPosition));
            },
            icon: Icon(Icons.location_on_sharp)
          )
        ],
      ),
      body: GoogleMap(
        mapType: mapType,
        markers: markers,
        zoomControlsEnabled: false,
        myLocationButtonEnabled: false,
        initialCameraPosition: initialCameraPosition,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.layers),
        onPressed: () {
          mapType = (mapType == MapType.normal) ? MapType.satellite : MapType.normal;
          setState(() {});
        },
      ),
    );
  }
}