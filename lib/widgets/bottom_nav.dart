import 'package:books_app/screens/authors_screen.dart';
import 'package:books_app/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:books_app/bloc/bottom_nav_bloc/bottom_nav_bloc.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BottomNavBloc(),
      child: Scaffold(
        body: BlocBuilder<BottomNavBloc, BottomNavState>(
          builder: (context, state) {
            if (state is BottomNavInitial) {
              return state.selectedIndex == 0 ? HomeScreen() : AuthorsScreen();
            }
            return Container(); // Fallback if no state is matched
          },
        ),
        bottomNavigationBar: BlocBuilder<BottomNavBloc, BottomNavState>(
          builder: (context, state) {
            return BottomNavigationBar(
              currentIndex: state is BottomNavInitial ? state.selectedIndex : 0,
              onTap: (index) {
                context.read<BottomNavBloc>().add(SelectTabEvent(index));
              },
              items: [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home_rounded),
                  label: "Home",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person),
                  label: "Authors",
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
