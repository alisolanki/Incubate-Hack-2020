import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

TextStyle textStyle = TextStyle(
  color: Colors.black,
);

class DisplayTile extends StatefulWidget {
  final int bedNumber;
  final String hospitalName;
  final String address;
  final String imageURL;
  final String phoneNumber;
  final int distance;
  bool displayHero;

  DisplayTile(
      {this.hospitalName,
      this.imageURL,
      this.address,
      this.phoneNumber,
      this.bedNumber,
      this.distance,
      this.displayHero});

  @override
  _DisplayTileState createState() => _DisplayTileState();
}

class _DisplayTileState extends State<DisplayTile> {
  int bedNumber;
  String hospitalName;
  String address;
  String imageURL;
  String phoneNumber;
  int distance;
  bool displayHero;
  void getData() {
    bedNumber = widget.bedNumber;
    hospitalName = widget.hospitalName;
    address = widget.address;
    imageURL = widget.imageURL;
    phoneNumber = widget.phoneNumber;
    distance = widget.distance;
    displayHero = widget.displayHero ?? false;
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      height: 250,
      width: 400,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                height: 80,
                width: 80,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: NetworkImage(imageURL),
                      fit: BoxFit.fill,
                    )),
              ),
              Container(
                child: Center(
                  child: Container(
                    margin: EdgeInsets.only(left: 27),
                    alignment: Alignment.centerRight,
                    height: 10,
                    width: 10,
                    decoration: BoxDecoration(
                      color: bedNumber > 10 ? Colors.green : Colors.red,
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
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          Container(
            child: Center(
              child: Text(
                hospitalName,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                distance.toString(),
                style: textStyle.copyWith(fontSize: 20, color: Colors.grey),
              ),
              Icon(
                Icons.location_on,
                color: Colors.grey,
              ),
            ],
          ),
          displayHero
              ? Expanded(
                  child: Text(
                    "no of beds available = $bedNumber",
                    style: textStyle,
                  ),
                )
              : SizedBox(),
          displayHero
              ? Expanded(
                  child: Text(
                    address,
                    style: textStyle,
                  ),
                )
              : SizedBox(),
          displayHero
              ? Expanded(
                  child: Text(
                    phoneNumber,
                    style: textStyle,
                  ),
                )
              : SizedBox(),
        ],
      ),
    );
  }
}
