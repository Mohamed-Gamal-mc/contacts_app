import 'dart:developer';

import 'package:contacts_app/custom_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var n = '';
  var p = '';
  var Name = '';
  var phone = '';
  bool fullMassege = false;
  bool embtyMassege = false;
  List<CustomCard> allCustomCard = [
    CustomCard(Name: '', phone: '', x: false),
    CustomCard(Name: '', phone: '', x: false),
    CustomCard(Name: '', phone: '', x: false),
  ];
  int i = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      // backgroundColor: Colors.transparent,
      appBar: AppBar(title: Text('CONTACTS')),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(30),
          child: Column(
            children: [
              Container(
                child: TextFormField(
                  // inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  onChanged: (newVal) {
                    n = newVal;
                  },
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: new BorderRadius.circular(25.0),
                      ),
                      labelText: 'Enter your name here',
                      prefixIcon: Padding(
                        padding: EdgeInsets.all(0.0),
                        child: Icon(Icons.edit),
                      )),
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 20),
                child: TextFormField(
                    onChanged: (newVal) {
                      setState(() {});
                      p = newVal;
                    },
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(11),
                    ],
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: new BorderRadius.circular(25.0),
                      ),
                      labelText: 'Enter your number here',
                      prefixIcon: Padding(
                          padding: EdgeInsets.all(0.0),
                          child: Icon(
                            Icons.add_ic_call_rounded,
                          )),
                    )),
              ),
              Container(
                // color: Colors.amber,
                padding: EdgeInsets.only(top: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(
                      child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              if (i < allCustomCard.length) {
                                allCustomCard[i] =
                                    CustomCard(Name: n, phone: p, x: true);
                                embtyMassege = false;

                                i++;
                                print(i);
                              } else {
                                print(i);
                                fullMassege = true;
                              }
                            });
                          },
                          child: Text('Add'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color.fromARGB(255, 118, 152, 238),
                          )),
                    ),
                    Expanded(
                      child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              if (i > 0) {
                                allCustomCard[i - 1] =
                                    CustomCard(Name: "", phone: '', x: false);
                                fullMassege = false;

                                i--;
                                print(i);
                              } else {
                                embtyMassege = true;
                              }
                            });
                          },
                          child: Text('Delete'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color.fromARGB(255, 242, 90, 90),
                          )),
                    ),
                  ],
                ),
              ),
              Visibility(
                  visible: embtyMassege,
                  child: Text(
                    'THE LIST OF CONACTS IS embty ',
                    style: TextStyle(color: Colors.red),
                  )),
              allCustomCard[0],
              allCustomCard[1],
              allCustomCard[2],
              Visibility(
                  visible: fullMassege,
                  child: Text(
                    'THE LIST OF CONACTS IS FULL ',
                    style: TextStyle(color: Colors.red),
                  )),
            ],
          ),
        ),
      ),
    ));
  }
}
