class Data {
  int bedNumber;
  String hospitalName;
  String address;
  String imageURL;
  String phoneNumber;
  int distance;

  Data(
      {this.hospitalName,
      this.imageURL,
      this.address,
      this.phoneNumber,
      this.bedNumber,
      this.distance});
  String gethospitalName() => this.hospitalName;
  String getImageUrl() => this.imageURL;
  String getAddress() => this.address;
  String getPhone() => this.phoneNumber;
  int getBedNumber() => this.bedNumber;
  int getDistance() => this.distance;
}

List<Data> createData() {
  List<Data> returnData = [
    Data(
      hospitalName: "XYZ",
      imageURL:
          "https://cdn.pixabay.com/photo/2016/04/19/13/22/hospital-1338585__340.jpg",
      phoneNumber: "+912203340",
      address: "mumbai",
      bedNumber: 50,
      distance: 2,
    ),
    Data(
      hospitalName: "ABC",
      imageURL:
          "https://cdn.pixabay.com/photo/2016/11/06/10/35/hospital-1802679__340.jpg",
      phoneNumber: "+912203340",
      address: "mumbai",
      bedNumber: 50,
      distance: 2,
    ),
    Data(
      hospitalName: "LMN",
      imageURL:
          "https://cdn.pixabay.com/photo/2015/09/07/15/12/care-928653__340.jpg",
      phoneNumber: "+912203340",
      address: "mumbai",
      bedNumber: 50,
      distance: 2,
    ),
    Data(
      hospitalName: "PQR",
      imageURL:
          "https://cdn.pixabay.com/photo/2016/11/06/10/35/hospital-1802679__340.jpg",
      phoneNumber: "+912203340",
      address: "mumbai",
      bedNumber: 50,
      distance: 2,
    )
  ];

  return returnData;
}
