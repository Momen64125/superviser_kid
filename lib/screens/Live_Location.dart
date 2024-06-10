// import 'dart:async';
//
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:location/location.dart';
//
// class live_location extends StatefulWidget {
//   const live_location({super.key});
//
//   @override
//   State<live_location> createState() => _live_locationState();
// }
//
// class _live_locationState extends State<live_location> {
//   Completer<GoogleMapController> _googleMapController = Completer();
//   CameraPosition? _cameraPosition;
//   Location? _location;
//   LocationData? _currentLocation;
//   @override
//   void initState() {
//     _init();
//     super.initState();
//   }
//
//   _init() async {
//     _location = Location();
//     _cameraPosition = CameraPosition(
//         target: LatLng(0, 0), // this is just the example lat and lng for initializing
//         zoom: 15
//     );
//     _initLocation();
//   }
//   //function to listen when we move position
//   _initLocation() {
//     //use this to go to current location instead
//     _location?.getLocation().then((location) {
//       _currentLocation = location;
//     });
//     _location?.onLocationChanged.listen((newLocation) {
//       _currentLocation = newLocation;
//       moveToPosition(LatLng(_currentLocation?.latitude ?? 0, _currentLocation?.longitude ?? 0));
//     });
//   }
//   moveToPosition(LatLng latLng) async {
//     GoogleMapController mapController = await _googleMapController.future;
//     mapController.animateCamera(
//         CameraUpdate.newCameraPosition(
//             CameraPosition(
//                 target: latLng,
//                 zoom: 15
//             )
//         )
//     );
//   }
//
//
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: _buildBody(),
//     );
//   }
//
//   Widget _buildBody() {
//     return _getMap();
//   }
//   Widget _getMarker() {
//     return Container(
//       width: 40,
//       height: 40,
//       padding: EdgeInsets.all(2),
//       decoration: BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.circular(100),
//           boxShadow: [
//             BoxShadow(
//                 color: Colors.grey,
//                 offset: Offset(0,3),
//                 spreadRadius: 4,
//                 blurRadius: 6
//             )
//           ]
//       ),
//       child:  ClipOval(child: Image.network("https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885_640.jpg")),
//     );
//   }
//
//   Widget _getMap() {
//     return Stack(
//       children: [
//         GoogleMap(
//           initialCameraPosition: _cameraPosition!,
//           mapType: MapType.normal,
//           onMapCreated: (GoogleMapController controller) {
//             // now we need a variable to get the controller of google map
//             if (!_googleMapController.isCompleted) {
//               _googleMapController.complete(controller);
//             }
//           },
//         ),
//
//         Positioned.fill(
//             child: Align(
//                 alignment: Alignment.center,
//                 child: _getMarker()
//             )
//         )
//       ],
//     );
//   }
// }


import 'dart:async';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:http/http.dart' as http;

import '../main.dart';

class LiveLocation extends StatefulWidget {
  const LiveLocation({super.key});

  @override
  State<LiveLocation> createState() => _LiveLocationState();
}

class _LiveLocationState extends State<LiveLocation> {
  Completer<GoogleMapController> _googleMapController = Completer();
  CameraPosition? _cameraPosition;
  Location? _location;
  LocationData? _currentLocation;

  @override
  void initState() {
    _init();
    super.initState();
  }

  _init() async {
    _location = Location();
    _cameraPosition = CameraPosition(
        target: LatLng(0, 0),
        zoom: 15
    );
    _initLocation();
  }

  _initLocation() {
    _location?.getLocation().then((location) {
      setState(() {
        _currentLocation = location;
      });
    });
    _location?.onLocationChanged.listen((newLocation) {
      setState(() {
        _currentLocation = newLocation;
      });
      moveToPosition(LatLng(_currentLocation?.latitude ?? 0, _currentLocation?.longitude ?? 0));


      sendLocationToBackend(_currentLocation);
    });
  }

  moveToPosition(LatLng latLng) async {
    GoogleMapController mapController = await _googleMapController.future;
    mapController.animateCamera(
        CameraUpdate.newCameraPosition(
            CameraPosition(
                target: latLng,
                zoom: 15
            )
        )
    );
  }


  sendLocationToBackend(LocationData? locationData) async {
    if(locationData != null) {

      String url = 'https://gp-saveurkid.up.railway.app/api/updateLocation/${Supervisor_ID}';

      Map<String, dynamic> data = {
        'location': '${locationData.latitude},${locationData.longitude}'
      };


      try {
        var response = await http.post(
          Uri.parse(url),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
            'Authorization': 'Bearer $token',
          },
          body: jsonEncode(data),
        );
       

        print('Response status: ${response.statusCode}');
        print('Response body: ${response.body}');
      } catch (error) {
        print('Error sending location data: $error');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return _getMap();
  }

  Widget _getMap() {
    return Stack(
      children: [
        GoogleMap(
          initialCameraPosition: _cameraPosition!,
          mapType: MapType.normal,
          onMapCreated: (GoogleMapController controller) {
            if (!_googleMapController.isCompleted) {
              _googleMapController.complete(controller);
            }
          },
        ),

        Positioned.fill(
          child: Align(
            alignment: Alignment.center,
            child: _getMarker(),
          ),
        )
      ],
    );
  }

  Widget _getMarker() {
    return Container(
      width: 40,
      height: 40,
      padding: EdgeInsets.all(2),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(100),
          boxShadow: [
            BoxShadow(
                color: Colors.grey,
                offset: Offset(0,3),
                spreadRadius: 4,
                blurRadius: 6
            )
          ]
      ),
      child: ClipOval(
        child: Image.network( '${Supervisor_Image!}'),
      ),
    );
  }
}
