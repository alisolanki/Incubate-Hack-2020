import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class DisplayTile extends StatefulWidget {
  final int bedNumber;
  final String hospitalName;
  final String address;
  final String imageURL;
  final String phoneNumber;
  final double distance;

  DisplayTile({
    this.hospitalName,
    this.imageURL,
    this.address,
    this.phoneNumber,
    this.bedNumber,
    this.distance,
  });

  @override
  _DisplayTileState createState() => _DisplayTileState();
}

class _DisplayTileState extends State<DisplayTile> {
  int bedNumber;
  String hospitalName;
  String address;
  String imageURL;
  String phoneNumber;
  double distance;
  void getData() {
    bedNumber = widget.bedNumber;
    hospitalName = widget.hospitalName;
    address = widget.address;
    imageURL = widget.imageURL;
    phoneNumber = widget.phoneNumber;
    distance = widget.distance;
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
            offset: Offset(5.0, 5.0),
            color: Colors.grey[900],
            spreadRadius: 1.0,
          ),
          BoxShadow(
            blurRadius: 15.0,
            offset: Offset(-5.0, -5.0),
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
                    )),
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
                "$distance km",
                style: TextStyle(color: Colors.white70),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
