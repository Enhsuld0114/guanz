class ARes {
  String name = " ";
  int Ztoo = 0;
  int id = 0;

  ARes({required this.name, required this.Ztoo, required this.id});

//   ARes.fromJson(Map<String, dynamic> json) {
//     name = json['name'];
//     Ztoo = json['Ztoo'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['name'] = this.name;
//     data['Ztoo'] = this.Ztoo;

//     return data;
//   }
  factory ARes.fromJson(final json) {
    return ARes(
        name: json["name"],
        Ztoo: json["count(user_id)"],
        id: json["restaurant_id"]);
  }
}

// class ARes {
//   final String name = " ";
//   final int Ztoo = 0;
//   ARes({ required this.name,required this.Ztoo});
// }
