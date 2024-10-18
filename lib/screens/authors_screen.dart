import 'package:books_app/bloc/authors_screen_bloc/authors_bloc.dart';
import 'package:books_app/widgets/author_shimmer.dart';
import 'package:books_app/widgets/bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:books_app/widgets/author_builder.dart';
import 'package:books_app/widgets/reusable_appbar.dart';
import 'package:books_app/utils/app_theme.dart';

class AuthorsScreen extends StatefulWidget {
  const AuthorsScreen({super.key});

  @override
  _AuthorsScreenState createState() => _AuthorsScreenState();
}

class _AuthorsScreenState extends State<AuthorsScreen> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<AuthorsBloc>(context).add(FetchAuthorsEvent('Flutter'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appcolor.backgroundColor,
      appBar: ReusableAppBar(title: "Authors"),
      body: BlocBuilder<AuthorsBloc, AuthorsState>(
        builder: (context, state) {
          if (state is AuthorsLoading) {
            return ShimmerEffect(); // Use the ShimmerEffect widget
          } else if (state is AuthorsLoaded) {
            return ListView.separated(
              physics: BouncingScrollPhysics(),
              itemCount: state.authors.length,
              separatorBuilder: (context, index) => SizedBox(height: 5),
              itemBuilder: (context, index) {
                final author = state.authors[index];
                return AuthorBuilder(
                  authorName: author['author'] ?? 'Unknown Author',
                  description:
                      author['description'] ?? 'No description available',
                );
              },
            );
          } else if (state is AuthorsError) {
            return Center(child: Text('Failed to load authors'));
          } else {
            return Center(child: Text('No data available'));
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: appcolor.borderColor3,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        child: Icon(
          Icons.add_rounded,
          size: 30,
          color: appcolor.backgroundColor,
        ),
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (context) {
              return BottomSheetWidget();
            },
          );
        },
      ),
    );
  }
}
