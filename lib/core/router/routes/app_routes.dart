enum AppRoutes {
  login('/login'),
  registration('/registration'),
  home('/');

  final String path;
  const AppRoutes(this.path);
}
