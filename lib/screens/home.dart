import 'package:books_app/bloc/home_screen_bloc/home_screen_bloc.dart';
import 'package:books_app/widgets/home_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:books_app/utils/app_theme.dart';
import 'package:books_app/widgets/book_builder.dart';
import 'package:books_app/widgets/reusable_appbar.dart';
import 'package:books_app/widgets/search_box.dart';

// Home Screen
class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    context.read<HomeScreenBloc>().add(FetchBooksEvent());
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: appcolor.backgroundColor,
        appBar: ReusableAppBar(title: "App name"),
        body: BlocBuilder<HomeScreenBloc, HomeScreenState>(
          builder: (context, state) {
            if (state is HomeScreenLoading) {
              return buildShimmerEffect(); // Shimmer
            } else if (state is HomeScreenLoaded) {
              final books = state.books;
              return SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Column(
                    children: [
                      SizedBox(height: 10),
                      SearchBox(cntlr: searchController),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                        child: GridView.builder(
                          shrinkWrap: true,
                          physics: BouncingScrollPhysics(),
                          itemCount: books.length,
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 0.65,
                            crossAxisSpacing: 5,
                            mainAxisSpacing: 5,
                          ),
                          itemBuilder: (context, index) {
                            return BookBuilder(
                              imageUrl: books[index]['image']!,
                              bookName: books[index]['title']!,
                              authorName: books[index]['author']!,
                              price: books[index]['price']!,
                              desc: books[index]['description']!,
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              );
            } else if (state is HomeScreenError) {
              return Center(child: Text(state.message));
            }

            return Center(child: Text('No books found.'));
          },
        ),
        
      ),
    );
  }

}
