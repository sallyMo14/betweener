import 'package:flutter/material.dart';
import 'package:tt9_betweener_challenge/models/user.dart';
import 'package:tt9_betweener_challenge/views/home_view.dart';
import 'package:tt9_betweener_challenge/views/profile_view.dart';
import 'package:tt9_betweener_challenge/views/receive_view.dart';
import 'package:tt9_betweener_challenge/views/search_view.dart';
import 'package:tt9_betweener_challenge/views/widgets/custom_floating_nav_bar.dart';

import 'friend_profile.dart';

class MainAppView extends StatefulWidget {
  static String id = '/mainAppView';

  const MainAppView({super.key});

  @override
  State<MainAppView> createState() => _MainAppViewState();
}

class _MainAppViewState extends State<MainAppView> {
  int _currentIndex = 1;

  late List<Widget?> screensList = [
    const ReceiveView(),
    const HomeView(),
    const ProfileView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: false,
          elevation: 0,
          backgroundColor: Colors.transparent,
          actions: _currentIndex == 1
              ? [
                  IconButton(
                    onPressed: () {
                      Navigator.pushNamed(context, SearchView.id);
                    },
                    icon: Icon(
                      Icons.search,
                      size: 28,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return FreindProfile(
                          user: User(
                              user: UserClass(
                                  id: 5, name: "sally", email: "skhdban")),
                        );
                      }));
                    },
                    icon: Icon(
                      Icons.qr_code_scanner_sharp,
                      size: 28,
                    ),
                  ),
                ]
              : []
          // _currentIndex==1 ? [
          //   IconButton(
          //     onPressed: () {},
          //     icon: Icon(Icons.search),
          //   ),
          //   IconButton(
          //     onPressed: () {},
          //     icon: Icon(Icons.qr_code_scanner_sharp),
          //   ),
          // ],: [],
          ),
      body: SafeArea(
        child: screensList[_currentIndex]!,
      ),
      extendBody: true,
      bottomNavigationBar: CustomFloatingNavBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
