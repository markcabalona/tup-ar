enum AppRoutes {
  login('/login'),
  registration('/registration'),
  eventsPlaces('/events-places'),
  singleEventsPlace('events-places/:id'),
  faqs('/faqs'),
  pageNotFound('/page-not-found');

  final String path;
  const AppRoutes(this.path);
}
