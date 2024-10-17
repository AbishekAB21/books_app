// home_screen_event.dart
part of 'home_screen_bloc.dart';

@immutable
sealed class HomeScreenEvent {}

final class FetchBooksEvent extends HomeScreenEvent {}
