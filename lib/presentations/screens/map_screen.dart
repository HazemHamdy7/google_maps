import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps/constant/colors_app.dart';
import 'package:google_maps/helpers/location_helper.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';

import '../../bussniss_logic/phone_auth/phone_auth_cubit.dart';
import '../widgets/my_drawer.dart';
import '../widgets/search_bar.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

//!-1
class _MapScreenState extends State<MapScreen> {
  PhoneAuthCubit phoneauthCubit = PhoneAuthCubit();
  static Position? position;
  final Completer<GoogleMap> _mapController = Completer();
  static final CameraPosition _myCameraCurrentLocation = CameraPosition(
      bearing: 0.0,
      tilt: 0.0,
      zoom: 17,
      target: LatLng(position!.latitude, position!.longitude));
//!-2
  // Future<void> getMyCurrentLocation() async {
  //   await LocationHelper.getLocation();
  //   position = await Geolocator.getLastKnownPosition().whenComplete(() {
  //     setState(() {});
  //   });
  // }

  Future<void> getMyCurrentLocation() async {
    position = await LocationHelper.getLocation().whenComplete(() {
      setState(() {});
    });
  }

  //! - 3
  @override
  void initState() {
    getMyCurrentLocation();
    super.initState();
  }

//! -4
  Widget buildMap() {
    return GoogleMap(
        initialCameraPosition: _myCameraCurrentLocation,
        mapType: MapType.normal,
        myLocationButtonEnabled: true,
        zoomControlsEnabled: false,
        myLocationEnabled: false,
        onMapCreated: (GoogleMapController controller) {
          _mapController.complete(controller as FutureOr<GoogleMap>?);
        });
  }

//! - 5

  Future<void> _goToMyCurrentLocation() async {
    final GoogleMapController controller =
        (await _mapController.future) as GoogleMapController;

    controller.animateCamera(
        CameraUpdate.newCameraPosition(_myCameraCurrentLocation));
  }

  // //! 6 search bar .....

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: const MyDrawer(),
        body: Stack(
          fit: StackFit.expand,
          children: [
            position != null
                ? buildMap()
                : const Center(
                    child: CircularProgressIndicator(color: Colors.blue),
                  ),
            const FloatingSearchbar(),
          ],
        ),
        floatingActionButton: Container(
          margin: const EdgeInsets.fromLTRB(0, 0, 8, 30),
          child: FloatingActionButton(
            onPressed: _goToMyCurrentLocation,
            child: const Icon(
              Icons.place,
              color: Colors.white,
            ),
          ),
        ));
  }
}
