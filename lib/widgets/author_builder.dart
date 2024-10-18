import 'package:books_app/utils/app_theme.dart';
import 'package:books_app/utils/fontstyles.dart';
import 'package:flutter/material.dart';

class AuthorBuilder extends StatelessWidget {
  final String authorId;
  final String authorName;
  final String description;
  final Function(String) onDelete;

  const AuthorBuilder({
    super.key,
    required this.authorId,
    required this.authorName,
    required this.description,
    required this.onDelete,
  });

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
              child: Text(
                firstLetter,
                style: Fontstyles.ButtonText1(context),
              ),
            ),
            SizedBox(width: 15),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    authorName,
                    style: Fontstyles.ContentTextStyle(context),
                  ),
                  SizedBox(height: 5),
                  Text(
                    description,
                    overflow: TextOverflow.ellipsis,
                    style: Fontstyles.ContentTextStyle4(context),
                    maxLines: 2,
                  ),
                ],
              ),
            ),
            IconButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    backgroundColor: appcolor.backgroundColor,
                    title: Text(
                      "Are you sure ?",
                      style: Fontstyles.ContentTextStyle(context),
                    ),
                    content: Text(
                      "Deleting will erase all the data about the author!",
                      style: Fontstyles.ContentTextStyle4(context),
                    ),
                    actions: [
                       TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text("Cancel", style: TextStyle(color: appcolor.borderColor3))),
                      TextButton(
                          onPressed: () { onDelete(authorId); Navigator.pop(context);},
                          child: Text("Delete", style: TextStyle(color: appcolor.errorColor),)),
                     
                    ],
                  ),
                );
              },
              icon: Icon(
                Icons.delete,
                color: appcolor.errorColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
