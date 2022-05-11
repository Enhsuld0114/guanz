
import 'dart:convert' as cnv;

import 'package:flutter/material.dart';

import '../Retaurant/data_ActiveRes.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import '../food/adminfood.dart';

class Huviinmedeelel extends StatefulWidget {
  @override
  _HuviinmedeelelState createState() => _HuviinmedeelelState();
}

class _HuviinmedeelelState extends State<Huviinmedeelel> {
  // Map data = {};
  // List userData = [];
  // Future<ARes> getData() async {
  //   var url = "http://192.168.0.161:4000/api/v1/users/restaurants";
  //   final response = await http.get(Uri.parse(url));

  //   data = cnv.jsonDecode(response.body);

  //   setState(() {
  //     userData = data["data"];
  //   });
  //   return ARes.fromJson(data);
  // }

  // @override
  // void initState() {
  //   super.initState();
  //   getData();
  // }

  @override
  Widget build(BuildContext context) {
    final ButtonStyle style =
        ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20));

    return Scaffold(
      appBar: AppBar(
        title: new Center(
            child: Text(
          'Hi, Name',
          textAlign: TextAlign.end,
        )),
        backgroundColor: Colors.green,
      ),
      body: ListView.builder(
          //itemCount: userData == null ? 0 : userData.length,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
 
                onTap: () {
                  
                },
                child: Card(
                  elevation: 7.0,
                  margin: EdgeInsets.all(13),
                  shadowColor: Colors.greenAccent,
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  child: ListTile(
                    // title: Text("${userData[index]["name"]} "),
                     title: Text("hhhh"),
                  ),
                ));
          }),
    );
  }
}


// import 'package:flutter/material.dart';

// class Huviinmedeelel extends StatelessWidget {
//   Widget textfield({@required hintText}) {
//     return Material(
//       elevation: 4,
//       shadowColor: Colors.green,
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(10),
//       ),
//       child: TextField(
//         decoration: InputDecoration(
//             hintText: hintText,
//             hintStyle: TextStyle(
//               letterSpacing: 2,
//               color: Colors.black54,
//               fontWeight: FontWeight.bold,
//             ),
//             fillColor: Colors.white30,
//             filled: true,
//             border: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(10.0),
//                 borderSide: BorderSide.none)),
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         elevation: 0.0,
//         backgroundColor: Color(0xff555555),
//         leading: IconButton(
//           icon: Icon(
//             Icons.arrow_back,
//             color: Colors.white,
//           ),
//           onPressed: () {},
//         ),
//       ),
//       body: Stack(
//         alignment: Alignment.center,
//         children: [
//           Column(
//             mainAxisAlignment: MainAxisAlignment.end,
//             children: [
//               Container(
//                 height: 450,
//                 width: double.infinity,
//                 margin: EdgeInsets.symmetric(horizontal: 10),
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                   children: [
//                     textfield(
//                       hintText: 'Username',
//                     ),
//                     textfield(
//                       hintText: 'Email',
//                     ),
//                     textfield(
//                       hintText: 'Password',
//                     ),
//                     textfield(
//                       hintText: 'Confirm password',
//                     ),
//                     Container(
//                       height: 55,
//                       width: double.infinity,
//                       child: RaisedButton(
//                         onPressed: () {},
//                         color: Colors.black54,
//                         child: Center(
//                           child: Text(
//                             "Update",
//                             style: TextStyle(
//                               fontSize: 23,
//                               color: Colors.white,
//                             ),
//                           ),
//                         ),
//                       ),
//                     )
//                   ],
//                 ),
//               )
//             ],
//           ),
//           CustomPaint(
//             child: Container(
//               width: MediaQuery.of(context).size.width,
//               height: MediaQuery.of(context).size.height,
//             ),
//             painter: HeaderCurvedContainer(),
//           ),
//           Column(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               Padding(
//                 padding: EdgeInsets.all(20),
//                 child: Text(
//                   "Profile",
//                   style: TextStyle(
//                     fontSize: 35,
//                     letterSpacing: 1.5,
//                     color: Colors.white,
//                     fontWeight: FontWeight.w600,
//                   ),
//                 ),
//               ),
//               Container(
//                 padding: EdgeInsets.all(10.0),
//                 width: MediaQuery.of(context).size.width / 2,
//                 height: MediaQuery.of(context).size.width / 2,
//                 decoration: BoxDecoration(
//                   border: Border.all(color: Colors.white, width: 5),
//                   shape: BoxShape.circle,
//                   color: Colors.white,
//                   // image: DecorationImage(
//                   //   fit: BoxFit.cover,
//                   //   image: AssetImage('images/profile.png'),
//                   // ),
//                 ),
//               ),
//             ],
//           ),
//           Padding(
//             padding: EdgeInsets.only(bottom: 270, left: 184),
//             child: CircleAvatar(
//               backgroundColor: Colors.black54,
//               child: IconButton(
//                 icon: Icon(
//                   Icons.edit,
//                   color: Colors.white,
//                 ),
//                 onPressed: () {},
//               ),
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }

// class HeaderCurvedContainer extends CustomPainter {
//   @override
//   void paint(Canvas canvas, Size size) {
//     Paint paint = Paint()..color = Color(0xff555555);
//     Path path = Path()
//       ..relativeLineTo(0, 150)
//       ..quadraticBezierTo(size.width / 2, 225, size.width, 150)
//       ..relativeLineTo(0, -150)
//       ..close();
//     canvas.drawPath(path, paint);
//   }

//   @override
//   bool shouldRepaint(CustomPainter oldDelegate) => false;
// }
