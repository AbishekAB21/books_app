import 'package:books_app/utils/app_theme.dart';
import 'package:books_app/utils/fontstyles.dart';
import 'package:flutter/material.dart';

class AuthorBuilder extends StatelessWidget {
  final String authorName;
  final String description;

  const AuthorBuilder({super.key, required this.authorName, required this.description});

  @override
  Widget build(BuildContext context) {
    String firstLetter = authorName[0];
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: appcolor.backgroundColor,
        border: Border.all(color: appcolor.secondaryColor, width: 0.5),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            CircleAvatar(
              backgroundColor: appcolor.primaryColor,
             // backgroundImage: AssetImage("assets/empty-profile-pic.png"),
             child: Text(firstLetter, style: Fontstyles.ButtonText1(context),),
            ),
            SizedBox(
              width: 15,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    authorName,
                    style: Fontstyles.ContentTextStyle(context),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    description,
                    overflow: TextOverflow.ellipsis,
                    style: Fontstyles.ContentTextStyle4(context),
                    maxLines: 2,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
