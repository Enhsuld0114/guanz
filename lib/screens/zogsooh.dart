import 'package:flutter/material.dart';

class zogsooh extends StatefulWidget {
  @override
  _zogsoohState createState() => _zogsoohState();
}

class _zogsoohState extends State<zogsooh> {
  List todos = [];
  String input = "";

  void createTodos() {}

  @override
  void initState() {
    super.initState();
    todos.add("food1");
    todos.add("food2");
    todos.add("food3");
    todos.add("food4");
    todos.add("food1");
    todos.add("food2");
    todos.add("food3");
    todos.add("food4");
    todos.add("food1");
    todos.add("food2");
    todos.add("food3");
    todos.add("food4");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: new Center(
            child: Text(
          'Restaurants',
          textAlign: TextAlign.end,
        )),
        backgroundColor: Colors.green,
      ),
      body: ListView.builder(
          itemCount: todos.length,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
                key: Key(todos[index]),
                onTap: () {},
                child: Card(
                  elevation: 7.0,
                  margin: EdgeInsets.all(13),
                  shadowColor: Colors.greenAccent,
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  child: ListTile(
                    title: Text(todos[index]),
                  ),
                ));
          }),
    );
  }
}
