import 'dart:convert';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
//import 'package:get/get_core/src/get_main.dart';
import 'package:http/http.dart' as http;
import 'package:odriintsai/Retaurant/list.dart';

class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  var mail;
  var phone;
  var name;
  //var albaNegj;
  var ovog;

  var password;

  // String albaN = ' ';
  // List alba = [
  //   "Үйл ажилгааны газар",
  //   "Шинэ бүтээгдэхүүн хөгжүүлэлтйин газар",
  //   "Санхүү",
  //   "Суурилуулалт"
  // ];

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
                //Scrollbar(
                Container(
                  padding: EdgeInsets.fromLTRB(15.0, 110.0, 0.0, 0.0),
                  child: Text(
                    'Signup',
                    style:
                        TextStyle(fontSize: 80.0, fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(260.0, 125.0, 0.0, 0.0),
                  child: Text(
                    '.',
                    style: TextStyle(
                        fontSize: 80.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.green),
                  ),
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
                        ovog = value;
                      },
                      decoration: InputDecoration(
                          labelText: 'Овог',
                          labelStyle: TextStyle(
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.bold,
                              color: Colors.grey),
                          // hintText: 'EMAIL',
                          // hintStyle: ,

                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.green)))),
                  SizedBox(height: 10.0),
                  TextField(
                    onChanged: (value) {
                      name = value;
                    },
                    decoration: InputDecoration(
                        labelText: 'Нэр ',
                        labelStyle: TextStyle(
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.bold,
                            color: Colors.grey),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.green))),
                    //obscureText: true,
                  ),
                  SizedBox(height: 10.0),
                  TextField(
                    onChanged: (value) {
                      phone = value;
                    },
                    decoration: InputDecoration(
                        labelText: ' Утасны  дугаар',
                        labelStyle: TextStyle(
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.bold,
                            color: Colors.grey),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.green))),
                  ),
                  SizedBox(height: 50.0),
                  TextField(
                    onChanged: (value) {
                      mail = value;
                    },
                    decoration: InputDecoration(
                        labelText: 'Мэйл хаяг',
                        hintText: "callpro-н мэйл хаягаар бүртгүүлнэ үү",
                        labelStyle: TextStyle(
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.bold,
                            color: Colors.grey),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.green))),
                  ),
                  SizedBox(height: 50.0),
                  TextField(
                    onChanged: (value) {
                      password = value;
                    },
                    decoration: InputDecoration(
                        labelText: 'Шинэ нууц үг',
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
                      //height: 20.0,
                      child: Material(
                        borderRadius: BorderRadius.circular(20.0),
                        shadowColor: Colors.greenAccent,
                        color: Colors.green,
                        elevation: 7.0,
                        child: GestureDetector(
                          onTap: () {
                            print(name);
                            print(ovog);
                            //print(albaNegj);
                            print(phone);
                            print(mail);
                            print(password);
                            //signup(mail, phone, name, ovog, password);
                               var rsp =  signup(mail, phone, name, ovog, password);
                        if (rsp.containsKey('status')) {
                          if (rsp["status"] == "success") {
                            //    Navigator.of(context).push(MaterialPageRoute(
                            //     builder: (BuildContext context) {
                            //   return Home( item:rsp["data"]);
                            // }));
                            //Navigator.of(context).pushNamed(Home.routeName);
                            Get.back();

                          } else {
                            _showMyDialog(context);
                          }
                        }

                          },
                          child: Center(
                            child: Text(
                              'Бүртгүүлэх',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Montserrat'),
                            ),
                          ),
                        ),
                      )),
                  SizedBox(height: 20.0),
                  Container(
                    height: 40.0,
                    // height: 20.0,
                    color: Colors.transparent,
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: Colors.black,
                              style: BorderStyle.solid,
                              width: 1.0),
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(20.0)),
                      child: InkWell(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: Center(
                          child: Text('Буцах',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Montserrat')),
                        ),
                      ),
                    ),
                  ),
                ],
              )),
        ]
        )
        )
        );
  }
}
//  var mail;
//   var utas;
//   var ner;

//   var ovog;

//   var password;
signup(mail, phone, name, ovog, password) async {
  var url = "http://192.168.0.128:4000/api/v1/users/signup";
  final response = await http.post(
    Uri.parse(url),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'ovog': ovog,
      'name': name,
      'phone': phone,
      'mail': mail,
      'password': password,
    }),
  );
  print('login response: ${response.statusCode}');
  print('login response: ${response.body}');
  // if (response.statusCode == 201) {
  // } else {
  //   throw Exception('Бүртгэл амжилтггүй client');
  // }
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
              Text('Таны бүртгэл амжилтгүй боллоо'),
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

