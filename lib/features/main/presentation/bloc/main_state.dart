part of "main_bloc.dart";

enum MainMenu { home, tv, catalog, favorites, profile }

class MainState extends Equatable {
  const MainState({
    this.menu = MainMenu.home,
  });

  final MainMenu menu;

  MainState copyWith({
    MainMenu? menu,
  }) =>
      MainState(menu: menu ?? this.menu);

  @override
  List<Object?> get props => <Object?>[menu];
}
