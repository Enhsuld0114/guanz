import 'package:http/http.dart' as http;
import 'dart:convert';


  Future signin( String username,String password) async {
    //192.168.0.161
    var url = "http://192.168.0.128:4000/api/v1/users";
    //SharedPreferences prefs = await SharedPreferences.getInstance();
    Map body = {"username": username, "password": password};
   // var jsonResponse;
    final  response = await http.post(Uri.parse(url), body: body);

       var jsonResponse = json.decode(response.body);
       return jsonResponse;

      // print("Response status: ${res.statusCode}");
      // print("Response status: ${res.body}");
    
    // if (jsonResponse != null) {
    //   setState(() {
    //     _isloading = false;
    //   });
    //   prefs.setString("token", jsonResponse['token']);
    //   Navigator.of(context)
    //       .push(MaterialPageRoute(builder: (BuildContext context) {
    //     return MyApp();
    //   }));
    // } else {
    //   setState(() {
    //     _isloading = false;
    //   });
    //   print("Response status: ${res.body}");
    // }
  }