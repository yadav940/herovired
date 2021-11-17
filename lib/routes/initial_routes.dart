import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:herovired/ui/views/first_screen.dart';
import 'package:herovired/ui/views/second_page.dart';

class InitialRoutes {
  InitialRoutes._();

  static List<GetPage> get routes => [
        GetPage(
          name: FirstPage.routeName,
          page: () => FirstPage(),
        ),
        GetPage(
          name: SecondPage.routeName,
          page: () => SecondPage(),
        ),
      ];
}
