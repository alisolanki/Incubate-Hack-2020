import 'package:flutter/cupertino.dart';
import 'package:geolocator/geolocator.dart';

import '../models/place.dart';

Future<PlaceLocation> getLocation() async {
  PlaceLocation _user;
  try{
    Position _position = await Geolocator()
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    _user.longitude = _position.latitude;
    _user.longitude = _position.longitude;
    return _user;
  }catch(error){
    throw(error);
  }
}
