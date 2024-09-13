abstract class NavigationEvent {}

class UpdateNavigationIndex extends NavigationEvent {
  final int index;
  UpdateNavigationIndex(this.index);
}