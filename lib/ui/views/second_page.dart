import 'package:herovired/controller/second_page_controller.dart';
import 'package:herovired/model/second_page_model.dart';
import 'package:herovired/ui/usefull/palette.dart';
import 'package:herovired/ui/views/widgets/expanded.dart';
import 'package:herovired/ui/views/widgets/popup_utils.dart';
import 'package:herovired/ui/views/widgets/tabs_view.dart';
import 'package:herovired/utils/network_status.dart';

import 'base/base.dart';

class SecondPage extends AppPageWithAppBar {
  static final routeName = "/SecondPage";

  static void start(String title) {
    navigateOffAll(routeName, currentPageTitle: title);
  }

  final controller = Get.put(SecondPageController());

  @override
  Widget get body {
    openBottomSheet(controller.title, controller.progress);
    return Column(
      children: [
        AppTabBar(
          border: Border.all(color: Palette.greyScaleLight1),
          indicatorColor: Palette.colorUserBackgroundPink,
          padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
          tabs: [
            Tab(
              text: 'Table of contemts',
            ),
            Tab(
              text: 'About',
            ),
            Tab(
              text: 'Discussion',
            ),
          ],
          onTabClicked: (index) async {},
        ),
      ],
    );
  }

  Future<void> openBottomSheet(title, progress,{initialChildSize=0.7}) async {
    await showAppBottomSheet(
      dragDismissible: false,
      initialChildSize: initialChildSize,
      child: getBottomSheet(title, progress),
    ).then((value) => openBottomSheet(title, progress,initialChildSize: 0.04));
  }

  Widget getBottomSheet(String title, int progress) {
    return Padding(
      padding: const EdgeInsets.only(left: 12.0, right: 12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Flexible(
                flex: 3,
                child: LinearProgressIndicator(
                  backgroundColor: Palette.colorInProgressLight,
                  color: Palette.colorUserBackgroundPink,
                  value: (progress.toDouble()) / 100,
                ),
              ),
              Flexible(
                  flex: 1,
                  child: Text(
                    '$progress%',
                    style: TextStyle(color: Palette.colorUserBackgroundPink),
                  ))
            ],
          ),
          Divider(),
          Expanded(flex: 1, child: Obx(() => getList))
        ],
      ),
    );
  }

  Widget get getList {
    Widget widget;
    switch (controller.networkStatus.value) {
      case NetworkStatus.LOADING:
        widget = Center(
          child: CircularProgressIndicator(
            backgroundColor: Colors.red,
            strokeWidth: 4,
          ),
        );
        break;
      case NetworkStatus.ERROR:
        widget = Center(child: Text('Error ....'));
        break;
      case NetworkStatus.SUCCESS:
        widget = ListView.builder(
          shrinkWrap: true,
          itemCount: controller.secondPageModel.secondModelList?.length ?? 0,
          itemBuilder: (context, i) {
            return getCourseListIteam(
                controller.secondPageModel.secondModelList![i], i);
          },
        );
        break;
      default:
        widget = Container();
    }

    return widget;
  }

  Widget getCourseListIteam(SecondModel secondModel, int index) {
    return Padding(
        padding: const EdgeInsets.only(top: 3.0),
        child: AppExpandeWiget(secondModel, index));
  }
}
