// To parse this JSON data, do
//
//     final search = searchFromJson(jsonString);

import 'dart:convert';

import 'package:tt9_betweener_challenge/models/user.dart';

Search searchFromJson(String str) => Search.fromJson(json.decode(str));

String searchToJson(Search data) => json.encode(data.toJson());

class Search {
  List<User>? users;

  Search({
    this.users,
  });

  factory Search.fromJson(Map<String, dynamic> json) => Search(
        users: json["user"] == null
            ? []
            : List<User>.from(json["user"]!.map((x) => User.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "user": users == null
            ? []
            : List<dynamic>.from(users!.map((x) => x.toJson())),
      };
}
