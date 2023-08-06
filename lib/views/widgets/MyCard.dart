import 'package:flutter/material.dart';
import 'package:tt9_betweener_challenge/views/follow_view.dart';

import '../../constants.dart';
import '../../models/follow.dart';
import '../../models/user.dart';

class MyCard extends StatefulWidget {
  final Future<User> user;
  final Future<Follow> followingData;
  const MyCard({super.key, required this.user, required this.followingData});

  @override
  State<MyCard> createState() => _MyCardState();
}

class _MyCardState extends State<MyCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: kPrimaryColor, borderRadius: BorderRadius.circular(15)),
      width: double.infinity,
      alignment: Alignment.center,
      child: Stack(alignment: Alignment.topRight, children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 36, vertical: 16),
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
                  FutureBuilder(
                    future: widget.user,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return Text('${snapshot.data?.user?.name}',
                            style: kUserInfoStyle);
                      }
                      return Text('loading');
                    },
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  FutureBuilder(
                    future: widget.user,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return Text('${snapshot.data?.user?.email}',
                            style: kUserInfoStyle);
                      }
                      return Text('loading');
                    },
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  FutureBuilder(
                    future: widget.user,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return Text('${snapshot.data?.user?.id}',
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
                      GestureDetector(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return FollowView(data: widget.followingData);
                          }));
                        },
                        child: Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.yellow,
                          ),
                          child: FutureBuilder(
                            future: widget.followingData,
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                return Text(
                                    'Follwers ${snapshot.data?.followersCount}',
                                    style: TextStyle(fontSize: 10));
                              }
                              return Text('loading');
                            },
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.yellow,
                        ),
                        child: FutureBuilder(
                          future: widget.followingData,
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              return Text(
                                  'Follweing ${snapshot.data?.followingCount}',
                                  style: TextStyle(fontSize: 10));
                            }
                            return Text('loading');
                          },
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
    );
  }

  fun() {}
}
