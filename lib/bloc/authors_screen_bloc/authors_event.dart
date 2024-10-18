part of 'authors_bloc.dart';

@immutable
abstract class AuthorsEvent {}

class FetchAuthorsEvent extends AuthorsEvent {
  final String query;

  FetchAuthorsEvent(this.query);
}

class AddAuthorEvent extends AuthorsEvent {
  final String name;
  final String description;
  final String dob;

  AddAuthorEvent(this.name, this.description, this.dob);
}
