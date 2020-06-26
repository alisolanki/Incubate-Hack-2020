import 'package:bedtrack/displaytile.dart';
import 'package:bedtrack/hospitaltile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import './database/data.dart';

class ShowHospital extends StatefulWidget {
  @override
  _ShowHospitalState createState() => _ShowHospitalState();
}

class _ShowHospitalState extends State<ShowHospital> {
  List<DataBase> _dataList = DataBase().getData();

  @override
  Widget build(BuildContext context) {
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
          child: Icon(Icons.filter_list),
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
                    'NEARBY HOSPITALS',
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
              Expanded(
                  child: Center(
                child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                        childAspectRatio: 1, maxCrossAxisExtent: 400),
                    scrollDirection: Axis.vertical,
                    itemCount: _dataList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        child: DisplayTile(
                          imageURL: _dataList[index].imageURL,
                          address: _dataList[index].location.address,
                          bedNumber: _dataList[index].bedNumber,
                          distance: 0.0,
                          hospitalName: _dataList[index].hospitalName,
                          phoneNumber: _dataList[index].phoneNumber,
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute<void>(
                              builder: (BuildContext context) {
                                return DataTile(
                                  imageURL: _dataList[index].imageURL,
                                  address: _dataList[index].location.address,
                                  bedNumber: _dataList[index].bedNumber,
                                  distance: 0.0,
                                  hospitalName: _dataList[index].hospitalName,
                                  phoneNumber: _dataList[index].phoneNumber,
                                );
                              },
                            ),
                          );
                        },
                      );
                    }),
              )),
            ],
          ),
        ),
      ),
    );
  }
}
