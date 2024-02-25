enum AppRoutes {
  login('/login'),
  registration('/registration'),
  home('/'),
  ar('/ar');

  final String path;
  const AppRoutes(this.path);
}
