part of "app_routes.dart";

sealed class Routes {
  Routes._();

  static const String initial = "/";

  /// Home
  static const String home = "/home";
  static const String search = "/search";
  static const String detail = "/detail";

  /// internet connection
  static const String noInternet = "/no-internet";
}
