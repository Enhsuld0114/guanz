class ARes {
  String token = " ";
  // int Ztoo = 0;
  // int id = 0;

  ARes({required this.token});
  factory ARes.fromJson(final json) {
    return ARes(
        token: json["token"]);
        // Ztoo: json["count(user_id)"],
        // id: json["restaurant_id"]);
  }
}

