enum AppRoutes {
  board('/board'),
  login('/login'),
  home('/home'),
  profile('/profile'),
  ;

  const AppRoutes(this.location);

  final String location;
}
