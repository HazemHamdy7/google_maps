import 'package:geolocator/geolocator.dart';

class LocationHelper {
  static Future<Position> getLocation() async {
    bool isSeviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!isSeviceEnabled) {
      await Geolocator.requestPermission();
    }
    return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
  }
}
