enum Routes {
  home('/home'),
  setting('/setting'),
  lamp('/lamp'),
  signUp('/signUp'),
  splash('/splash');

  const Routes(this.routerName);

  factory Routes.fromStatus(String status) {
    late Routes routes;
    if (status == '') {
      return Routes.home;
    }
    values.map((Routes e) {
      if (status.startsWith(e.routerName)) {
        routes = e;
      }
    }).toList();
    return routes;
  }

  final String routerName;
}
