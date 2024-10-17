import 'package:books_app/utils/fontstyles.dart';
import 'package:flutter/material.dart';

class BookBuilder extends StatelessWidget {
  final String imageUrl;
  final String bookName;
  final String authorName;
  final String price;
  BookBuilder(
      {super.key,
      required this.imageUrl,
      required this.bookName,
      required this.authorName,
      required this.price});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(2),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 5,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Column(
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Book Image
          Expanded(
            child: ClipRRect(
                borderRadius: BorderRadius.vertical(top: Radius.circular(2)),
                child: Image.asset(
                  imageUrl,
                  fit: BoxFit.contain,
                  height: 100,
                  width: 150,
                )),
          ),

          // Book Details
          Align(
              alignment: AlignmentDirectional.topStart,
              child: Text(
                bookName,
                style: Fontstyles.ContentTextStyle(context),
                overflow: TextOverflow.clip,
              )),
          Align(
              alignment: AlignmentDirectional.topStart,
              child: Text(
                authorName,
                style: Fontstyles.ContentTextStyle3(context),
                overflow: TextOverflow.ellipsis,
              )),
          Align(
              alignment: AlignmentDirectional.topStart,
              child: Text(
                price,
                style: Fontstyles.ContentTextStyle2(context),
                overflow: TextOverflow.ellipsis,
              )),
        ],
      ),
    );
  }
}
