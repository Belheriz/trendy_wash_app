import 'package:flutter/services.dart';
import 'package:location/location.dart';

class LocationService {
  late Location _location;
  bool _serviceEnable = false;
  PermissionStatus? _grantPermission;

  LocationService() {
    _location = Location();
  }

  Future<bool> _checkPermission() async {
    if (await _checkService()) {
      _grantPermission = await _location.hasPermission();
      if (_grantPermission == PermissionStatus.denied) {
        _grantPermission = await _location.requestPermission();
      }
    }

    return _grantPermission == PermissionStatus.granted;
  }

  Future<bool> _checkService() async {
    try {
      _serviceEnable = await _location.serviceEnabled();
      if (!_serviceEnable) {
        _serviceEnable = await _location.requestService();
      }
    } on PlatformException catch (error) {
      print('error code is ${error.code} and message = ${error.message}');
      _serviceEnable = false;
      await _checkService();
    }

    return _serviceEnable;
  }

  Future<LocationData?> getLocation() async {
    if (await _checkPermission()) {
      final locationData = _location.getLocation();
      return locationData;
    }

    return null;
  }
}
