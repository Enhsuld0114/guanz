class food {
  String name = " ";
  int Ztoo = 0;

  food({required this.name, required this.Ztoo});
  factory food.fromJson(final json) {
    return food(name: json["name"], Ztoo: json["count(user_id)"]);
  }
}
