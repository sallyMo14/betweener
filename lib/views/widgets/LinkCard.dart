import 'package:flutter/material.dart';
import 'package:tt9_betweener_challenge/models/link.dart';

class LinkCard extends StatefulWidget {
  final Link link;
  final TextStyle titleStyle;
  final TextStyle linkStyle;
  final Color color;
  // final Function()? deleteOnPressed;
  // final Function()? updateOnPressed;
  const LinkCard({
    super.key,
    required this.link,
    // required this.deleteOnPressed,
    // required this.updateOnPressed,
    required this.color,
    required this.titleStyle,
    required this.linkStyle,
  });

  @override
  State<LinkCard> createState() => _LinkCardState();
}

class _LinkCardState extends State<LinkCard> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(top: 18),
      decoration: BoxDecoration(
        color: widget.color,
        borderRadius: BorderRadius.circular(20),
      ),
      // alignment: Alignment.bottomLeft,
      padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "${widget.link.title}",
              style: widget.titleStyle,
            ),
            Text(
              "${widget.link.link}",
              style: widget.linkStyle,
            )
          ]),
    );
  }
}
