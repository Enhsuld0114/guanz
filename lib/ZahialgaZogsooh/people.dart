import 'dart:developer';
//import 'dart:html';

import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get.dart';
import 'dart:convert' as cnv;
import 'package:http/http.dart' as http;
import 'package:odriintsai/food/data_food.dart';
import '../orderPeople/data_People.dart';

class People extends StatefulWidget {
  static const routeName = "/peoplee";
  @override
  _PeopleState createState() => _PeopleState();
}

class _PeopleState extends State<People> {
  Map data = {};
  List userData = [];
  List userData1 = [];
  Map data1 = {};
  Future<ARes> getData(int resid, int foodid) async {
    //var url = "http://192.168.0.128:4000/api/v1/users/home/$resid/$foodid";

    var url = "http://192.168.1.144:4000/api/v1/users/home/$resid/$foodid";
    //var url = "http://192.168.1.183:4000/api/v1/users/home/$resid/$foodid";
    final response = await http.get(Uri.parse(url));
    // print(response.body);
    log(response.body.toString());
    data = cnv.jsonDecode(response.body);

    setState(() {
      userData = data["result"];
    });
    return ARes.fromJson(data);
  }
  // Future<ARes> photo( int foodid) async {
  //    //var url = "http://192.168.0.128:4000/api/v1/users/home/$resid/$foodid";

  //   var url = "http://192.168.1.183:4000/api/v1/users/home/zuragl/$foodid";
  //    //var url = "http://192.168.1.183:4000/api/v1/users/home/$resid/$foodid";
  //   final response = await http.get(Uri.parse(url));
  //   print(response.body);
  //   data1 = cnv.jsonDecode(response.body);

  //   setState(() {
  //     userData1 = data1["result"];
  //   });
  //   return ARes.fromJson(data1);
  // }

  @override
  void initState() {
    dynamic id = Get.arguments;
   // log(id['restaurants_id'].toString());
   // log(id['foods_id'].toString());
    super.initState();
    getData(id['restaurants_id'], id['foods_id']);
    // photo(id['foods_id']);
  }

  @override
  Widget build(BuildContext context) {
    //dynamic user = ModalRoute.of(context)!.settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: new Center(
            child: Text(
          ' Захиалсан хүмүүс',
          textAlign: TextAlign.end,
        )),
        backgroundColor: Colors.green,
      ),
      body: ListView.builder(
          itemCount: userData == null ? 0 : userData.length,
          itemBuilder: (BuildContext context, int index) {
            // Container(
            //   child: Image(image: NetworkImage(userData1[0]["photo"]),width: 200 ,height: 200,),
            // );
            return GestureDetector(
                child: Card(
              elevation: 7.0,
              margin: EdgeInsets.all(13),
              shadowColor: Colors.greenAccent,
              color: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              child: ListTile(
                  title: Text("${userData[index]["name"]} "),
                  trailing: Text(
                      "Захиалсан  тоо: ${userData[index]["count(oi.user_id)"]}"
                          .toString())),
            ));
          }),
    );
  }
}
