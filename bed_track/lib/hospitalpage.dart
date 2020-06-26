import 'package:bedtrack/calculators/user_location.dart';
import 'package:bedtrack/displaytile.dart';
import 'package:bedtrack/hospitaltile.dart';
import 'package:bedtrack/models/place.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import './database/data.dart';

class ShowHospital extends StatefulWidget {
  @override
  _ShowHospitalState createState() => _ShowHospitalState();
}

class _ShowHospitalState extends State<ShowHospital> {
  List<DataBase> _dataList, _filteredhospitals;
  Future<PlaceLocation> _user = getLocation();
  bool openSort = false;
  bool avabed = false, closest = false, oxytanks = false, venti = false;

  @override
  void initState() {
    _dataList = DataBase().getData();
    _filteredhospitals = _dataList;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      darkTheme: ThemeData.dark(),
      home: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              openSort = !openSort;
            });
          },
          backgroundColor: Colors.grey,
          elevation: 0,
          highlightElevation: 0,
          child: Icon(openSort ? Icons.keyboard_return : Icons.filter_list),
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
                    'HOSPITALS',
                    style: TextStyle(
                      shadows: <Shadow>[
                        Shadow(
                          color: Colors.grey,
                          offset: Offset(1, 1),
                        ),
                      ],
                      fontSize: 35,
                      wordSpacing: 10,
                      letterSpacing: 10,
                      fontWeight: FontWeight.w500,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.only(bottom: 8.0, left: 8.0, right: 8.0),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Search Hospitals",
                    icon: Icon(Icons.search),
                  ),
                  onChanged: (text) {
                    setState(() {
                      _filteredhospitals = _dataList
                          .where(
                            (element) => (element.hospitalName
                                .toLowerCase()
                                .contains(text.toLowerCase())),
                          )
                          .toList();
                    });
                  },
                ),
              ),
              Expanded(
                  child: Center(
                child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                        childAspectRatio: 1, maxCrossAxisExtent: 400),
                    scrollDirection: Axis.vertical,
                    itemCount: _filteredhospitals.length,
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        key: ValueKey(_filteredhospitals[index].id),
                        child: DisplayTile(
                          imageURL: _filteredhospitals[index].imageURL,
                          location: _filteredhospitals[index].location,
                          bedNumber: _filteredhospitals[index].bedNumber,
                          hospitalName: _filteredhospitals[index].hospitalName,
                          phoneNumber: _filteredhospitals[index].phoneNumber,
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute<void>(
                              builder: (BuildContext context) {
                                return DataTile(
                                  imageURL: _filteredhospitals[index].imageURL,
                                  location: _filteredhospitals[index].location,
                                  bedNumber:
                                      _filteredhospitals[index].bedNumber,
                                  hospitalName:
                                      _filteredhospitals[index].hospitalName,
                                  phoneNumber:
                                      _filteredhospitals[index].phoneNumber,
                                );
                              },
                            ),
                          );
                        },
                      );
                    }),
              )),
              Container(
                color: Color(0xff0404040),
                alignment: Alignment.centerRight,
                child: Visibility(
                    visible: openSort,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          "Sort by : ",
                          style: TextStyle(fontSize: 20),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 10),
                          color: Colors.black,
                          height: 1,
                          width: 200,
                        ),
                        FlatButton(
                          onPressed: () {
                            setState(() {
                              avabed = !avabed;
                            });
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Text(
                                "number of beds available    ",
                                style: TextStyle(
                                  color: avabed ? Colors.white : Colors.grey,
                                ),
                              ),
                              Icon(
                                avabed
                                    ? Icons.check_box
                                    : Icons.check_box_outline_blank,
                                color: avabed ? Colors.white : Colors.grey,
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 10),
                          color: Colors.grey,
                          height: 0,
                          width: 200,
                        ),
                        FlatButton(
                          onPressed: () {
                            setState(() {
                              oxytanks = !oxytanks;
                            });
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Text(
                                "Availability of Oxygen tanks ",
                                style: TextStyle(
                                  color: oxytanks ? Colors.white : Colors.grey,
                                ),
                              ),
                              Icon(
                                oxytanks
                                    ? Icons.check_box
                                    : Icons.check_box_outline_blank,
                                color: oxytanks ? Colors.white : Colors.grey,
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 10),
                          color: Colors.grey,
                          height: 0,
                          width: 200,
                        ),
                        FlatButton(
                          onPressed: () {
                            setState(() {
                              venti = !venti;
                            });
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Text(
                                "Availability of Ventilators    ",
                                style: TextStyle(
                                  color: venti ? Colors.white : Colors.grey,
                                ),
                              ),
                              Icon(
                                venti
                                    ? Icons.check_box
                                    : Icons.check_box_outline_blank,
                                color: venti ? Colors.white : Colors.grey,
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 10),
                          color: Colors.grey,
                          height: 0,
                          width: 200,
                        ),
                        FlatButton(
                          onPressed: () {
                            setState(() {
                              closest = !closest;
                            });
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Text(
                                "Closest hospital                   ",
                                style: TextStyle(
                                  color: closest ? Colors.white : Colors.grey,
                                ),
                              ),
                              Icon(
                                closest
                                    ? Icons.check_box
                                    : Icons.check_box_outline_blank,
                                color: closest ? Colors.white : Colors.grey,
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 10),
                          color: Colors.grey,
                          height: 0,
                          width: 200,
                        ),
                      ],
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
