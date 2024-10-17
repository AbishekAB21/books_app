import 'package:books_app/utils/app_theme.dart';
import 'package:books_app/utils/fontstyles.dart';
import 'package:books_app/widgets/reusable_textfield.dart';
import 'package:flutter/material.dart';

class BottomSheetWidget extends StatelessWidget {
  const BottomSheetWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomSheet(
      backgroundColor: appcolor.backgroundColor,
      onClosing: () {},
      builder: (context) {
        return Column(
          children: [
            SizedBox(
              height: 30,
            ),
            Container(
                width: double.infinity,
                child: Column(
                  children: [
                    Text(
                      "Add author",
                      style: Fontstyles.HeadlineStyle2(context),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Divider(
                      color: appcolor.borderColor,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    ReusableTextfield(hint: "Add new author", maxline: 1),
                    SizedBox(
                      height: 10,
                    ),
                    ReusableTextfield(hint: "Biography", maxline: 5),
                    SizedBox(
                      height: 10,
                    ),
                    ReusableTextfield(
                      hint: "DOB",
                      maxline: 1,
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: appcolor.primaryColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                          child: Text(
                        "Add author",
                        style: Fontstyles.ButtonText2(context),
                      )),
                    )
                  ],
                ))
          ],
        );
      },
    );
  }
}
