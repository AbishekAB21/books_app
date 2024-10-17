
import 'package:books_app/screens/authors_screen.dart';
import 'package:books_app/screens/book_detail_screen.dart';
import 'package:books_app/screens/home.dart';
import 'package:books_app/screens/splash-screen.dart';
import 'package:go_router/go_router.dart';

class MyAppRouter{

  GoRouter router = GoRouter(
    initialLocation: "/splash",
    routes: [
      
      GoRoute(
        name: 'splash',
        path: '/splash',
        builder: (context, state) {
          return SplashScreen();
        },
      ),

      GoRoute(
        name: '/home',
        path: '/home',
        builder: (context, state) {
          return HomeScreen();
        },
      ),

      GoRoute(
        name: '/details',
        path: '/details',
        builder: (context, state) {
          return DetailsScreen();
        },
      ),

      GoRoute(
        name: '/authors',
        path: '/authors',
        builder: (context, state) {
          return AuthorsScreen();
        },
      ),
    ]
  );
}