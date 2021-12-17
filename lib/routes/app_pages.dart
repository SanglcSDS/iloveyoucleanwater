import 'package:get/get.dart';
import 'package:iloveyoucleanwater/controllers/account/account_binding.dart';
import 'package:iloveyoucleanwater/controllers/account/change_password_binding.dart';
import 'package:iloveyoucleanwater/controllers/account/register_binding.dart';
import 'package:iloveyoucleanwater/controllers/home/home_binding.dart';
import 'package:iloveyoucleanwater/controllers/introduce/introduce_binding.dart';
import 'package:iloveyoucleanwater/controllers/learning/course_binding.dart';
import 'package:iloveyoucleanwater/controllers/learning/evaluations_binding.dart';
import 'package:iloveyoucleanwater/controllers/learning/lessons_binding.dart';
import 'package:iloveyoucleanwater/controllers/learning/tests_binding.dart';
import 'package:iloveyoucleanwater/controllers/library/library_binding.dart';
import 'package:iloveyoucleanwater/controllers/news/news_binding.dart';
import 'package:iloveyoucleanwater/views/account/forgot_password.dart';
import 'package:iloveyoucleanwater/views/account/log_in.dart';
import 'package:iloveyoucleanwater/views/account/sign_up.dart';
import 'package:iloveyoucleanwater/views/account/user_info.dart';
import 'package:iloveyoucleanwater/views/home/home_tabbar_view.dart';
import 'package:iloveyoucleanwater/views/introduce/Introduce_view.dart';
import 'package:iloveyoucleanwater/views/learning/courses.dart';
import 'package:iloveyoucleanwater/views/learning/evaluations.dart';
import 'package:iloveyoucleanwater/views/learning/tests.dart';
import 'package:iloveyoucleanwater/views/learning/tab_bar_lessons.dart';
import 'package:iloveyoucleanwater/views/library/library_view.dart';
import 'package:iloveyoucleanwater/views/news/news_view.dart';
import 'package:iloveyoucleanwater/views/welcome/welcome_view.dart';
part 'app_routes.dart';

class AppPages {
  static const INITIAL = Routes.WELCOME;

  static final routes = [
    GetPage(
      name: Routes.HOME,
      page: () => HomeTabBarView(),
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
      name: Routes.TESTS,
      page: () => TestView(),
      binding: TestBinding(),
    ),
    GetPage(
      name: Routes.EVALUATIONS,
      page: () => EvaluationView(),
      binding: EvaluationBinding(),
    ),

    // Account
    GetPage(
      name: Routes.LOGIN,
      page: () => LogInView(),
      binding: AccountBinding(),
    ),
    GetPage(
      name: Routes.REGISTER,
      page: () => SignUpView(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: Routes.USER_INFO,
      page: () => UserInfoScreen(),
      binding: AccountBinding(),
    ),
    GetPage(
      name: Routes.CHANGE_PWD,
      page: () => ChangePasswordView(),
      binding: ChangePasswordBinding(),
    ),
  ];
}
