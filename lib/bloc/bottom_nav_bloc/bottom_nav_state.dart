part of 'bottom_nav_bloc.dart';

@immutable
sealed class BottomNavState {
  const BottomNavState();
}

class BottomNavInitial extends BottomNavState {
  final int selectedIndex;

  const BottomNavInitial([this.selectedIndex = 0]);
}
