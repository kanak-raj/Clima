import 'package:geolocator/geolocator.dart';
import 'package:clima/screens/location_screen.dart';

class Location {
  double latitude;
  double longitude;
  Future getcurrentlocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.low);
      latitude = position.latitude;
      longitude = position.longitude;
    } catch (e) {
      print(e);
    }
  }
}
