import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  String Name;
  String phone;
  bool x;
  CustomCard({required this.Name, required this.phone, required this.x});

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: x,
      child: Container(
        height: 100,
        padding: EdgeInsets.only(left: 20),
        margin: EdgeInsets.only(top: 40),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: Color.fromARGB(255, 174, 203, 216),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
                child: Container(
              alignment: Alignment.centerLeft,
              child: Text(
                'Name : $Name',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              // color: Colors.amber,
            )),
            Expanded(
                child: Container(
              alignment: Alignment.centerLeft,
              child: Text(
                'Phone : $phone',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              // color: Color.fromARGB(255, 163, 42, 42),
            )),
          ],
        ),
      ),
    );
  }
}
