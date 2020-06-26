import 'dart:math';

import '../models/place.dart';

double distanceCalculator({PlaceLocation firstplace, PlaceLocation secondplace}) {
  double lat1 = firstplace.latitude;
  double long1 = firstplace.longitude;
  double lat2 = secondplace.latitude;
  double long2 = secondplace.longitude;

  double _difflong = long2 - long1;
  double _distance = 6377.830272 * acos((sin(lat1)*sin(lat2)) + (cos(lat1)*cos(lat2)*cos(_difflong)));
  return _distance;
}