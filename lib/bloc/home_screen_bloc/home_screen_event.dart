import 'package:meta/meta.dart';

@immutable
sealed class HomeScreenEvent {}

final class FetchBooksEvent extends HomeScreenEvent {}

final class SearchBooksEvent extends HomeScreenEvent {
  final String query;

  SearchBooksEvent(this.query);
}
