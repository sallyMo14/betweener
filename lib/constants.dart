import 'package:flutter/material.dart';

// endpoints==================
// const baseUrl = 'http://192.168.88.245:8000/api';
const baseUrl = 'http://www.osamapro.online/api';
const loginUrl = '$baseUrl/login';
const linksUrl = '$baseUrl/links';
const editLinkUrl = '$baseUrl/links/';
const searchURL = '$baseUrl/search';
const followURL = '$baseUrl/follow';
const addFollowURL = '$baseUrl/follow/';
// ============= STYLE CONSTS ==============

const kScaffoldColor = Color(0xffFDFDFD);
const kRedColor = Color(0xffA90606);

const kPrimaryColor = Color(0xff2D2B4E);
const kSecondaryColor = Color(0xffFFD465);
const kOnSecondaryColor = Color(0xff784E00);
const kDangerColor = Color(0xffF56C61);

// Low Opacity Colors
const kLinksColor = Color(0xff807D99);
const kLightPrimaryColor = Color(0xffE7E5F1);
const kLightSecondaryColor = Color(0xffFFE6A6);
const kLightDangerColor = Color(0xffFEE2E7);
const kOnLightDangerColor = Color(0xff783341);

//styles

const kUserInfoStyle = TextStyle(color: Colors.white, fontSize: 18);
const kTitleStyle = TextStyle(
  fontSize: 18,
  letterSpacing: 3,
  fontWeight: FontWeight.bold,
);
const kLinkStyle = TextStyle(
  fontSize: 16,
);
