part of 'app_pages.dart';

abstract class Routes {
  static const HOME = _Paths.HOME;
  static const NEWS = _Paths.NEWS;
  static const INTRODUCE = _Paths.INTRODUCE;
  static const LIBRARY = _Paths.LIBRARY;
  static const LEARNING = _Paths.LEARNING;
  static const WELCOME = _Paths.WELCOME;
}

abstract class _Paths {
  static const WELCOME = '/welcome';
  static const HOME = '/home';
  static const NEWS = '/news';
  static const INTRODUCE = '/gio-thieu';
  static const LIBRARY = '/thu-vien';
  static const LEARNING = '/learning';
}
