import 'dart:convert' as cnv;
import 'dart:developer';

import 'package:flutter/material.dart';

import '../Retaurant/data_ActiveRes.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import '../food/adminfood.dart';

class MyRes extends StatefulWidget {
  static const routeName = "/NonRes";
  @override
  _MyResState createState() => _MyResState();
}

class _MyResState extends State<MyRes> {
  Map data = {};
  List userData = [];
  Future<ARes> getData() async {
    // var url = "http://192.168.1.183:4000/api/v1/users/restaurants";
    var url = "http://192.168.1.144:4000/api/v1/users/restaurants";

    final response = await http.get(Uri.parse(url));

    data = cnv.jsonDecode(response.body);

    setState(() {
      userData = data["data"];
      print(userData);
    });
    return ARes.fromJson(data);
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    dynamic user = ModalRoute.of(context)!.settings.arguments;
    //log(user.toString());
    final ButtonStyle style =
        ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20));

    return Scaffold(
      appBar: AppBar(
        title: new Center(
            child: Text(
          'захиалгагүй ресторанууд',
          textAlign: TextAlign.end,
        )),
        backgroundColor: Colors.green,
      ),
      body: ListView.builder(
          itemCount: userData == null ? 0 : userData.length,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
                onTap: () {
                  showDialog<void>(
                    barrierColor: Colors.black45,
                    context: context,
                    barrierDismissible: false, // user must tap button!
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text('Alert'),
                        content: SingleChildScrollView(
                          child: ListBody(
                            children: const <Widget>[
                              Text('Та захиалга үүсгэхэд бэлэн үү'),
                            ],
                          ),
                        ),
                        actions: <Widget>[
                          TextButton(
                            child: const Text('Үгүй'),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                          TextButton(
                            child: const Text('Тийм'),
                            onPressed: () {
                              order(userData[index]['restaurants_id']);
                              // print(userData[index]['restaurants_id']);
                              update(userData[index]['restaurants_id'], user);
                              Navigator.of(context).pushNamed(
                                AdminFood.routeName,
                                arguments: {
                                  "userData": userData[index],
                                  "user": user
                                },
                              );
                            },
                          ),
                        ],
                      );
                    },
                  );
                },
                child: Card(
                  elevation: 7.0,
                  margin: EdgeInsets.all(13),
                  shadowColor: Colors.greenAccent,
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  child: ListTile(
                    title: Text("${userData[index]["name"]} "),
                    //  title: Container(
                    //       margin: const EdgeInsets.fromLTRB(0, 0, 110, 0),
                    //       child: Image.network(
                    //         "${userData[index]["photo"]} ",
                    //         width: 40,
                    //         height: 40,
                    //       ),
                    //     ),

                    //     //  Text("${userData[index]["name"]} "),

                    //     trailing: Container(
                    //       margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                    //       child: Column(
                    //         children: [
                    //           Text("${userData[index]["name"]} "),

                    //         ],
                    //       ),
                    //     )
                  ),
                ));
          }),
    );
  }
}

order(
  int res_id,
) async {
  // var url = "http://192.168.1.183:4000/api/v1/users/restaurants/$res_id";
  var url = "http://192.168.1.144:4000/api/v1/users/restaurants/$res_id";

  final response = await http.post(
    Uri.parse(url),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
  );
  print('login response: ${response.statusCode}');
  print('login response: ${response.body}');
}

update(int res_id, int userid) async {
  // var url =
  //    "http://192.168.1.183:4000/api/v1/users/$userid/restaurants/$res_id/update";
  var url =
      "http://192.168.1.144:4000/api/v1/users/$userid/restaurants/$res_id/update";

  final response = await http.post(
    Uri.parse(url),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
  );
  print('login response: ${response.statusCode}');
  print('login response: ${response.body}');
}
