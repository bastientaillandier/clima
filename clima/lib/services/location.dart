import 'package:geolocator/geolocator.dart';

class Location {
  Location({this.latitude, this.longitude});

  double? latitude;
  double? longitude;

  Future getCurrentPosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    //Check is GPS is enable
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.low);
      longitude = position.longitude;
      latitude = position.latitude;
    } catch (e) {
      rethrow;
    }
  }
}
