import 'package:flutter/material.dart';

import '../constants.dart';
import '../models/user.dart';

class MyCard extends StatefulWidget {
  final Future<User> user;
  const MyCard({super.key, required this.user});

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
                backgroundColor: Colors.blue,
                child: Image.network(
                  "https://www.southernliving.com/thmb/t4CDcQzE1dJvfCt2VTHt3yRoCNc=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/valentine-bouquet-gettyimages-55949391-2000-d675e30abd0243f1bf1d13ecb212d45b.jpg",
////////////////////////////////////////////////////hgw,,,,vmالصوورة
                  fit: BoxFit.cover,
                ),
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
    );
  }
}
