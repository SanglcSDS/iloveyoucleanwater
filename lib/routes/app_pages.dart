import 'package:get/get.dart';
import 'package:iloveyoucleanwater/controllers/account/account_binding.dart';
import 'package:iloveyoucleanwater/controllers/account/register_binding.dart';
import 'package:iloveyoucleanwater/controllers/home/home_binding.dart';
import 'package:iloveyoucleanwater/controllers/introduce/introduce_binding.dart';
import 'package:iloveyoucleanwater/controllers/learning/course_binding.dart';
import 'package:iloveyoucleanwater/controllers/learning/lessons_binding.dart';
import 'package:iloveyoucleanwater/controllers/learning/questions_binding.dart';
import 'package:iloveyoucleanwater/controllers/library/library_binding.dart';
import 'package:iloveyoucleanwater/controllers/news/news_binding.dart';
import 'package:iloveyoucleanwater/views/account/login.dart';
import 'package:iloveyoucleanwater/views/account/register.dart';
import 'package:iloveyoucleanwater/views/account/user_info.dart';
import 'package:iloveyoucleanwater/views/home/home_view.dart';
import 'package:iloveyoucleanwater/views/introduce/Introduce_view.dart';
import 'package:iloveyoucleanwater/views/learning/courses.dart';
import 'package:iloveyoucleanwater/views/learning/questions.dart';
import 'package:iloveyoucleanwater/views/learning/tab_bar_lessons.dart';
import 'package:iloveyoucleanwater/views/library/library_view.dart';
import 'package:iloveyoucleanwater/views/news/news_view.dart';
import 'package:iloveyoucleanwater/views/welcome/welcome_view.dart';
part 'app_routes.dart';

class AppPages {
  static const INITIAL = Routes.HOME;
  // static const INITIAL = Routes.LOGIN;

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
      name: Routes.QUESTIONS,
      page: () => QuestionView(),
      binding: QuestionBinding(),
    ),

    // Account
    GetPage(
      name: Routes.LOGIN,
      page: () => LoginScreen(),
      binding: AccountBinding(),
    ),
    GetPage(
      name: Routes.REGISTER,
      page: () => RegisterScreen(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: Routes.USER_INFO,
      page: () => UserInfoScreen(),
      binding: AccountBinding(),
    ),
  ];
}
