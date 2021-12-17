part of 'app_pages.dart';

abstract class Routes {
  static const HOME = _Paths.HOME;
  static const NEWS = _Paths.NEWS;
  static const INTRODUCE = _Paths.INTRODUCE;
  static const LIBRARY = _Paths.LIBRARY;
  static const WELCOME = _Paths.WELCOME;

  static const LEARNING = _Paths.LEARNING;
  static const COURSES = _Paths.COURSES;
  static const COMMENTS = _Paths.COMMENTS;
  static const DOCUMENTS = _Paths.DOCUMENTS;
  static const LESSON_DETAIL = _Paths.LESSON_DETAIL;
  static const TESTS = _Paths.TESTS;
  static const EVALUATIONS = _Paths.EVALUATIONS;

  static const USER_INFO = _Paths.USER_INFO;
  static const LOGIN = _Paths.LOGIN;
  static const REGISTER = _Paths.REGISTER;
  static const CHANGE_PWD = _Paths.CHANGE_PWD;
}

abstract class _Paths {
  static const WELCOME = '/welcome';
  static const HOME = '/home';
  static const NEWS = '/news';
  static const INTRODUCE = '/gio-thieu';
  static const LIBRARY = '/thu-vien';

  static const LEARNING = '/learning';
  static const COURSES = '/courses';
  static const COMMENTS = '/comments';
  static const DOCUMENTS = '/documents';
  static const LESSON_DETAIL = '/lesson-detail';
  static const TESTS = '/tests';
  static const EVALUATIONS = '/evaluations';

  static const USER_INFO = '/user-info';
  static const LOGIN = '/login';
  static const REGISTER = '/register';
  static const CHANGE_PWD = '/change-pwd';
}
