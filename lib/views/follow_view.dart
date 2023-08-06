import 'package:flutter/material.dart';

import '../constants.dart';
import '../models/follow.dart';

class FollowView extends StatefulWidget {
  final Future<Follow> data;
  const FollowView({super.key, required this.data});

  @override
  State<FollowView> createState() => _FollowViewState();
}

class _FollowViewState extends State<FollowView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text("FOLLOWERS"),
          FutureBuilder(
              future: widget.data,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Expanded(
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 16),
                      child: ListView.builder(
                        scrollDirection: Axis.vertical,
                        itemBuilder: (context, index) {
                          return Container(
                            width: double.infinity,
                            margin: EdgeInsets.only(top: 18),
                            decoration: BoxDecoration(
                              color: kLinksColor,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            // alignment: Alignment.bottomLeft,
                            padding: EdgeInsets.symmetric(
                                vertical: 16, horizontal: 16),
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "${snapshot.data?.followers![index].name}",
                                    style: kTitleStyle,
                                  ),
                                  Text(
                                    "${snapshot.data?.followers![index].email}",
                                    style: kLinkStyle,
                                  )
                                ]),
                          );
                        },
                      ),
                    ),
                  );
                }
                return Text("Loading");
              })
        ],
      ),
    );
  }
}
