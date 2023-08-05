import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tt9_betweener_challenge/constants.dart';
import 'package:tt9_betweener_challenge/models/user.dart';
import 'package:tt9_betweener_challenge/views/login_view.dart';
import 'package:tt9_betweener_challenge/views/profile_view.dart';

import '../models/link.dart';

Future<List<Link>> getLinks(context) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();

  User user = userFromJson(prefs.getString('user')!);

  final response = await http.get(Uri.parse(linksUrl),
      headers: {'Authorization': 'Bearer ${user.token}'});

  // print(jsonDecode(response.body)['links']);

  if (response.statusCode == 200) {
    final data = jsonDecode(response.body)['links'] as List<dynamic>;

    return data.map((e) => Link.fromJson(e)).toList();
  }

  if (response.statusCode == 401) {
    Navigator.pushReplacementNamed(context, LoginView.id);
  }

  return Future.error('Somthing wrong');
}

Future<bool> addLink(context, Map<String, dynamic> body) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();

  User user = userFromJson(prefs.getString('user')!);

  final response = await http.post(
    Uri.parse(linksUrl),
    headers: {'Authorization': 'Bearer ${user.token}'},
    body: body,
  );

  if (response.statusCode == 200) {
    return true;
  }

  if (response.statusCode == 401) {
    Navigator.pushReplacementNamed(context, ProfileView.id);
  }

  return Future.error('Somthing wrong');
}

Future<bool> editLink(context, Map<String, dynamic> body, int id) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();

  User user = userFromJson(prefs.getString('user')!);

  final response = await http.put(
    Uri.parse("${editLinkUrl}$id"),
    headers: {'Authorization': 'Bearer ${user.token}'},
    body: body,
  );
  print(response.body);
  if (response.statusCode == 200) {
    return true;
  }

  if (response.statusCode == 401) {
    Navigator.pop(context);
  }
  return Future.error('Editting link failed');
}

void deleteLink(int id) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();

  User user = userFromJson(prefs.getString('user')!);

  final response = await http.delete(
    Uri.parse('$linksUrl/$id'),
    headers: {'Authorization': 'Bearer ${user.token}'},
  );

  if (response.statusCode == 200) {
    return;
  }

  return Future.error('Somthing wrong');
}
