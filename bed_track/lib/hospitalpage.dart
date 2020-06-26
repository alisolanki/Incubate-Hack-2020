import 'package:bedtrack/displaytile.dart';
import 'package:bedtrack/hospitaltile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'datafile.dart';

class ShowHospital extends StatefulWidget {
  @override
  _ShowHospitalState createState() => _ShowHospitalState();
}

class _ShowHospitalState extends State<ShowHospital> {
//  List _dataList = Data().createData();
  List<Data> _dataList = [
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
      hospitalName: "ABC",
      imageURL:
          "https://cdn.pixabay.com/photo/2016/11/06/10/35/hospital-1802679__340.jpg",
      phoneNumber: "+912203340",
      address: "mumbai",
      bedNumber: 50,
      distance: 2,
    )
  ];
  @override
  void initState() {
    super.initState();
//    _dataList = createData();
    print("hello");
    print(_dataList);
  }

  bool openHero = false;
  @override
  Widget build(BuildContext context) {
    print(_dataList[2].distance);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      darkTheme: ThemeData.dark(),
      home: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            //TODO: Add filter actions
          },
          backgroundColor: Colors.grey,
          elevation: 0,
          highlightElevation: 0,
          child: Icon(Icons.filter_none),
        ),
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                height: 100,
                width: double.infinity,
                child: Center(
                  child: Text(
                    'NEARBY HOSPITALS ',
                    style: TextStyle(
                      shadows: <Shadow>[
                        Shadow(
                          color: Colors.grey,
                          offset: Offset(1, 1),
                        ),
                      ],
                      fontSize: 30,
                      wordSpacing: 10,
                      letterSpacing: 10,
                      fontWeight: FontWeight.w500,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
//              DisplayTile(
//                imageURL: _dataList[0].imageURL,
//                address: _dataList[0].address,
//                bedNumber: _dataList[0].bedNumber,
//                distance: _dataList[0].distance,
//                hospitalName: _dataList[0].hospitalName,
//                phoneNumber: _dataList[0].phoneNumber,
//                displayHero: true,
//              ),
              Expanded(
                child: ListView.builder(
                  itemExtent: 200,
                  scrollDirection: Axis.vertical,
                  itemCount: _dataList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      child: Hero(
                        tag: "$index",
                        child: DisplayTile(
                          imageURL: _dataList[index].imageURL,
                          address: _dataList[index].address,
                          bedNumber: _dataList[index].bedNumber,
                          distance: _dataList[index].distance,
                          hospitalName: _dataList[index].hospitalName,
                          phoneNumber: _dataList[index].phoneNumber,
                          displayHero: true,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
//TODO:add the hero navigator
