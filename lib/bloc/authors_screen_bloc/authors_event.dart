part of 'authors_bloc.dart';

@immutable
abstract class AuthorsEvent {}

// This event will trigger fetching authors without any query
class FetchAuthorsEvent extends AuthorsEvent {}

// This event will allow adding new authors to the list
class AddAuthorEvent extends AuthorsEvent {
  final String name;
  final String description;
  final String dob;

  AddAuthorEvent(this.name, this.description, this.dob);
}
