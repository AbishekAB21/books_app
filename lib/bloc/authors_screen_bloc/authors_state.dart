part of 'authors_bloc.dart';

@immutable
abstract class AuthorsState {}

class AuthorsInitial extends AuthorsState {}

class AuthorsLoading extends AuthorsState {}

class AuthorsLoaded extends AuthorsState {
  final List<Map<String, dynamic>> authors;
  AuthorsLoaded(this.authors);
}

class AuthorsError extends AuthorsState {
  final String message;
  AuthorsError(this.message);
}
