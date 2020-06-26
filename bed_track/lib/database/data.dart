import '../models/place.dart';

class DataBase {
  int bedNumber;
  String hospitalName;
  String imageURL;
  String phoneNumber;
  PlaceLocation location;

  DataBase(
      {this.hospitalName,
      this.imageURL,
      this.phoneNumber,
      this.bedNumber,
      this.location});

  String gethospitalName() => this.hospitalName;
  String getImageUrl() => this.imageURL;
  String getPhone() => this.phoneNumber;
  int getBedNumber() => this.bedNumber;
  PlaceLocation getLocation() => this.location;

  List<DataBase> getData() {
    List<DataBase> returnData = [
      DataBase(
        hospitalName: "XYZ",
        imageURL:
            "https://cdn.pixabay.com/photo/2016/04/19/13/22/hospital-1338585__340.jpg",
        phoneNumber: "+912203340",
        location: PlaceLocation(address: "Mumbai", longitude: 12.0, latitude: 129.0),
        bedNumber: 50,
      ),
      DataBase(
        hospitalName: "ABC",
        imageURL:
            "https://cdn.pixabay.com/photo/2016/11/06/10/35/hospital-1802679__340.jpg",
        phoneNumber: "+912203340",
        location: PlaceLocation(address: "Mumbai", longitude: 13.0, latitude: 139.0),
        bedNumber: 50,
      ),
      DataBase(
        hospitalName: "LMN",
        imageURL:
            "https://cdn.pixabay.com/photo/2015/09/07/15/12/care-928653__340.jpg",
        phoneNumber: "+912203340",
        location: PlaceLocation(address: "Mumbai", longitude: 14.0, latitude: 129.0),
        bedNumber: 50,
      ),
      DataBase(
        hospitalName: "PQR",
        imageURL:
            "https://cdn.pixabay.com/photo/2016/11/06/10/35/hospital-1802679__340.jpg",
        phoneNumber: "+912203340",
        location: PlaceLocation(address: "Mumbai", longitude: 10.0, latitude: 129.0),
        bedNumber: 50,
      )
    ];
    return returnData;
  }
}