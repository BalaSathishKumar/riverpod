// To parse this JSON data, do
//
//     final userResponseModel = userResponseModelFromJson(jsonString);

import 'dart:convert';

List<userResonseModel> userResponseModelFromJson(String str) => List<userResonseModel>.from(json.decode(str).map((x) => userResonseModel.fromJson(x)));

String userResponseModelToJson(List<userResonseModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class  userResonseModel {
  dynamic id;
  String name;
  String reponame;
  String description;
  String stars;

  userResonseModel({
    required this.id,
    required this.name,
    required this.reponame,
    required this.description,
    required this.stars,
  });


  factory userResonseModel.fromSqfliteDatabase(Map<String, dynamic> map) => userResonseModel(
    id: map['id'] ?? null,
    name: map['name'] ?? '',
    reponame: map['full_name'] ?? '',
    description: map['description'] ?? '',
    stars: map['score'] ?? '',
  );



  factory userResonseModel.fromJson(Map<String, dynamic> json) => userResonseModel(
    id: json["_id"],
    name: json["name"],
    reponame: json["full_name"],
    description: json["description"],
    stars: json["score"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "name": name,
    "full_name": reponame,
    "description": description,
    "score": stars,
  };
}
