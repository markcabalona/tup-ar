enum AppRoutes {
  login('/login'),
  registration('/registration'),
  eventsPlaces('/events-places'),
  singleEventsPlace(':id'),
  faqs('/faqs'),
  themeRating('ratings/:id'),
  pageNotFound('/page-not-found');

  final String path;
  const AppRoutes(this.path);
}
