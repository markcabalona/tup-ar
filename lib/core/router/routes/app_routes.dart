enum AppRoutes {
  login('/login'),
  registration('/registration'),
  home('/'),
  ar('/ar'),
  faqs('/faqs');

  final String path;
  const AppRoutes(this.path);
}
