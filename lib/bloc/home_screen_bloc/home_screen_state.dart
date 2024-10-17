// home_screen_state.dart
part of 'home_screen_bloc.dart';

@immutable
sealed class HomeScreenState {}

final class HomeScreenInitial extends HomeScreenState {}

final class HomeScreenLoading extends HomeScreenState {}

final class HomeScreenLoaded extends HomeScreenState {
  final List<Map<String, String>> books;

  HomeScreenLoaded(this.books);
}

final class HomeScreenError extends HomeScreenState {
  final String message;

  HomeScreenError(this.message);
}
