import 'package:get/get.dart';
import 'package:iloveyoucleanwater/controllers/home/home_binding.dart';
import 'package:iloveyoucleanwater/controllers/introduce/introduce_binding.dart';
import 'package:iloveyoucleanwater/controllers/learning/course_binding.dart';
import 'package:iloveyoucleanwater/controllers/learning/lesson_detail_binding.dart';
import 'package:iloveyoucleanwater/controllers/learning/lessons_binding.dart';
import 'package:iloveyoucleanwater/controllers/learning/questions_binding.dart';
import 'package:iloveyoucleanwater/controllers/library/library_binding.dart';
import 'package:iloveyoucleanwater/controllers/news/news_binding.dart';
import 'package:iloveyoucleanwater/views/home/home_view.dart';
import 'package:iloveyoucleanwater/views/introduce/Introduce_view.dart';
import 'package:iloveyoucleanwater/views/learning/courses.dart';
import 'package:iloveyoucleanwater/views/learning/lesson_detail.dart';
import 'package:iloveyoucleanwater/views/learning/questions.dart';
import 'package:iloveyoucleanwater/views/learning/tab_bar_lessons.dart';
import 'package:iloveyoucleanwater/views/library/library_view.dart';
import 'package:iloveyoucleanwater/views/news/news_view.dart';
import 'package:iloveyoucleanwater/views/welcome/welcome_view.dart';
part 'app_routes.dart';

class AppPages {
  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: Routes.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: Routes.WELCOME,
      page: () => WelcomeView(),
    ),
    GetPage(
      name: Routes.INTRODUCE,
      page: () => IntroduceView(),
      binding: IntroduceBinding(),
    ),
    GetPage(
      name: Routes.NEWS,
      page: () => NewsView(),
      binding: NewsBinding(),
    ),
    GetPage(
      name: Routes.LIBRARY,
      page: () => LibraryView(),
      binding: LibraryBinding(),
    ),

    // E-learning
    GetPage(
      name: Routes.LEARNING,
      page: () => LearningView(),
      binding: LessonBinding(),
    ),
    GetPage(
      name: Routes.COURSES,
      page: () => CourseView(),
      binding: CourseBinding(),
    ),
    GetPage(
      name: Routes.LESSON_DETAIL,
      page: () => LessonDetailView(),
      binding: LessonDetailBinding(),
    ),
    GetPage(
      name: Routes.QUESTIONS,
      page: () => QuestionView(),
      binding: QuestionBinding(),
    ),
  ];
}
