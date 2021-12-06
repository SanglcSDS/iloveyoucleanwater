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
  static const QUESTIONS = _Paths.QUESTIONS;
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
  static const QUESTIONS = '/questions';
}
