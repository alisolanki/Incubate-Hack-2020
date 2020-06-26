import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DataTile extends StatefulWidget {
  final bool isavailable;
  DataTile({this.isavailable = false});
  @override
  _DataTileState createState() => _DataTileState();
}

class _DataTileState extends State<DataTile> {
  bool available;
  @override
  void initState() {
    super.initState();
    getData();
  }

  void getData() {
    available = widget.isavailable;
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        height: 0.73 * height,
        width: 0.9 * width,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
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
                          "https://cdn.pixabay.com/photo/2016/04/19/13/22/hospital-1338585__340.jpg"),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 27),
                  alignment: Alignment.centerRight,
                  height: 10,
                  width: 10,
                  decoration: BoxDecoration(
                      color: available ? Colors.green : Colors.red,
                      borderRadius: BorderRadius.circular(5),
                      boxShadow: [
                        BoxShadow(
                          color:
                              available ? Colors.green[100] : Colors.red[100],
                          spreadRadius: 5,
                          blurRadius: 10,
//                          blurRadius: 15,
                        )
                      ]),
                )
              ],
            )
          ],
        ));
  }
}
