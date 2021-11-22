import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class Mapscreen extends StatefulWidget {
  @override
  _MapState createState() => _MapState();
}

class _MapState extends State<Mapscreen> {
  GoogleMapController mapController; //just like we work with textcontroller
  //goolemapcontroller will provide us different informtion about our map like
  //position,camera postion and so on
  static const _initialPosition = LatLng(27.6794, 85.3206);
  LatLng _lastPosition =
      _initialPosition; //at begining our last position will be equal to initialpostion
  final Set<Marker> _markers = {}; //at the begining it is going to be empty

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          children: <Widget>[
            GoogleMap(
              initialCameraPosition: CameraPosition(
                target: _initialPosition,
                zoom: 17.0,
              ),
              onMapCreated: onCreate,
              myLocationEnabled: true,
              mapType: MapType.normal,
              compassEnabled: true,
              markers: _markers,
              //onCameraMove: _onCameraMove,
            ),
            Positioned(
                top: 40.0,
                right: 10.0,
                child: FloatingActionButton(
                  onPressed: _onAddMarkerPressed,
                  tooltip: 'add marker',
                  backgroundColor: Colors.black,
                  child: Icon(
                    Icons.add_location,
                    color: Colors.white,
                  ),
                ))
          ],
        ),
      ),
    );
}
 void onCreate(GoogleMapController controller) {
    setState(() {
      mapController = controller;
    });
  }
   void _onAddMarkerPressed() {
    setState(() {
      _markers.add(Marker(
        markerId: MarkerId(_lastPosition.toString()),
        position: _lastPosition,
        infoWindow: InfoWindow(
          title: 'Patan Multiple Campus',
          snippet: 'My College',
        ),
        icon: BitmapDescriptor.defaultMarker,
      ));
    });
  }
}
