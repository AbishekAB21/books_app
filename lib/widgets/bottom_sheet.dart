import 'package:books_app/bloc/authors_screen_bloc/authors_bloc.dart';
import 'package:books_app/utils/app_theme.dart';
import 'package:books_app/utils/fontstyles.dart';
import 'package:books_app/widgets/reusable_button.dart';
import 'package:books_app/widgets/reusable_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BottomSheetWidget extends StatefulWidget {
  const BottomSheetWidget({super.key});

  @override
  _BottomSheetWidgetState createState() => _BottomSheetWidgetState();
}

class _BottomSheetWidgetState extends State<BottomSheetWidget> {
  final TextEditingController authorController = TextEditingController();
  final TextEditingController bioController = TextEditingController();
  final TextEditingController dobController = TextEditingController();

  @override
  void dispose() {
    authorController.dispose();
    bioController.dispose();
    dobController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthorsBloc, AuthorsState>(
      listener: (context, state) {
        if (state is AuthorsError) {
          
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.message)),
          );
        } else if (state is AuthorsLoaded) {
          
          Navigator.pop(context);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Author added successfully!")),
          );
        }
      },
      child: BottomSheet(
        backgroundColor: appcolor.backgroundColor,
        onClosing: () {},
        builder: (context) {
          return Column(
            children: [
              SizedBox(height: 30),
              Container(
                width: double.infinity,
                child: Column(
                  children: [
                    Text(
                      "Add author",
                      style: Fontstyles.HeadlineStyle2(context),
                    ),
                    SizedBox(height: 5),
                    Divider(color: appcolor.borderColor),
                    SizedBox(height: 20),
                    ReusableTextfield(
                      hint: "Add new author",
                      maxline: 1,
                      controller: authorController,
                    ),
                    SizedBox(height: 10),
                    ReusableTextfield(
                      hint: "Biography",
                      maxline: 5,
                      controller: bioController,
                    ),
                    SizedBox(height: 10),
                    ReusableTextfield(
                      hint: "DOB",
                      maxline: 1,
                      controller: dobController,
                    ),
                    SizedBox(height: 30),
                    GestureDetector(
                      onTap: () {
                        final name = authorController.text;
                        final description = bioController.text;
                        final dob = dobController.text;

                        if (name.isNotEmpty && description.isNotEmpty && dob.isNotEmpty) {
                          
                          BlocProvider.of<AuthorsBloc>(context).add(AddAuthorEvent(name, description, dob));
                        } else {
                          
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text("Please fill in all fields.")),
                          );
                        }
                      },
                      child: ReusableButton(title: "Add author"),
                    )
                  ],
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
