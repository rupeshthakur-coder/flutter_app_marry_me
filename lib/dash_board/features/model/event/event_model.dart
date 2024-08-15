class EventModel {
  FoodFasting? foodFasting;

  EventModel({this.foodFasting});

  factory EventModel.fromJson(Map<String, dynamic> json) => EventModel(
        foodFasting: json["FoodFasting"] == null ? null : FoodFasting.fromJson(json["FoodFasting"]),
      );

  Map<String, dynamic> toJson() => {
        "FoodFasting": foodFasting?.toJson(),
      };
}

class FoodFasting {
  Map<String, F1>? f1;

  FoodFasting({this.f1});

  factory FoodFasting.fromJson(Map<String, dynamic> json) => FoodFasting(
        f1: json.map((key, value) => MapEntry(key, F1.fromJson(value))),
      );

  Map<String, dynamic> toJson() => f1 != null ? f1!.map((key, value) => MapEntry(key, value.toJson())) : {};
}

class F1 {
  String? date;
  String? time;
  String? title;
  String? venue;

  F1({
    this.date,
    this.time,
    this.title,
    this.venue,
  });

  factory F1.fromJson(Map<String, dynamic> json) => F1(
        date: json["date"] as String?,
        time: json["time"] as String?,
        title: json["title"] as String?,
        venue: json["venue"] as String?,
      );

  Map<String, dynamic> toJson() => {
        "date": date,
        "time": time,
        "title": title,
        "venue": venue,
      };
}
