// home_screen_state.dart
import 'package:books_app/models/model.dart'; // Ensure to import the correct Book model
import 'package:meta/meta.dart';

@immutable
abstract class HomeScreenState {}

class HomeScreenInitial extends HomeScreenState {}

class HomeScreenLoading extends HomeScreenState {}

class HomeScreenLoaded extends HomeScreenState {
  final List<Book> books; // Use the Book type from model.dart

  HomeScreenLoaded(this.books);
}

class HomeScreenError extends HomeScreenState {
  final String message;

  HomeScreenError(this.message);
}
