import 'package:flutter/material.dart';
import 'package:tt9_betweener_challenge/controllers/link_controller.dart';
import 'package:tt9_betweener_challenge/controllers/user_controller.dart';
import 'package:tt9_betweener_challenge/views/widgets/home_link_card.dart';

import '../models/link.dart';
import '../models/user.dart';
import 'add_link_view.dart';

class HomeView extends StatefulWidget {
  static String id = '/homeView';
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late Future<User> user;
  late Future<List<Link>> links;

  @override
  void initState() {
    user = getLocalUser();
    links = getLinks(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          FutureBuilder(
            future: user,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Text(
                  'Hello , ${snapshot.data?.user?.name}!',
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                );
              }
              return Text('loading');
            },
          ),
          Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(),
            child: Image.network(
              "https://upload.wikimedia.org/wikipedia/commons/thumb/d/d0/QR_code_for_mobile_English_Wikipedia.svg/330px-QR_code_for_mobile_English_Wikipedia.svg.png",
              fit: BoxFit.fill,
            ),
          ),
          Divider(
            thickness: 4,
            color: Colors.black,
          ),
          FutureBuilder(
            future: links,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return SizedBox(
                  height: 80,
                  child: ListView.separated(
                      // padding:
                      //     EdgeInsets.symmetric(horizontal: 30, vertical: 18),
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        final link = snapshot.data?[index];
                        if (index == snapshot.data!.length - 1) {
                          return Row(
                            children: [
                              homeLinkCard(link: link),
                              SizedBox(
                                width: 8,
                              ),
                              GestureDetector(
                                onTap: () async {
                                  bool refresh = await Navigator.push(context,
                                      MaterialPageRoute(builder: (context) {
                                    return AddLinkView();
                                  }));
                                  if (refresh) {
                                    links = getLinks(context);
                                    setState(() {});
                                  }
                                },
                                child: Container(
                                  // width: 150,
                                  padding: EdgeInsets.symmetric(
                                      vertical: 20, horizontal: 20),
                                  decoration: BoxDecoration(
                                      color: Color(0xffE7E5F1),
                                      borderRadius: BorderRadius.circular(15)),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Icon(Icons.add),
                                      Flexible(
                                        child: Text(
                                          "Add Link",
                                          style: TextStyle(fontSize: 14),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 8,
                              )
                            ],
                          );
                        }
                        return homeLinkCard(link: link);
                      },
                      separatorBuilder: (context, index) {
                        return SizedBox(
                          width: 8,
                        );
                      },
                      itemCount: snapshot.data!.length),
                );
              }
              if (snapshot.hasError) {
                return Text(snapshot.error.toString());
              }
              return Text('loading');
            },
          ),
        ],
      ),
    );
  }
}
