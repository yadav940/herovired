import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:herovired/ui/usefull/palette.dart';

export 'package:flutter/material.dart';
//export 'package:flutter_super_app/ui/views/widgets/widgets.dart';

abstract class BaseStatefulWidget extends StatefulWidget {
  BaseStatefulWidget({Key? key}) : super(key: key);
}

abstract class BaseState<Page extends BaseStatefulWidget> extends State<Page> {
  // TODO Probably needs to be removed all of these, unnecessary space waste
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final formKey = GlobalKey<FormState>();
  BuildContext? mContext;
  ScrollController? scrollController;

  // double get screenHeight => MediaQuery.of(context).size.height;
  double get screenHeight => Get.height;

  // double get screenWidth => MediaQuery.of(context).size.width;
  double get screenWidth => Get.width;

  double get statusBarHeight => MediaQuery.of(context).padding.top;

  // double get statusBarHeight => Get.statusBarHeight;

  double get actionBarHeight => AppBar().preferredSize.height;

  //true means keyboard resize, false means overlap on the screen
  bool get resizeToAvoidBottomInset => false;

  Widget body() {
    return SizedBox.shrink();
  }

  Widget? bottomNavigationBar() {
    return null;
  }

  Widget? floatingActionButton() {
    return null;
  }

  FloatingActionButtonLocation getFloatingActionButtonLocation() {
    return FloatingActionButtonLocation.endFloat;
  }

  Color pageBgColor() {
    return Palette.colorPageBg;
  }

  showToast(String msg) {
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        fontSize: 16.0);
  }

  hideSoftKeyboard() async {
    print("Has focus ${FocusManager.instance.primaryFocus!.hasFocus}");
    FocusManager.instance.primaryFocus!.unfocus();
    return await Future.delayed(Duration(milliseconds: 100));
  }

  /// blocks rotation; sets orientation to: portrait
  void portraitModeOnly() {
    SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
  }

  void portraitAndLandscapeModes({bool withEnabledToolBar = true}) {
    if (withEnabledToolBar) {
      SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
    } else {
      SystemChrome.setEnabledSystemUIOverlays([]);
    }
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
  }
}
