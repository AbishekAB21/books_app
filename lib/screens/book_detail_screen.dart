import 'package:books_app/utils/app_theme.dart';
import 'package:books_app/utils/fontstyles.dart';
import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {
  final String? imageUrl;
  final String? bookName;
  final String? authorName;
  final String? bookdesc;
  final String? price;
  const DetailsScreen({
    super.key,
    this.imageUrl,
    this.bookName,
    this.authorName,
    this.bookdesc,
    this.price,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(backgroundColor: appcolor.backgroundColor,),
        backgroundColor: appcolor.backgroundColor,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  color: appcolor.borderColor,
                  child: Center(
                    child: ClipRRect(
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(2)),
                        child: Image.network(
                          imageUrl!,
                          fit: BoxFit.contain,
                          height: 400,
                          width: 250,
                        )),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Align(
                    alignment: AlignmentDirectional.topStart,
                    child: Text(
                      bookName!,
                      style: Fontstyles.HeadlineStyle2(context),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    )),
                // Align(
                //     alignment: AlignmentDirectional.topStart,
                //     child: Text(
                //       "by ${authorName!}",
                //       style: Fontstyles.ContentTextStyle(context),
                //       overflow: TextOverflow.ellipsis,
                //     )),
                SizedBox(
                  height: 20,
                ),
                Align(
                    alignment: AlignmentDirectional.topStart,
                    child: Text(
                      bookdesc!,
                      style: Fontstyles.ContentTextStyle2(context),
                      overflow: TextOverflow.clip,
                    )),
              ],
            ),
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          color: appcolor.backgroundColor,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(price!, style: Fontstyles.BoldandSmallStyle(context),),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                decoration: BoxDecoration(
                  color: appcolor.primaryColor,
                  borderRadius: BorderRadius.circular(10)
                ),
                child: Text("Buy now",style: Fontstyles.ButtonText1(context),),
              )
            ],
          ),
        ),
      ),
    );
  }
}
