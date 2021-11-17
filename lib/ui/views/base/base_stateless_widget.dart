import 'package:herovired/ui/views/base/base.dart';
import 'package:get/get.dart';

abstract class BaseStatelessWidget extends StatelessWidget {
  const BaseStatelessWidget({Key? key}) : super(key: key);
  // double get screenHeight => MediaQuery.of(context).size.height;
  double get screenHeight => Get.height;

  // double get screenWidth => MediaQuery.of(context).size.width;
  double get screenWidth => Get.width;

  double get statusBarHeight => MediaQuery.of(Get.context!).padding.top;

  // double get statusBarHeight => Get.statusBarHeight;

  double get actionBarHeight => AppBar().preferredSize.height;
}
