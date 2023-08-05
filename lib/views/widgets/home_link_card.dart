import 'package:flutter/cupertino.dart';
import 'package:tt9_betweener_challenge/models/link.dart';

class homeLinkCard extends StatelessWidget {
  const homeLinkCard({
    super.key,
    required this.link,
  });

  final Link? link;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print("Navigate to ${link!.link}");
      },
      child: Container(
        // width: 150,
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 16),
        decoration: BoxDecoration(
            color: Color(0xffFEE5A5), borderRadius: BorderRadius.circular(15)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              '${link!.title}',
              // // style: kTitleStyle,
              style: TextStyle(
                  fontSize: 14,
                  letterSpacing: 0,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff784E00)),
            ),
            Text(
              '@${link!.username}',
              style: TextStyle(color: Color(0xff784E00)),
            ),
          ],
        ),
      ),
    );
  }
}
