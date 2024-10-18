import 'package:books_app/models/model.dart';
import 'package:books_app/screens/book_detail_screen.dart';
import 'package:books_app/utils/fontstyles.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; 


class BookBuilder extends StatelessWidget {
  final Book book;

  const BookBuilder({
    Key? key,
    required this.book,
  }) : super(key: key); 

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailsScreen(
              imageUrl: book.imageUrl,
              bookName: book.title,
              authorName: book.author,
              price: NumberFormat.currency(symbol: '₹').format(book.price),
              bookdesc: book.description,
            ),
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(8), 
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(2), 
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              blurRadius: 4,
              spreadRadius: 2,
              offset: Offset(0, 2), 
            ),
          ],
        ),
        child: Column(
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.vertical(top: Radius.circular(2)),
                child: Image.network(
                  book.imageUrl,
                  fit: BoxFit.cover, 
                  height: 150,
                  width: 150,
                  errorBuilder: (context, error, stackTrace) {
                    return Image.asset(
                      "assets/no-pic.png", 
                      fit: BoxFit.cover,
                    );
                  },
                ),
              ),
            ),
            SizedBox(height: 8),
            Align(
              alignment: AlignmentDirectional.topStart,
              child: Text(
                book.title,
                style: Fontstyles.ContentTextStyle(context),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            // Align(
            //   alignment: AlignmentDirectional.topStart,
            //   child: Text(
            //     book.author,
            //     style: Fontstyles.ContentTextStyle3(context),
            //     overflow: TextOverflow.ellipsis,
            //   ),
            // ),
            Align(
              alignment: AlignmentDirectional.topStart,
              child: Text(
                NumberFormat.currency(symbol: '₹').format(book.price), 
                style: Fontstyles.ContentTextStyle2(context),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            SizedBox(height: 4), 
            
          ],
        ),
      ),
    );
  }
}
