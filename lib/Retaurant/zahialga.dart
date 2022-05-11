import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:odriintsai/food/adminfood.dart';
import 'package:odriintsai/login/api.dart';
//import 'login/signup.dart';
//import '../humuusHoolniiG1/humuusHoolniiG.dart';
import 'package:get/get.dart';
import '../Retaurant/list.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as cnv;
import '../Retaurant/data_zahialga.dart';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Admin extends StatefulWidget {
  //const Admin({ Key? key }) : super(key: key);
  static const routeName = "/admin";
  @override
  _AdminState createState() => _AdminState();
}

class _AdminState extends State<Admin> {
  Map data = {};
  List userData = [];
  Future<food> getData(int id) async {
    var url = "http://192.168.1.144:4000/api/v1/users/restaurants/$id/select";

    //var url = "http://192.168.1.183:4000/api/v1/users/restaurants/$id/select";
    final response = await http.get(Uri.parse(url));
    //log("logger " + response.body);
    data = cnv.jsonDecode(response.body);
    //log(data.toString());

    setState(() {
      userData = data["result"];
      // print(userData);
      // log(userData.toString());
    });
    log(data.toString());

    return food.fromJson(data);
  }

  @override
  void initState() {
    dynamic id = Get.arguments;
    //log(id.toString());
    super.initState();
    getData(id);
    //order(1,id['data']['users_id']);
  }

  @override
  Widget build(BuildContext context) {
    // return Scaffold(
    //   appBar: AppBar(
    //     title: new Center(
    //         child: Text(
    //       'Таны захиалга өгсөн ресторанууд',
    //       textAlign: TextAlign.end,
    //     )),
    //     backgroundColor: Colors.green,
    //   ),
    //   body: ListView.builder(
    //       itemCount: userData == null ? 0 : userData.length,
    //       itemBuilder: (BuildContext context, int index) {
    //         return ListItem(
    //           item: userData[index],
    //         );
    //       }),
    // );
    setState(() {
       userData = userData;
    });
    dynamic user = ModalRoute.of(context)!.settings.arguments;
    //log(userData[index]);
    final ButtonStyle style =
        ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20));

    return Scaffold(
      appBar: AppBar(
        title: new Center(
            child: Text(
          'Таны захиалга өгсөн ресторанууд',
          textAlign: TextAlign.end,
        )),
        backgroundColor: Colors.green,
      ),
      body: ListView.builder(
        
          itemCount: userData == null ? 0 : userData.length,
          itemBuilder: (BuildContext context, int index) {
            // setState(() {
            //   userData[index]["name"];
            // });
           // print('namr: ${userData[index]["name"]}');
            return GestureDetector(
                onTap: () {
                 // log(userData[index].toString());
                  Navigator.of(context).pushNamed(
                    AdminFood.routeName,
                    arguments: {"userData": userData[index], "user": user},
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
                  ),
                ));
          }),
    );
  }
}

// class ListItem extends StatefulWidget {
//   dynamic item;
//   ListItem({this.item});
//   //ListItem();

//   @override
//   _ListItemState createState() => _ListItemState();
// }

// class _ListItemState extends State<ListItem> {
//   @override
//   Widget build(BuildContext context) {
//     dynamic userid = ModalRoute.of(context)!.settings.arguments as Object;
//     // dynamic userid = Get.arguments as Object;
//     // log(userid['data']['users_id'].runtimeType.toString());
//     log(userid.toString());
//     log(widget.item["restaurant_id"].toString());
//     return GestureDetector(
//         // key: Key(widget.item),
//         child: Card(
//       elevation: 7.0,
//       margin: EdgeInsets.all(13),
//       shadowColor: Colors.greenAccent,
//       color: Colors.white,
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
//       child: ListTile(
//         title: Text(widget.item["name"]),
//         onTap: () {
//           Navigator.of(context).pushNamed(AdminFood.routeName, arguments: {
//             "userData": widget.item["restaurant_id"],
//             "user": userid
//           });
//         },
//       ),
//     ));
//   }
// }
