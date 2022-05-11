import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:odriintsai/Retaurant/list.dart';
import '../orderPeople/adminPeople.dart';
import '../screens/zogsooh.dart';
import '../ZahialgaZogsooh/people.dart';
import '../food/data_food.dart';
import 'dart:convert' as cnv;
import 'package:http/http.dart' as http;

class Zogsooh extends StatefulWidget {
  static const routeName = "/zogsooh";
  @override
  _ZogsoohState createState() => _ZogsoohState();
}

class _ZogsoohState extends State<Zogsooh> {
  Map data = {};
  List userData = [];
  Future<food> getData(int id) async {
    // var url = "http://192.168.0.128:4000/api/v1/users/home/$id";
    //var url = "http://172.16.16.135:4000/api/v1/users/home/$id";
    var url = "http://192.168.0.128:4000/api/v1/users/home/$id";
    final response = await http.get(Uri.parse(url));
    log("logger " + response.body);
    data = cnv.jsonDecode(response.body);

    setState(() {
      userData = data["result"];
    });

    return food.fromJson(data);
  }

  @override
  void initState() {
    dynamic id = Get.arguments;
    log(id["restaurants_id"].toString());

    // dynamic id = ModalRoute.of(context)!.settings.arguments as Object;
    // log(id.toString());

    //log (data['result'][0]['restaurant_id'].toString());
    super.initState();
    getData(id["restaurants_id"]);
    //order(1,id['data']['users_id']);
  }

  @override
  Widget build(BuildContext context) {
    //log(id['result']['restaurant_id']);

    return Scaffold(
      appBar: AppBar(
        title: new Center(
            child: Text(
          'захиалга',
          textAlign: TextAlign.end,
        )),
        backgroundColor: Colors.green,
      ),
      body: ListView.builder(
          itemCount: userData == null ? 0 : userData.length,
          itemBuilder: (BuildContext context, int index) {
            return ListItem(
              item: userData[index],
            );
          }),
    );
  }
}

class ListItem extends StatefulWidget {
  dynamic item;
  ListItem({this.item});
  //ListItem();

  @override
  _ListItemState createState() => _ListItemState();
}

class _ListItemState extends State<ListItem> {
  int ntoo = 5;
  var eltoo = 0;

  @override
  Widget build(BuildContext context) {
    dynamic userid = ModalRoute.of(context)!.settings.arguments as Object;
    // dynamic userid = Get.arguments as Object;
    // log(userid['data']['users_id'].runtimeType.toString());
    log(userid.toString());

    return GestureDetector(
        // key: Key(widget.item),
        child: Card(
      elevation: 7.0,
      margin: EdgeInsets.all(13),
      shadowColor: Colors.greenAccent,
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: ListTile(
        title: Text(widget.item["name"]),
        subtitle: Text(
            "Захиалсан хүний тоо: ${widget.item["count(user_id)"]}".toString()),
        onTap: () {
          // Navigator.of(context)
          //     .push(MaterialPageRoute(builder: (BuildContext context) {
          //   // return NoteList();
          //   return (AdminPeople());
          // }));
          Navigator.of(context)
              .pushNamed(People.routeName, arguments: widget.item);
        },
        // trailing: Row(mainAxisSize: MainAxisSize.min, children: [
        //   eltoo != 0
        //       ? new IconButton(
        //           icon: Icon(
        //             Icons.do_disturb_on_outlined,
        //             color: Colors.green,
        //           ),
        //           onPressed: () {
        //             setState(() {
        //                hasah(userid['data'][0]['users_id'],widget.item["restaurants_id"] , widget.item["foods_id"]);
        //               eltoo--;

        //             });
        //           },
        //         )
        //       : new Container(),
        //   Title(color: Colors.green, child: Text('$eltoo')),
        //   IconButton(
        //     icon: Icon(
        //       Icons.control_point_rounded,
        //       color: Colors.green,
        //     ),
        //     onPressed: () {
        //       setState(() {
        //         eltoo++;
        //         //order(1,1,widget.item["foods_id"]);

        //         // order(
        //         //     userid['data']['users_id'],
        //         //     widget.item["restaurants_id"],
        //         //     widget.item["foods_id"]);

        //          order(userid['data'][0]['users_id'],widget.item["restaurants_id"] , widget.item["foods_id"]);
        //       });
        //     },
        //   ),
        // ]),
      ),
    ));
  }
}


// order(
//   int user_id,
//   int res_id,
//   int food_id,
// ) async {

//   var url = "http://192.168.0.161:4000/api/v1/$user_id/home/$res_id/$food_id";
//   final response = await http.post(
//     Uri.parse(url),
//     headers: <String, String>{
//       'Content-Type': 'application/json; charset=UTF-8',
//     },

//   );
//   print('login response: ${response.statusCode}');
//   print('login response: ${response.body}');
// }


// hasah(
//   int user_id,
//   int res_id,
//   int food_id,
// ) async {

//   var url = "http://192.168.0.161:4000/api/v1/$user_id/home/$res_id/$food_id/hasah";
//   final response = await http.post(
//     Uri.parse(url),
//     headers: <String, String>{
//       'Content-Type': 'application/json; charset=UTF-8',
//     },

//   );
//   print('login response: ${response.statusCode}');
//   print('login response: ${response.body}');
// }

