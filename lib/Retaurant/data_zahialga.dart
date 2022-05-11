class food {
  String name = " ";
  int resid = 0;
  int uid = 0;

  food({required this.name, required this.resid, required this.uid});
  factory food.fromJson(final json) {
    return food(
        name: json["name"], resid: json["restaurant_id"], uid: json["use_id"]);
  }
}
