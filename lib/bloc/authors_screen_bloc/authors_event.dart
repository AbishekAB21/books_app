part of 'authors_bloc.dart';

@immutable
abstract class AuthorsEvent {}

class FetchAuthorsEvent extends AuthorsEvent {
  final String query;

  FetchAuthorsEvent(this.query);
}
