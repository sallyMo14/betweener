import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../constants.dart';
import '../models/follow.dart';
import '../models/search.dart';
import '../models/user.dart';
import '../views/profile_view.dart';

Future<Search> searchByName(context, Map<String, dynamic> body) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();

  var user = userFromJson(prefs.getString('user')!);

  final response = await http.post(
    Uri.parse(searchURL),
    headers: {'Authorization': 'Bearer ${user.token}'},
    body: body,
  );

  if (response.statusCode == 200) {
    // final data = jsonDecode(response.body)['user'] as List<dynamic>;
    // print(data);
    //
    // return data.map((e) => User.fromJson(e)).toList();
    final Map<String, dynamic> data = json.decode(response.body);
    return Search.fromJson(data);
  }

  if (response.statusCode == 401) {
    Navigator.pushReplacementNamed(context, ProfileView.id);
  }

  return Future.error('Search Faild');
}

Future<Follow> follow(context) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();

  var user = userFromJson(prefs.getString('user')!);

  final response = await http.get(
    Uri.parse(followURL),
    headers: {'Authorization': 'Bearer ${user.token}'},
  );
  if (response.statusCode == 200) {
    final Map<String, dynamic> data = json.decode(response.body);
    return Follow.fromJson(data);
  }
  if (response.statusCode == 401) {
    Navigator.pushReplacementNamed(context, ProfileView.id);
  }

  return Future.error('get follow Faild');
}

Future<bool> addFollow(context, Map<String, dynamic> body) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();

  var user = userFromJson(prefs.getString('user')!);

  final response = await http.post(
    Uri.parse(followURL),
    headers: {'Authorization': 'Bearer ${user.token}'},
    body: body,
  );
  if (response.statusCode == 200) {
    final Map<String, dynamic> data = json.decode(response.body);
    return true;
  }
  if (response.statusCode == 401) {
    Navigator.pushReplacementNamed(context, ProfileView.id);
  }

  return Future.error('add follow Faild');
}
