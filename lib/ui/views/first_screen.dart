import 'dart:ffi';

import 'package:herovired/controller/first_page_controller.dart';
import 'package:herovired/model/first_page_model.dart';
import 'package:herovired/services/navigation.dart';
import 'package:herovired/ui/usefull/palette.dart';
import 'package:herovired/ui/usefull/styles/text_styles.dart';
import 'package:herovired/ui/views/second_page.dart';
import 'package:herovired/ui/views/widgets/play_button.dart';
import 'package:herovired/ui/views/widgets/popup_utils.dart';
import 'package:herovired/ui/views/widgets/tabs_view.dart';
import 'package:herovired/utils/network_status.dart';

import 'base/base.dart';
import 'base/page.dart';

class FirstPage extends AppPageWithAppBar {
  static final routeName = "/";

  static void start() {
    navigateOffAll(routeName);
  }

  final controller = Get.put(FirstPageController());

  @override
  double? get toolbarHeight => 0;

  @override
  Widget get body {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
            ),
            child: Text(
              'My Announcement',
              style: TextStyles.sp20(fontWeight: FontWeight.w500),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Palette.dividerColor, width: 1.0),
              color: Palette.colorPageBg,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25.0),
                  topRight: Radius.circular(25.0)),
              boxShadow: <BoxShadow>[
                new BoxShadow(
                  color: Palette.greyScaleDark4,
                  blurRadius: 18.0,
                  offset: new Offset(0.0, 1.0),
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
              child: AppTabBar(
                border: Border.all(color: Palette.greyScaleLight1),
                padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                tabs: [
                  Tab(
                    icon: Icon(Icons.home_outlined),
                  ),
                  Tab(
                    icon: Icon(Icons.calendar_today_outlined),
                  ),
                  Tab(
                    child: PlayButton(
                      height: 50,
                    ),
                  ),
                  Tab(
                    icon: Icon(Icons.messenger_outline),
                  ),
                  Tab(
                    icon: Icon(Icons.account_box_outlined),
                  ),
                ],
                onTabClicked: (index) async {
                  debugPrint('-------$index');
                  if (index == 2) {
                    await showAppBottomSheet(
                      child: getBottomSheet,
                    );
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget get getBottomSheet {
    return Padding(
      padding: const EdgeInsets.only(left: 12.0, right: 12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Learn Now'),
          Divider(),
          //ListView(),
          Obx(() => getList)
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
            strokeWidth: 2,
          ),
        );
        break;
      case NetworkStatus.ERROR:
        widget = Center(child: Text('Error ....'));
        break;
      case NetworkStatus.SUCCESS:
        widget = ListView.builder(
          shrinkWrap: true,
          itemCount: controller.firstPageModel.coursedata?.length ?? 0,
          itemBuilder: (context, i) {
            return getCourseListIteam(controller.firstPageModel.coursedata![i]);
          },
        );  ;
        break;
      default:
        widget = Container();
    }

    return widget;
  }

  Widget getCourseListIteam(CourseData coursedata) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            flex: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(coursedata.coursename ?? ''),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Flexible(
                      flex: 3,
                      child: LinearProgressIndicator(
                        backgroundColor: Palette.colorInProgressLight,
                        //valueColor: new AlwaysStoppedAnimation<Color>(Palette.colorExpiredText),
                        color: Palette.colorUserBackgroundPink,
                        value: (coursedata.progress?.toDouble() ?? 0.0) / 100,
                      ),
                    ),
                    Flexible(
                        flex: 1,
                        child: Text(
                          '${coursedata.progress ?? 0}%',
                          style:
                              TextStyle(color: Palette.colorUserBackgroundPink),
                        ))
                  ],
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: InkWell(
              onTap: () {
                Navigator.pop(Get.context!);
                Get.toNamed(SecondPage.routeName, arguments: {
                  'title': coursedata.coursename ?? '',
                  'arguments': coursedata.courseid.toString(),
                  'progress': coursedata.progress,
                });
              },
              child: PlayButton(),
            ),
          )
        ],
      ),
    );
  }
}
