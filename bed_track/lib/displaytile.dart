import 'package:bedtrack/models/place.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class DisplayTile extends StatefulWidget {
  final int bedNumber;
  final String hospitalName;
  final PlaceLocation location;
  final String imageURL;
  final String phoneNumber;

  DisplayTile({
    this.hospitalName,
    this.imageURL,
    this.location,
    this.phoneNumber,
    this.bedNumber,
  });

  @override
  _DisplayTileState createState() => _DisplayTileState();
}

class _DisplayTileState extends State<DisplayTile> {
  int bedNumber;
  String hospitalName;
  PlaceLocation location;
  String imageURL;
  String phoneNumber;
  void getData() {
    bedNumber = widget.bedNumber;
    hospitalName = widget.hospitalName;
    location = widget.location;
    imageURL = widget.imageURL;
    phoneNumber = widget.phoneNumber;
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    var _height = MediaQuery.of(context).size.height;
    var _width = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.grey[850],
//        gradient: LinearGradient(
//            begin: Alignment.topCenter,
//            end: Alignment.bottomCenter,
//            colors: bedNumber == 0
//                ? [
//                    Colors.white,
//                    Colors.red,
//                  ]
//                : [
//                    Colors.white,
//                    Colors.green,
//                  ]),
//        color: bedNumber == 0 ? Colors.red : Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            blurRadius: 15.0,
            offset: Offset(4.0, 4.0),
            color: Colors.grey[900],
            spreadRadius: 1.0,
          ),
          BoxShadow(
            blurRadius: 13.0,
            offset: Offset(-4.0, -4.0),
            color: Colors.grey[800],
            spreadRadius: 1.0,
          )
        ],
      ),
      child: Column(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
              gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [
                  Colors.black.withOpacity(0.6),
                  Colors.black.withOpacity(0)
                ],
              ),
            ),
            child: Hero(
              tag: "$hospitalName",
              child: Container(
                height: 100,
                width: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    image: NetworkImage(imageURL),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
          ),
          // Container(
          //   height: 100,
          //   width: 200,
          //   decoration: BoxDecoration(
          //     image: DecorationImage(
          //       image: NetworkImage(imageURL),
          //       fit: BoxFit.cover,
          //     ),
          //     borderRadius: BorderRadius.only(
          //       topLeft: Radius.circular(10),
          //       topRight: Radius.circular(10),
          //     ),
          //   ),
          //   child: Container(
          //     decoration: BoxDecoration(
          //       gradient: LinearGradient(
          //         begin: Alignment.bottomCenter,
          //         end: Alignment.topCenter,
          //         colors: [
          //           Colors.black.withOpacity(0.6),
          //           Colors.black.withOpacity(0)
          //         ],
          //       ),
          //       borderRadius: BorderRadius.only(
          //         topLeft: Radius.circular(10),
          //         topRight: Radius.circular(10),
          //       ),
          //     ),
          //   ),
          // ),
          // Container(
          //   margin: EdgeInsets.only(right: 10),
          //   child: Row(
          //     mainAxisSize: MainAxisSize.max,
          //     mainAxisAlignment: MainAxisAlignment.start,
          //     children: <Widget>[
          //       Text(
          //         distance.toString(),
          //         style:
          //             textStyle.copyWith(fontSize: 20, color: Colors.grey),
          //       ),
          //       Icon(
          //         Icons.location_on,
          //         color: Colors.grey,
          //       ),
          //     ],
          //   ),
          // ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 5),
            child: Center(
              child: Text(
                hospitalName,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
//               Container(
//                 alignment: Alignment.centerRight,
//                 decoration: BoxDecoration(
//                   color: bedNumber > 10 ? Colors.green : Colors.red,
//                   borderRadius: BorderRadius.circular(5),
//                   boxShadow: [
//                     BoxShadow(
//                       color:
//                           bedNumber > 10 ? Colors.green[100] : Colors.red[100],
//                       spreadRadius: 5,
//                       blurRadius: 10,
// //                          blurRadius: 15,
//                     )
//                   ],
//                 ),
//               ),
          Row(
            children: <Widget>[
              Icon(
                Icons.location_on,
                color: Colors.white70,
              ),
              Text(
                "0.0 km",
                style: TextStyle(color: Colors.white70),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
