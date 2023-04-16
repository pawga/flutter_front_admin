import 'package:get/get.dart';

import '../presentation/home/home_binding.dart';
import '../presentation/home/home_view.dart';

part 'app_routes.dart';

class AppPages {
  static const initial = Routes.home;

  static final routes = [
    GetPage(
      name: Routes.home,
      page: () => HomePage(),
      binding: HomeBinding(),
    ),
  ];
}
