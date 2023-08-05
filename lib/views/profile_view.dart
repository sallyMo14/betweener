import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:tt9_betweener_challenge/constants.dart';
import 'package:tt9_betweener_challenge/controllers/user_controller.dart';
import 'package:tt9_betweener_challenge/models/link.dart';
import 'package:tt9_betweener_challenge/models/user.dart';
import 'package:tt9_betweener_challenge/views/edit_link_view.dart';
import 'package:tt9_betweener_challenge/widgets/LinkCard.dart';

import '../controllers/link_controller.dart';
import '../widgets/MyCard.dart';
import 'add_link_view.dart';

class ProfileView extends StatefulWidget {
  static String id = '/profileView';

  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  late Future<User> user;
  late Future<List<Link>> links;
  updateUI() {
    setState(() {
      user = getLocalUser();
      links = getLinks(context);
    });
  }

////////////////////////////////////////////////////////////هنا
  @override
  void initState() {
    updateUI();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            MyCard(user: user),
            FutureBuilder(
              future: links,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      child: ListView.builder(
                          itemCount: snapshot.data!.length,
                          itemBuilder: (context, index) {
                            return Slidable(
                              startActionPane: ActionPane(
                                motion: StretchMotion(),
                                children: [
                                  SlidableAction(
                                    onPressed: (context) async {
                                      bool refresh = await Navigator.push(
                                          context,
                                          MaterialPageRoute(builder: (context) {
                                        return EditLinkView(
                                            link: snapshot.data![index]);
                                      }));
                                      if (refresh) {
                                        links = getLinks(context);
                                        setState(() {});
                                      }
                                    },
                                    icon: Icons.edit,
                                  ),
                                  SlidableAction(
                                    onPressed: (context) {
                                      print("one");

                                      deleteLink(snapshot.data![index].id!);
                                      print(snapshot.data![index].id!);

                                      setState(() {
                                        links = getLinks(context);
                                      });
                                    },
                                    icon: Icons.delete,
                                  ),
                                ],
                              ),
                              child: LinkCard(
                                titleStyle: index % 2 == 0
                                    ? kTitleStyle.copyWith(
                                        color: Color(0xffA1727A))
                                    : kTitleStyle.copyWith(
                                        color: Color(0xff2D2B4E)),
                                linkStyle: index % 2 == 0
                                    ? kLinkStyle.copyWith(
                                        color: Color(0xffA1727A))
                                    : kLinkStyle.copyWith(
                                        color: Color(0xff2D2B4E)),
                                color: index % 2 == 0
                                    ? Color(0xffFBDFE4)
                                    : Color(0xffE7E5F1),
                                link: snapshot.data![index],
                              ),
                            );
                          }),
                    ),
                  );
                } else {
                  return CircularProgressIndicator();
                }
              },
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
                width: 60,
                height: 60,
                decoration:
                    BoxDecoration(shape: BoxShape.circle, color: kPrimaryColor),
                child: Icon(
                  Icons.add,
                  color: Colors.white,
                  size: 48,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
