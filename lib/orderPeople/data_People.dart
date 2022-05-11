class ARes {
  String name = " ";
  int Ztoo = 0;

  ARes({required this.name, required this.Ztoo});
  factory ARes.fromJson(final json) {
    return ARes(name: json["name"], Ztoo: json["count(oi.user_id)"]);
  }
}
