import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DataTile extends StatefulWidget {
  final int bedNumber;
  final String hospitalName;
  final String address;
  final String imageURL;
  final String phoneNumber;
  final int distance;
  DataTile({
    this.hospitalName,
    this.imageURL,
    this.address,
    this.phoneNumber,
    this.bedNumber,
    this.distance,
  });
  @override
  _DataTileState createState() => _DataTileState();
}

class _DataTileState extends State<DataTile> {
  int bedNumber;
  String hospitalName;
  String address;
  String imageURL;
  String phoneNumber;
  int distance;
  @override
  void initState() {
    super.initState();
    getData();
  }

  void getData() {
    bedNumber = widget.bedNumber;
    hospitalName = widget.hospitalName;
    address = widget.address;
    imageURL = widget.imageURL;
    phoneNumber = widget.phoneNumber;
    distance = widget.distance;
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Center(
        child: Container(
            padding: EdgeInsets.all(20),
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            height: 0.9 * height,
            width: 0.9 * width,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  child: SingleChildScrollView(
                    child: Column(
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          mainAxisSize: MainAxisSize.max,
                          children: <Widget>[
                            Container(
                              height: 150,
                              width: 250,
                              margin: EdgeInsets.all(15),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(
                                  fit: BoxFit.fill,
                                  image: NetworkImage(
                                    imageURL,
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 27),
                              alignment: Alignment.centerRight,
                              height: 10,
                              width: 10,
                              decoration: BoxDecoration(
                                  color: bedNumber > 10
                                      ? Colors.green
                                      : Colors.red,
                                  borderRadius: BorderRadius.circular(5),
                                  boxShadow: [
                                    BoxShadow(
                                      color: bedNumber > 10
                                          ? Colors.green[100]
                                          : Colors.red[100],
                                      spreadRadius: 5,
                                      blurRadius: 10,
//                          blurRadius: 15,
                                    )
                                  ]),
                            )
                          ],
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 10),
                          child: Text(
                            hospitalName,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 40,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 10),
                          child: Text(
                            "number of beds available = $bedNumber",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 10),
                          child: Text(
                            address,
                            style: TextStyle(color: Colors.black, fontSize: 20),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(
                              Icons.phone,
                              color: Colors.black,
                              size: 20,
                            ),
                            Container(
                              margin: EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 10),
                              child: Text(
                                phoneNumber,
                                style: TextStyle(
                                    color: Colors.black, fontSize: 20),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              distance.toString(),
                              style:
                                  TextStyle(color: Colors.black, fontSize: 20),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Icon(
                              Icons.location_on,
                              color: Colors.red.withOpacity(0.6),
                              size: 20,
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(20),
                  child: FloatingActionButton(
                    elevation: 0,
                    highlightElevation: 0,
                    backgroundColor: Colors.grey,
                    child: Icon(
                      Icons.arrow_back_ios,
                      color: Colors.black,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
