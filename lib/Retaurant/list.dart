import 'dart:convert' as cnv;
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:odriintsai/Retaurant/zahialga.dart';
import 'package:odriintsai/ZahialgaZogsooh/zahialga.dart';
import 'package:odriintsai/food/adminfood.dart';
import '../login/login.dart';
import '../dashboard/huviin_medeelel.dart';
import '../dashboard/notifications.dart';
import '../dashboard/zahialga.dart';
import '../Retaurant/restaurant.dart';
import '../food/userfood.dart';
import '../Retaurant/data_ActiveRes.dart';
import 'package:http/http.dart' as http;

class Home extends StatefulWidget {
  static const routeName = "/home";
  // dynamic item;
  // Home({this.item});
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};
  List userData = [];
  Future<ARes> getData() async {
     var url = "http://192.168.1.144:4000/api/v1/users/home";
    //var url = "http://192.168.1.183:4000/api/v1/users/home";

    final response = await http.get(Uri.parse(url));
    data = cnv.jsonDecode(response.body);

    setState(() {
      userData = data["result"];
    });

    //log(data.toString());
    return ARes.fromJson(data);
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    setState(() {});
    dynamic data = ModalRoute.of(context)!.settings.arguments;
    //  log(data.toString());

    final ButtonStyle style =
        ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20));

    return Scaffold(
      appBar: AppBar(
        title: new Center(
            child:
                //     Text(
                //   data[0]["name"],
                //   textAlign: TextAlign.end,
                // )
                Text("Захиалагатай ресторанууд ")),
        backgroundColor: Colors.green,
      ),
      drawer: new Drawer(
        child: new ListView(
          padding: const EdgeInsets.all(0.0),
          children: <Widget>[
            new UserAccountsDrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.green,
                ),
                accountName: new Text(data[0]["name"]),
                accountEmail: new Text(data[0]["email"]),
                currentAccountPicture: new CircleAvatar(
                  backgroundColor: Colors.blue,
                )),
            new ListTile(
                title: new Text('Захиалга'),
                trailing: new Icon(
                  Icons.room_service_rounded,
                  color: Colors.green,
                ),
                onTap: () {
                  Navigator.of(context).pushNamed(
                    Admin.routeName,
                    arguments: data[0]['users_id'],
                  );
                  //print(data[0]['users_id']);
                  log(" sss"+data[0]['users_id'].toString());
                }),
            new ListTile(
              title: new Text('гарах'),
              trailing: new Icon(
                Icons.exit_to_app,
                color: Colors.green,
              ),
              // onTap: () => Navigator.of(context).pop(),
              onTap: () => Navigator.of(context)
                  .push(MaterialPageRoute(builder: (BuildContext context) {
                // return NoteList();
                return MyHomePage();
              })),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed(
            MyRes.routeName,
            arguments: data[0]['users_id'],
          );
          print(data[0]['users_id']);
        },
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
        backgroundColor: Colors.green,
      ),
      body: ListView.builder(
          itemCount: userData == null ? 0 : userData.length,
          itemBuilder: (BuildContext context, int index) {
            // setState(() {

            //   //userData[index]["name"];
            // });
            return GestureDetector(
                // key: Key(model[index]),
                onTap: () {
                  Navigator.of(context)
                      // .pushNamed(UserFood.routeName, arguments: data);
                      .pushNamed(
                    UserFood.routeName,
                    arguments: {"userData": userData[index], "data": data},
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
                    trailing: Text(
                        "Захиалсан хүний тоо: ${userData[index]["count(user_id)"]}"
                            .toString()),
                  ),
                ));
          }),
    );
  }
}

//  ),else{
//             return Container(
//               child: Center(
//                 child: Text("одоогоор захиалагатай ресторан байхгүй байна.")
//                 )
//             );

//           }