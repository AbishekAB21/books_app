part of 'bottom_nav_bloc.dart';

@immutable
sealed class BottomNavEvent {
  const BottomNavEvent();
}

class SelectTabEvent extends BottomNavEvent {
  final int index;

  const SelectTabEvent(this.index);
}
