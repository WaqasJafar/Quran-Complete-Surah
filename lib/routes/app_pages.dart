// @dart=2.9
import 'package:get/get.dart';
import 'package:task_api/main.dart';
import 'package:task_api/pages/bookmark_page.dart';
import 'package:task_api/pages/pagenot_found.dart';
import 'package:task_api/pages/splash.dart';
import 'package:task_api/pages/surahdetail_page.dart';
import 'package:task_api/pages/surahlist_page.dart';
import 'package:task_api/routes/app_routes.dart';

class AppPages {
  static final List<GetPage> pages = [
    GetPage(name: AppRoutes.splash, page: () => MyHomePage()),
    GetPage(name: AppRoutes.surahlist, page: () => SurahList()),
    GetPage(name: AppRoutes.surahdetail, page: () => SurahDetail()),
    GetPage(name: AppRoutes.bookmark, page: () => BookMark()),
    GetPage(name: AppRoutes.pagenotfound, page: () => PageNotFound()),
    GetPage(name: AppRoutes.splashpage, page: () => Splash()),
    GetPage(name: AppRoutes.listitemwidget, page: () => Splash()),

  ];
}
