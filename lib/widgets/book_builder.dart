import 'package:books_app/screens/book_detail_screen.dart';
import 'package:books_app/utils/fontstyles.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BookBuilder extends StatelessWidget {
  final String imageUrl;
  final String bookName;
  final String authorName;
  final String price;
  final String desc;
  BookBuilder(
      {super.key,
      required this.imageUrl,
      required this.bookName,
      required this.authorName,
      required this.price,
      required this.desc,
      });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
      //  context.go("/details", extra: {
      //     'imageUrl': imageUrl,
      //     'bookName': bookName,
      //     'authorName': authorName,
      //     'price': price,
      //     'bookdesc' : desc,
      //   });
      Navigator.push(context, MaterialPageRoute(builder: (context) => DetailsScreen(
        imageUrl: imageUrl,
        bookName: bookName,
        authorName: authorName,
        price: price,
        bookdesc: desc,
      ),));
      },
      child: Container(
        padding: EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(1),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              blurRadius: 2,
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
                  child: Image.network(
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
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
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
      ),
    );
  }
}
