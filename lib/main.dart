import 'dart:math';

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.deepOrange),
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculator'),
        elevation: 20.0,
      ),
      body: Container(
          child: Column(children: [
        Expanded(
          child: Container(
            padding: EdgeInsets.all(10.0),
            alignment: Alignment.bottomRight,
            child: Text("$text",
                style: TextStyle(
                  fontSize: 60.0,
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                )),
          ),
        ),
        Divider(
          height: 20.0,
          thickness: 0.50,
          endIndent: 15.0,
          indent: 15.0,
          color: Colors.grey,
        ),
        Row(
          children: [
            calc_add("sqrt"),
            calc_add("^"),
            calc_add("%"),
            calc_add("/"),
          ],
        ),
        Row(
          children: [
            calc_button("9"),
            calc_button("8"),
            calc_button("7"),
            calc_add("x"),
          ],
        ),
        Row(
          children: [
            calc_button("6"),
            calc_button("5"),
            calc_button("4"),
            calc_add("-"),
          ],
        ),
        Row(
          children: [
            calc_button("3"),
            calc_button("2"),
            calc_button("1"),
            calc_add("+"),
          ],
        ),
        Row(
          children: [
            calc_add("AC"),
            calc_button("0"),
            calc_add("."),
            RaisedButton(
              padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 3.5),
              child: Text("=",
                  style: TextStyle(
                    fontSize: 45.0,
                    fontWeight: FontWeight.normal,
                  )),
              splashColor: Colors.greenAccent,
              highlightColor: Colors.lightBlueAccent,
              /*borderSide: BorderSide(

                width: 5.0,
                style: BorderStyle.solid,
              ),*/
              color: Colors.deepOrange,
              textColor: Colors.white,
              onPressed: () => btnClicked("="),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100.0)),
            ),
          ],
        ),
      ])),
      backgroundColor: Colors.black12,
    );
  }

  Widget calc_add(String val) {
    return Expanded(
      child: RaisedButton(
        highlightElevation: 10.0,
        padding: EdgeInsets.all(25.0),
        child: Text("$val",
            style: TextStyle(
              fontSize: 28.5,
              fontWeight: FontWeight.w500,
            )),
        splashColor: Colors.orange,
        highlightColor: Colors.orange,
        color: Colors.black12,
        textColor: Colors.deepOrange,
        onPressed: () => btnClicked(val),
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.0)),
      ),
    );
  }

  Widget calc_button(String val) {
    return Expanded(
      child: RaisedButton(
        highlightElevation: 10.0,
        padding: EdgeInsets.all(25.0),
        child: Text("$val",
            style: TextStyle(
              fontSize: 30.0,
            )),
        splashColor: Colors.orange,
        highlightColor: Colors.deepOrange,
        color: Colors.black,
        textColor: Colors.white,
        onPressed: () => btnClicked(val),
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.0)),
      ),
    );
  }

  int first = 0;
  int second = 0;
  String res = "";
  String text = "";
  String opp = "";
  void btnClicked(String btnText) {
    if (btnText == "AC") {
      res = "";
      text = "";
      first = 0;
      second = 0;
    } else if (btnText == "+" ||
        btnText == "-" ||
        btnText == "x" ||
        btnText == "/" ||
        btnText == "%" ||
        btnText == "^") {
      first = int.parse(text);
      res = "";
      opp = btnText;
    } else if (btnText == "=") {
      second = int.parse(text);
      if (opp == "+") {
        res = (first + second).toString();
      }
      if (opp == "-") {
        res = (first - second).toString();
      }
      if (opp == "x") {
        res = (first * second).toString();
      }
      if (opp == "/") {
        res = (first / second).toString();
      }
      if (opp == "%") {
        res = (first % second).toString();
      }
      if (opp == "^") {
        res = pow(first, second).toString();
      }
      if (opp == "sqrt") {
        res = sqrt(first).toString();
      }
    } else if (btnText == "sqrt") {
      first = int.parse(text);
      res = sqrt(first).toString();
    } else {
      res = text + btnText;
    }
    setState(() {
      text = res;
    });
  }
}
