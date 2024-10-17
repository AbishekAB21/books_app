part of 'home_screen_bloc.dart';

@immutable
sealed class HomeScreenEvent {}

final class FetchBooksEvent extends HomeScreenEvent {}

final class SearchBooksEvent extends HomeScreenEvent {
  final String query;

  SearchBooksEvent(this.query);
}
