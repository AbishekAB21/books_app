
import 'package:books_app/models/model.dart';
import 'package:meta/meta.dart';

@immutable
abstract class HomeScreenState {}

class HomeScreenInitial extends HomeScreenState {}

class HomeScreenLoading extends HomeScreenState {}

class HomeScreenLoaded extends HomeScreenState {
  final List<Book> books; 

  HomeScreenLoaded(this.books);
}

class HomeScreenError extends HomeScreenState {
  final String message;

  HomeScreenError(this.message);
}
