import 'dart:convert';

import 'package:bedtrack/database/data.dart';
import 'package:bedtrack/models/place.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';

class HospitalDataProvider with ChangeNotifier {
  List<DataBaseTemplate> _hospitaldata = [];

  Future<void> fetchData() async {
<<<<<<< HEAD
=======
    List<DataBaseTemplate> _loadeddata = [];
>>>>>>> f6f2f564d7b7cff4606f5f728cf75ee84056b3eb
    const url = 'https://incubateind-hack.firebaseio.com/hospitals.json';
    try {
      final Response _response = await http.get(url);
      final _extractedcategory =
          jsonDecode(_response.body) as Map<String, dynamic>;
<<<<<<< HEAD
//      print(_extractedcategory);
      List<DataBaseTemplate> _loadeddata = [];
=======
      print(_extractedcategory);
>>>>>>> f6f2f564d7b7cff4606f5f728cf75ee84056b3eb
      _extractedcategory.forEach((key, value) {
        _loadeddata.add(DataBaseTemplate(
          id: value['id'],
          hospitalName: key,
          imageURL: value['imageUrl'],
          phoneNumber: value['phoneNumber'],
          bedNumber: value['bedsAvailable'],
          location: PlaceLocation(
            latitude: value['latitude'],
            longitude: value['longitude'],
            address: value['address'],
          ),
        ));
      });
      _hospitaldata = _loadeddata;
      notifyListeners();
    } catch (error) {
      throw (error);
    }
  }

  List<DataBaseTemplate> get datalist {
    return [..._hospitaldata];
  }
}
