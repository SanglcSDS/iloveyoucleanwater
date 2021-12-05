import 'package:get/get.dart';
import 'package:iloveyoucleanwater/controllers/home/home_binding.dart';
import 'package:iloveyoucleanwater/controllers/introduce/introduce_binding.dart';
import 'package:iloveyoucleanwater/controllers/learning/learning_binding.dart';
import 'package:iloveyoucleanwater/controllers/library/library_binding.dart';
import 'package:iloveyoucleanwater/controllers/news/news_binding.dart';
import 'package:iloveyoucleanwater/views/home/home_view.dart';
import 'package:iloveyoucleanwater/views/introduce/Introduce_view.dart';
import 'package:iloveyoucleanwater/views/learning/learning_view.dart';
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
      name: Routes.LEARNING,
      page: () => LearningView(),
      binding: LearningBinding(),
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
  ];
}
