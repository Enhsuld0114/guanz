//import 'dart:html';

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:odriintsai/login/api.dart';
//import 'login/signup.dart';
//import '../humuusHoolniiG1/humuusHoolniiG.dart';
import '../Retaurant/list.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

//bool _isloading = false;

class _MyHomePageState extends State<MyHomePage> {
  var username;
  var password;
  String message = "";

  @override
  Widget build(BuildContext context) {
    return new Scaffold(

        //resizeToAvoidBottomPadding: false,
        body: SingleChildScrollView(
            child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          child: Stack(
            children: <Widget>[
              //Image.network('https://is5-ssl.mzstatic.com/image/thumb/Purple123/v4/bd/d2/5d/bdd25df5-7f4f-c5f6-74d4-bde3c8619dab/source/512x512bb.jpg'),
              SizedBox(height: 5),
              Image(
                image: AssetImage('assets/callpro.png'),
                width: 200,
              ),

              Container(
                padding: EdgeInsets.fromLTRB(15.0, 110.0, 0.0, 0.0),
                child: Text(' Lunch',
                    style:
                        TextStyle(fontSize: 80.0, fontWeight: FontWeight.bold)),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(16.0, 175.0, 0.0, 0.0),
                child: Text('time',
                    style:
                        TextStyle(fontSize: 80.0, fontWeight: FontWeight.bold)),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(220.0, 175.0, 0.0, 0.0),
                child: Text('.',
                    style: TextStyle(
                        fontSize: 80.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.green)),
              )
            ],
          ),
        ),
        Container(
            padding: EdgeInsets.only(top: 35.0, left: 20.0, right: 20.0),
            child: Column(
              children: <Widget>[
                TextField(
                  onChanged: (value) {
                    username = value;
                  },
                  //controller: usernameController,

                  decoration: InputDecoration(
                      labelText: ' Нэвтрэх нэр',
                      labelStyle: TextStyle(
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.bold,
                          color: Colors.grey),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.green))),
                ),
                SizedBox(height: 20.0),
                TextField(
                  // controller: passwordController,
                  onChanged: (value) {
                    password = value;
                  },
                  decoration: InputDecoration(
                      labelText: 'Нууц үг',
                      //counterText: "1234",
                      labelStyle: TextStyle(
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.bold,
                          color: Colors.grey),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.green))),
                  obscureText: true,
                ),
                SizedBox(height: 40.0),
                Container(
                  height: 40.0,
                  child: Material(
                    borderRadius: BorderRadius.circular(20.0),
                    shadowColor: Colors.greenAccent,
                    color: Colors.green,
                    elevation: 7.0,
                    child: TextButton(
                      onPressed: () async {
                        print(username);
                        print(password);

                        setState(() {
                          message = 'Please wait...';
                        });
                        var rsp = await signin(username, password);

                        if (rsp.containsKey('status')) {
                          if (rsp["status"] == "success") {
                            Navigator.of(context).pushNamed(Home.routeName,
                                arguments: rsp["data"]);
                            // print(rsp["data"][0]);

                          } else {
                            _showMyDialog(context);
                          }
                        }
                      },
                      child: Center(
                        child: Text(
                          'Нэвтрэх',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Montserrat'),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20.0),
                Container(
                  height: 40.0,
                  child: Material(
                    borderRadius: BorderRadius.circular(20.0),
                    shadowColor: Colors.greenAccent,
                    color: Colors.white,
                    elevation: 7.0,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushNamed('/signup');
                      },
                      child: Center(
                        child: Text(
                          'Бүртгүүлэх',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Montserrat'),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            )),
        SizedBox(height: 15.0),
      ],
    )));
  }
}

Future signin(username, password) async {
  var url = "http://192.168.1.144:4000/api/v1/users";
  //var url = "http://192.168.1.183:4000/api/v1/users";

  //SharedPreferences prefs = await SharedPreferences.getInstance();
  //body = {"username": username, "password": password};
  // var jsonResponse;
  final response = await http.post(
    Uri.parse(url),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      "username": username,
      "password": password,
    }),
  );
  print('login response: ${response.statusCode}');
  print('login response: ${response.body}');
  var jsonResponse = json.decode(response.body);
  return jsonResponse;
}

Future<void> _showMyDialog(context) async {
  return showDialog<void>(
    barrierColor: Colors.black45,
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Alert'),
        content: SingleChildScrollView(
          child: ListBody(
            children: const <Widget>[
              Text('Таны нууц үг эсвэл И-мэйл буруу байна!'),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: const Text('Буцах'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
