import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:odriintsai/Retaurant/list.dart';
import '../global.dart';
import '../orderPeople/adminPeople.dart';
import '../ZahialgaZogsooh/zahialga.dart';
import '../login/login.dart';
import '../Retaurant/list.dart';
import '../food/data_food.dart';
import '../Retaurant/zahialga.dart';
import 'dart:convert' as cnv;
import 'package:http/http.dart' as http;

class AdminFood extends StatefulWidget {
  static const routeName = "/admin-food";
  @override
  _AdminFoodState createState() => _AdminFoodState();
}

class _AdminFoodState extends State<AdminFood> {
  Map data = {};
  List userData = [];
  Future<food> getData(int id) async {
    //var url = "http://192.168.1.183:4000/api/v1/users/home/$id";
    var url = "http://192.168.1.144:4000/api/v1/users/home/$id";

    final response = await http.get(Uri.parse(url));
    //log("logger " + response.body);
    data = cnv.jsonDecode(response.body);

    setState(() {
      userData = data["result"];
    });

    return food.fromJson(data);
  }

  @override
  void initState() {
    dynamic id = Get.arguments as Object;
    //log(id["userData"]['restaurants_id'].toString());
    super.initState();
    getData(id["userData"]['restaurants_id']);
  }

  @override
  Widget build(BuildContext context) {
    dynamic resid = ModalRoute.of(context)!.settings.arguments as Object;
    dynamic data = ModalRoute.of(context)!.settings.arguments as Object;
    //log(resid.toString());
    return Scaffold(
      appBar: AppBar(
        title: new Center(
            child: Text(
          'меню',
          //textAlign: TextAlign.end,
        )),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            onPressed: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (BuildContext context) {
                // return NoteList();
                return MyHomePage();
              }));
            },
            icon: Icon(Icons.exit_to_app),
          )
        ],
        backgroundColor: Colors.green,
      ),
      // drawer: new Drawer(
      //   child: new ListView(
      //     padding: const EdgeInsets.all(0.0),
      //     children: <Widget>[
      //       //  new  BoxDecoration(
      //       //     color: Colors.green,
      //       //   ),
      //       new UserAccountsDrawerHeader(
      //         decoration: BoxDecoration(
      //           color: Colors.green,
      //         ),
      //         accountName: new Text(""),
      //         accountEmail: new Text(""),
      //       ),

      //       new ListTile(
      //         title: new Text('гарах'),
      //         trailing: new Icon(
      //           Icons.exit_to_app,
      //           color: Colors.green,
      //         ),
      //         // onTap: () => Navigator.of(context).pop(),
      //         onTap: () => Navigator.of(context)
      //             .push(MaterialPageRoute(builder: (BuildContext context) {
      //           // return NoteList();
      //           return MyHomePage();
      //         }
      //         )),
      //       )
      //     ],
      //   ),
      // ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: SizedBox(
                  height: 44,
                  child: Material(
                    type: MaterialType.transparency,
                    child: InkWell(
                      onTap: () {
                        final result = showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text(
                                    'Та захиалга цуцлахдаа итгэлтэй байна уу?'),
                                content: Text(
                                    'Анхааруулга!!!!! тухайн рестораны бүх захиалга цуцлагдана'),
                                actions: <Widget>[
                                  FlatButton(
                                    child: Text('Үгүй'),
                                    onPressed: () {
                                      Navigator.of(context).pop(false);
                                      //Navigator.of(context).pop(true);
                                    },
                                  ),
                                  FlatButton(
                                    child: Text('Тийм'),
                                    onPressed: () {
                                      status(
                                          resid["userData"]['restaurants_id']);
                                      delete(
                                          resid["userData"]['restaurants_id']);
                                      // Navigator.of(context).push(
                                      //     MaterialPageRoute(
                                      //         builder: (BuildContext context) {
                                      //   // return NoteList();
                                      //   return (Home());
                                      // }));
                                      log(Home.routeName);
                                      Get.back();
                                      Get.back();
                                      Get.back();
                                      Get.back();

                                      // Navigator.of(context).pushNamed("/home");
                                    },
                                  ),
                                ],
                              );
                            });
                        print(result);
                      },
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(Icons.delete_rounded,
                              color: Colors.red, size: 24),
                          Text("Захиалга цуцлах")
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: SizedBox(
                  height: 44,
                  child: Material(
                    type: MaterialType.transparency,
                    child: InkWell(
                      // onTap: () => zogsooh(),
                      onTap: () {
                        status(resid["userData"]['restaurants_id']);
                        //     Navigator.of(context)
                        //     .push(MaterialPageRoute(builder: (BuildContext context) {
                        //     return Zogsooh();
                        //  }));
                        delete(
                                          resid["userData"]['restaurants_id']);
                        Navigator.of(context).pushNamed(Zogsooh.routeName,
                            arguments: resid["userData"]);
                        print(resid["userData"]);
                      },

                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(Icons.stop_rounded,
                              color: Colors.green, size: 24),
                          Text("Захиалга зогсоох")
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ]),
      ),
      body: ListView.builder(
          itemCount: userData == null ? 0 : userData.length,
          itemBuilder: (BuildContext context, int index) {
            // setState(() {
            //   userData[index];
            // });
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
    //log(userid['user'].toString());
    //log(widget.item.toString());
    bool Mycolor = true;
    return GestureDetector(
        // key: Key(widget.item),
        child: Card(
      elevation: 7.0,
      margin: EdgeInsets.all(13),
      shadowColor: Colors.greenAccent,
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: ListTile(
        leading: CircleAvatar(
          radius: 25,
          backgroundImage: NetworkImage(widget.item["photo"]),
        ),
        title: Text(widget.item["name"]),
        subtitle: Text(
            "Захиалсан хүний тоо: ${widget.item["count(user_id)"]}".toString()),
        onTap: () {
          Navigator.of(context).pushNamed(AdminPeople.routeName,
              arguments: {"userdata": widget.item, "data": userid['user']});
          // Navigator.of(context).pushNamed('/people');
          log(widget.item.toString());
        },
        trailing: Row(mainAxisSize: MainAxisSize.min, children: [
          eltoo != 0
              ? new IconButton(
                  icon: Icon(
                    Icons.do_disturb_on_outlined,
                    color: Colors.green,
                  ),
                  onPressed: () {
                    setState(() {
                      hasah(
                          userid['user'],
                          widget.item["restaurants_id"],
                          widget.item["foods_id"]);
                      eltoo--;
                    });
                  },
                )
              : new Container(),
          Title(color: Colors.green, child: Text('$eltoo')),
          darsan
              ? Container()
              : IconButton(
                  icon: Icon(
                    Icons.control_point_rounded,
                    color: Colors.green,
                  ),
                  onPressed: () {
                    setState(() {
                      eltoo++;
                      order(userid['user'], widget.item["restaurants_id"],
                          widget.item["foods_id"]);
                    });
                  },
                ),
        ]),
      ),
    ));
  }
}

order(
  int user_id,
  int res_id,
  int food_id,
) async {
  //var url = "http://192.168.1.183:4000/api/v1/$user_id/home/$res_id/$food_id";
  var url = "http://192.168.1.144:4000/api/v1/$user_id/home/$res_id/$food_id";

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
      "http://192.168.1.144:4000/api/v1/$user_id/home/$res_id/$food_id/hasah";
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

status(
  int res_id,
) async {
  // var url =
  //     "http://192.168.1.183:4000/api/v1/users/restaurants/$res_id/tsutslah";
  var url =
      "http://192.168.1.144:4000/api/v1/users/restaurants/$res_id/tsutslah";

  final response = await http.post(
    Uri.parse(url),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
  );
  print('login response: ${response.statusCode}');
  print('login response: ${response.body}');
}

delete(
  int res_id,
) async {
  //var url = "http://192.168.1.183:4000/api/v1/users/restaurants/$res_id/delete";
  var url = "http://192.168.1.144:4000/api/v1/users/restaurants/$res_id/delete";

  final response = await http.post(
    Uri.parse(url),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
  );
  print('login response: ${response.statusCode}');
  print('login response: ${response.body}');
}
