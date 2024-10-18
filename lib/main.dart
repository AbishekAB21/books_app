import 'package:books_app/api/authors_api_request.dart';
import 'package:books_app/bloc/authors_screen_bloc/authors_bloc.dart';
import 'package:books_app/bloc/bottom_nav_bloc/bottom_nav_bloc.dart';
import 'package:books_app/bloc/home_screen_bloc/home_screen_bloc.dart';
import 'package:books_app/routes/app_route_configuration.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(
    MultiBlocProvider(providers: [
      BlocProvider(create: (context) =>  HomeScreenBloc(),),
      BlocProvider(create: (context) => AuthorsBloc(BooksRepository()),),
      BlocProvider(create: (context) => BottomNavBloc(),)
    ], child: const MyApp())
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: MyAppRouter().router,
    );
  }
}
