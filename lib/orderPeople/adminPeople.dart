import 'dart:developer';
//import 'dart:math';
//import 'dart:html';

import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get.dart';
import 'dart:convert' as cnv;
import 'package:http/http.dart' as http;
import 'package:odriintsai/food/data_food.dart';
import '../orderPeople/data_People.dart';

// class AdminPeople extends StatefulWidget {
//   static const routeName = "/people";
//   @override
//   _AdminPeopleState createState() => _AdminPeopleState();
// }

// class _AdminPeopleState extends State<AdminPeople> {
//   Map data = {};
//   List userData = [];
//   List userData1 = [];
//   Map data1 = {};
//   Future<ARes> getData(int resid, int foodid) async {
//     //var url = "http://192.168.0.128:4000/api/v1/users/home/$resid/$foodid";

//     var url = "http://192.168.1.183:4000/api/v1/users/home/$resid/$foodid";
//     //var url = "http://192.168.1.183:4000/api/v1/users/home/$resid/$foodid";
//     final response = await http.get(Uri.parse(url));
//     print(response.body);
//     data = cnv.jsonDecode(response.body);

//     setState(() {
//       userData = data["result"];
//     });
//     return ARes.fromJson(data);
//   }
//   // Future<ARes> photo( int foodid) async {
//   //    //var url = "http://192.168.0.128:4000/api/v1/users/home/$resid/$foodid";

//   //   var url = "http://192.168.1.183:4000/api/v1/users/home/zuragl/$foodid";
//   //    //var url = "http://192.168.1.183:4000/api/v1/users/home/$resid/$foodid";
//   //   final response = await http.get(Uri.parse(url));
//   //   print(response.body);
//   //   data1 = cnv.jsonDecode(response.body);

//   //   setState(() {
//   //     userData1 = data1["result"];
//   //   });
//   //   return ARes.fromJson(data1);
//   // }

//   @override
//   void initState() {
//     dynamic id = Get.arguments;
//     log(id['restaurants_id'].toString());
//     super.initState();
//     getData(id['restaurants_id'], id['foods_id']);
//     // photo(id['foods_id']);
//   }

//   @override
//   Widget build(BuildContext context) {
//     //dynamic user = ModalRoute.of(context)!.settings.arguments;
//     return Scaffold(
//       appBar: AppBar(
//         title: new Center(
//             child: Text(
//           ' Захиалсан хүмүүс',
//           textAlign: TextAlign.end,
//         )),
//         backgroundColor: Colors.green,
//       ),
//       body: ListView.builder(

//           itemCount: userData == null ? 0 : userData.length,
//           itemBuilder: (BuildContext context, int index) {
//             Container(
//               child: Image(image: NetworkImage(userData1[0]["photo"]),width: 200 ,height: 200,),
//             );
//             return GestureDetector(
//                 child: Card(
//               elevation: 7.0,
//               margin: EdgeInsets.all(13),
//               shadowColor: Colors.greenAccent,
//               color: Colors.white,
//               shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(20)),
//               child: ListTile(
//                   title: Text("${userData[index]["name"]} "),
//                   trailing: Text(
//                       "Захиалсан  тоо: ${userData[index]["count(oi.user_id)"]}"
//                           .toString())),
//             ));
//           }

//           ),
//     );
//   }
// }

class AdminPeople extends StatefulWidget {
  static const routeName = "/people";

  final heroTag = [];
  final foodName = [];
  final foodPrice = [];

  //AdminPeople({required this.heroTag, required this.foodName, required this.foodPrice})

  @override
  _AdminPeopleState createState() => _AdminPeopleState();
}

class _AdminPeopleState extends State<AdminPeople> {
  Map data = {};
  List userData = [];
  var etoo = 0;

  Future<ARes> getData(int resid, int foodid) async {
    //var url = "http://192.168.0.128:4000/api/v1/users/home/$resid/$foodid";

    var url = "http://192.168.1.144:4000/api/v1/users/home/$resid/$foodid";
    //var url = "http://192.168.1.183:4000/api/v1/users/home/$resid/$foodid";
    final response = await http.get(Uri.parse(url));
    print(response.body);
    data = cnv.jsonDecode(response.body);

    setState(() {
      userData = data["result"];
    });
    return ARes.fromJson(data);
  }

  @override
  void initState() {
    dynamic id = Get.arguments;
    //log(id['restaurants_id'].toString());
    super.initState();
    getData(id['userdata']['restaurants_id'], id['userdata']['foods_id']);
    // photo(id['foods_id']);
  }

  @override
  Widget build(BuildContext context) {
    dynamic dataa = ModalRoute.of(context)!.settings.arguments as Object;
    log(dataa.toString());
    return Scaffold(
      // backgroundColor: Color(0xFF7A9BEE),
      backgroundColor: Colors.green,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(Icons.arrow_back),
          color: Colors.white,
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,

        title: Text(dataa['userdata']['name'],
            style: TextStyle(
                fontFamily: 'Montserrat', fontSize: 18.0, color: Colors.white)),
        centerTitle: true,
        // actions: <Widget> [
        //   IconButton(onPressed: onPressed, icon: icon)
        // ],
      ),
      body: ListView(
        children: [
          Stack(
            children: [
              Container(
                height: MediaQuery.of(context).size.height - 82.0,
                width: MediaQuery.of(context).size.width,
                color: Colors.green,
              ),
              Positioned(
                  top: 75.0,
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(45.0),
                          topRight: Radius.circular(45.0),
                        ),
                        color: Colors.white),
                    height: MediaQuery.of(context).size.height - 100.0,
                    width: MediaQuery.of(context).size.width,
                  )),
              Positioned(
                top: 30.0,
                left: (MediaQuery.of(context).size.width / 2) - 100.0,
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(dataa['userdata']['photo']),
                        fit: BoxFit.cover),
                  ),
                  height: 200.0,
                  width: 200.0,
                ),
              ),
              Positioned(
                top: 250.0,
                left: 25.0,
                right: 25.0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      dataa['userdata']['name'],
                      style: TextStyle(
                          fontFamily: "Montserrat",
                          fontSize: 22.0,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 20.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        //if(etoo==0){}

                        Text('${dataa['userdata']['une']} ₮',
                            style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontSize: 20.0,
                                color: Colors.grey)),

                        Container(height: 25.0, color: Colors.grey, width: 1.0),
                        Container(
                          width: 125.0,
                          height: 40.0,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(17.0),
                              // color: Color(0xFF7A9BEE)),
                              color: Colors.green),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              etoo != 0
                                  ? InkWell(
                                      onTap: () {
                                        setState(() {
                                          hasah(
                                              dataa['data'],
                                              dataa['userdata']
                                                  ['restaurants_id'],
                                              dataa['userdata']['foods_id']);
                                          etoo--;
                                        });
                                      },
                                      child: Container(
                                        height: 25.0,
                                        width: 25.0,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(7.0),
                                          // color: Colors.white,
                                        ),
                                        child: Center(
                                          child: Icon(
                                            Icons.remove,
                                            color: Colors.white,
                                            size: 20.0,
                                          ),
                                        ),
                                      ),
                                    )
                                  : new Container(),
                              Text(
                                etoo.toString(),
                                style: TextStyle(
                                    fontSize: 15.0,
                                    fontFamily: 'Montserrat',
                                    color: Colors.white),
                              ),
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    etoo++;
                                    order(
                                        dataa['data'],
                                        dataa['userdata']['restaurants_id'],
                                        dataa['userdata']['foods_id']);
                                  });
                                },
                                child: Container(
                                  height: 25.0,
                                  width: 25.0,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(7.0),
                                    color: Colors.white,
                                  ),
                                  child: Center(
                                    child: Icon(
                                      Icons.add,
                                      color: Colors.green,
                                      size: 20.0,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    //userData!=null ?
                    Container(
                      height: 350.0,
                      child: ListView.builder(
                          itemCount: userData == null ? 0 : userData.length,
                          itemBuilder: (BuildContext context, int index) {
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
                    )
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

order(
  int user_id,
  int res_id,
  int food_id,
) async {
  // var url = "http://192.168.0.128:4000/api/v1/$user_id/home/$res_id/$food_id";
  var url = "http://192.168.0.128:4000/api/v1/$user_id/home/$res_id/$food_id";
  //var url = "http://192.168.1.183:4000/api/v1/$user_id/home/$res_id/$food_id";
  final response = await http.post(
    Uri.parse(url),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
  );
  print('login response: ${response.statusCode}');
  print('login response: ${response.body}');
}

hasah(
  int user_id,
  int res_id,
  int food_id,
) async {
  //var url = "http://192.168.0.128:4000/api/v1/$user_id/home/$res_id/$food_id/hasah";
  var url =
      "http://192.168.0.128:4000/api/v1/$user_id/home/$res_id/$food_id/hasah";
  // var url =
  //     "http://192.168.1.183:4000/api/v1/$user_id/home/$res_id/$food_id/hasah";
  final response = await http.post(
    Uri.parse(url),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
  );
  print('login response: ${response.statusCode}');
  print('login response: ${response.body}');
}
