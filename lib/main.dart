import 'package:flutter/material.dart';
import 'package:tt9_betweener_challenge/views/add_link_view.dart';
import 'package:tt9_betweener_challenge/views/home_view.dart';
import 'package:tt9_betweener_challenge/views/loading_view.dart';
import 'package:tt9_betweener_challenge/views/login_view.dart';
import 'package:tt9_betweener_challenge/views/main_app_view.dart';
import 'package:tt9_betweener_challenge/views/profile_view.dart';
import 'package:tt9_betweener_challenge/views/receive_view.dart';
import 'package:tt9_betweener_challenge/views/register_view.dart';
import 'package:tt9_betweener_challenge/views/search_view.dart';

import 'constants.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Betweener',
      theme: ThemeData(
          useMaterial3: true,
          colorSchemeSeed: kPrimaryColor,
          appBarTheme: const AppBarTheme(
            titleTextStyle: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: kPrimaryColor,
            ),
          ),
          scaffoldBackgroundColor: kScaffoldColor),
      home: const LoadingView(),
      routes: {
        LoadingView.id: (context) => const LoadingView(),
        // EditLinkView.id: (context) => const EditLinkView(Link),
        AddLinkView.id: (context) => const AddLinkView(),
        LoginView.id: (context) => const LoginView(),
        RegisterView.id: (context) => const RegisterView(),
        HomeView.id: (context) => const HomeView(),
        MainAppView.id: (context) => const MainAppView(),
        ProfileView.id: (context) => const ProfileView(),
        ReceiveView.id: (context) => const ReceiveView(),
        SearchView.id: (context) => const SearchView(),
      },
    );
  }
}

//startActionPane: ActionPane(
//                               motion: StretchMotion(),
//                               children: [
//                                 SlidableAction(
//                                   onPressed: (context){
//
//                                   },
//                                   icon: ,
//                                 ),
//                               ],
//                             ),

// IconButton(
//     // onPressed: () {
//     //   Navigator.push(context, MaterialPageRoute(builder: (context) {
//     //     return EditLinkView(
//     //       link: widget.link,
//     //     );
//     //   }));
//     // },
//     onPressed: widget.updateOnPressed,
//     icon: Icon(Icons.edit)),
// IconButton(
//     onPressed: widget.deleteOnPressed, icon: Icon(Icons.delete)),
