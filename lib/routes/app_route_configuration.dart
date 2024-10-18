import 'package:books_app/screens/authors_screen.dart';
import 'package:books_app/screens/book_detail_screen.dart';
import 'package:books_app/screens/home.dart';
import 'package:books_app/screens/splash-screen.dart';
import 'package:go_router/go_router.dart';

class MyAppRouter {
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
          final args = state.extra as Map<String, dynamic>?;
          return DetailsScreen(
            imageUrl: args?['imageUrl'],
            bookName: args?['bookName'],
            authorName: args?['authorName'],
            price: args?['price'],
            bookdesc: args?['description'],
          );
        },
      ),
      GoRoute(
        name: '/authors',
        path: '/authors',
        builder: (context, state) {
          return AuthorsScreen();
        },
      ),
    ],
  );
}
