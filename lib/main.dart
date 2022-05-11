import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:odriintsai/food/userfood.dart';
import './food/adminfood.dart';
import './Retaurant/list.dart';
import './Retaurant/restaurant.dart';
import './orderPeople/adminPeople.dart';
import './ZahialgaZogsooh/zahialga.dart';
import './Retaurant/zahialga.dart';
import './ZahialgaZogsooh/people.dart';
import 'login/signup.dart';
import './login/login.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new GetMaterialApp(
      debugShowCheckedModeBanner: false,
      routes: <String, WidgetBuilder>{
        '/signup': (BuildContext context) => new SignupPage(),
        "/user-food": (BuildContext context) => new UserFood(),
        "/admin-food": (BuildContext context) => new AdminFood(),
        "/home": (BuildContext context) => new Home(),
        "/NonRes": (BuildContext context) => new MyRes(),
          "/people": (BuildContext context) => new AdminPeople(),
           "/zogsooh": (BuildContext context) => new Zogsooh(),
           "/admin":(BuildContext context) => new Admin(),
            "/peoplee": (BuildContext context) => new People(),
      },
      home: new MyHomePage(),
    );
  }
}

