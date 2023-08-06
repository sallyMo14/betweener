import 'package:flutter/material.dart';
import 'package:tt9_betweener_challenge/controllers/link_controller.dart';
import 'package:tt9_betweener_challenge/models/link.dart';
import 'package:tt9_betweener_challenge/models/user.dart';

import '../constants.dart';
import 'widgets/LinkCard.dart';

class FreindProfile extends StatefulWidget {
  final User user;

  const FreindProfile({super.key, required this.user});

  @override
  State<FreindProfile> createState() => _FreindProfileState();
}

class _FreindProfileState extends State<FreindProfile> {
  late User user;
  late Future<List<Link>> links;

  updateUi() {
    setState(() {
      user = widget.user;
      links = getUserLinks(context, user);
    });
  }

  @override
  void initState() {
    updateUi();
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
            Container(
              decoration: BoxDecoration(
                  color: kPrimaryColor,
                  borderRadius: BorderRadius.circular(15)),
              width: double.infinity,
              alignment: Alignment.center,
              child: Stack(alignment: Alignment.topRight, children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 36, vertical: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CircleAvatar(
                        radius: 56,
                        backgroundImage: NetworkImage(
                          "https://www.southernliving.com/thmb/t4CDcQzE1dJvfCt2VTHt3yRoCNc=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/valentine-bouquet-gettyimages-55949391-2000-d675e30abd0243f1bf1d13ecb212d45b.jpg",
////////////////////////////////////////////////////hgw,,,,vmالصوورة
                        ),
                        backgroundColor: Colors.blue,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Text(widget.user.,style: kUserInfoStyle,),
                          ListView.builder(
                            itemBuilder: (context, snapshot) {
                              if (user != null) {
                                return Text('${user?.user!.name!}',
                                    style: kUserInfoStyle);
                              }
                              return Text('loading');
                            },
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          ListView.builder(
                            itemBuilder: (context, snapshot) {
                              if (user != null) {
                                return Text('${user?.user!.email!}',
                                    style: kUserInfoStyle);
                              }
                              return Text('loading');
                            },
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          ListView.builder(
                            itemBuilder: (context, snapshot) {
                              if (user != null) {
                                return Text('${user?.user!.id!}',
                                    style: kUserInfoStyle);
                              }
                              return Text('loading');
                            },
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                padding: EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.yellow,
                                ),
                                child: Text(
                                  "Followers",
                                  style: TextStyle(fontSize: 10),
                                ),
                              ),
                              SizedBox(
                                width: 8,
                              ),
                              Container(
                                padding: EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.yellow,
                                ),
                                child: Text(
                                  "Following",
                                  style: TextStyle(fontSize: 10),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.edit,
                  ),
                  color: Colors.white,
                ),
              ]),
            ),
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
                            return LinkCard(
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
                            );
                          }),
                    ),
                  );
                } else {
                  return CircularProgressIndicator();
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
