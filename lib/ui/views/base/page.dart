import 'package:flutter/services.dart';
import 'package:herovired/ui/usefull/palette.dart';
import 'package:herovired/ui/usefull/styles/text_styles.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:herovired/ui/views/base/base.dart';
import 'package:focus_detector/focus_detector.dart';

import 'base_stateless_widget.dart';
export 'package:herovired/services/navigation.dart';

abstract class AppPage extends BaseStatelessWidget {
  dynamic get arguments {
    try {
      return Get.arguments['arguments'];
    } catch (e) {
      return null;
    }
  }

  Widget? get leadingWidget {
    return IconButton(
        visualDensity: VisualDensity.compact,
        splashRadius: 24,
        onPressed: Get.back,
        icon: Icon(Icons.arrow_back_ios),
        /*icon: SvgPicture.asset(AssetConstants.ic_toolbar_back,
            height: 16.8, width: 8.4, fit: BoxFit.scaleDown)*/);
  }

  String get title {
    try {
      return Get.arguments['title'];
    } catch (e) {
      return '';
    }
  }

  Widget? get titleWidget => null;

  bool get centerTitle => false;

  Widget get defaultTitleWidget => Text(
        title,
        style: TextStyles.sp17(color: actionBarContentColor),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      );

  //List<Widget>? get actions => modulePageActions;

  /*final List<Widget> moduleDashboardActions = [
    IconButton(
      onPressed: () {
        *//*navigateTo(Constants.profile,
            currentPageTitle: TranslationKeys.home.tr);*//*
      },
      icon: SvgPicture.asset(
        AssetConstants.ic_user,
        key: HomePageController.userTabKey,
      ),
      splashRadius: 24,
    ),
    Badge(
      text: '2',
      child: IconButton(
        onPressed: () {
          navigateTo(Constants.announcementNotification,
              currentPageTitle: TranslationKeys.today.tr);
        },
        icon: SvgPicture.asset(
          AssetConstants.ic_announcement,
          key: HomePageController.announcementTabKey,
        ),
        splashRadius: 24,
      ),
    ),
  ];*/

  final List<Widget> modulePageActions = [
    IconButton(
      onPressed: () {},
      icon: Container()/*SvgPicture.asset(AssetConstants.ic_cross)*/,
      splashRadius: 24,
    )
  ];

  double? get toolbarHeight => null;

  bool get automaticallyImplyLeading => true;

  Color get actionBarContentColor => Palette.colorTextActionBarTitle;

  String? get heading => null;

  Widget? get headerAction => null;

  Widget simpleAddHeaderAction(String text, VoidCallback? onTap) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.translucent,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.add, color: Palette.psMain),
            Text(text, style: TextStyles.sp14(color: Palette.psMain)),
          ],
        ),
      ),
    );
  }

  Widget get header {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
            child: Text(
              heading ?? '',
              style: TextStyles.pageTitle(color: Palette.greyScaleDark0),
            ),
          ),
        ),
        if (headerAction != null) headerAction!,
      ],
    );
  }

  Widget? get jinie => null;

  Widget? get bottomNavBar => null;

  FloatingActionButtonLocation? get floatingActionButtonLocation => null;

  Future<bool> Function()? get onWillPop => null;
}

enum WidgetVisibility {
  Visible,
  Invisible,
}

class AppPageWithAppBar extends AppPage {
  PreferredSizeWidget? get appBar {
    return AppBar(
      leading: leadingWidget,
      automaticallyImplyLeading: automaticallyImplyLeading,
      iconTheme: IconThemeData(color: actionBarContentColor),
      elevation: 0,
      titleSpacing: 0,
      centerTitle: centerTitle,
      backgroundColor: Colors.transparent,
      toolbarHeight: toolbarHeight,
      systemOverlayStyle: SystemUiOverlayStyle.dark
          .copyWith(statusBarColor: Colors.transparent),
      title: titleWidget ?? defaultTitleWidget,
      /*actions: actions
          ?.map((e) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4), child: e))
          .toList(),*/
    );
  }

  bool get resizeToAvoidBottomInset => true;

  bool get observeVisiblityChnages => false;

  void onResume() {}

  void onPause() {}

  Widget get body => Container();

  @override
  Widget build(BuildContext context) {
    Widget content = Scaffold(
      appBar: appBar,
      body: body,
      floatingActionButton: jinie,
      floatingActionButtonLocation: floatingActionButtonLocation,
      bottomNavigationBar: bottomNavBar,
      resizeToAvoidBottomInset: resizeToAvoidBottomInset,
    );

    return WillPopScope(
        child: observeVisiblityChnages
            ? FocusDetector(
                onFocusGained: () {
                  onResume();
                },
                onFocusLost: () {
                  onPause();
                },
                onVisibilityLost: () {
                  onPause();
                },
                child: content,
              )
            : content,
        onWillPop: onWillPop);
  }
}

class AppPageWithSliverAppBar extends AppPage {
  SliverAppBar get sliverAppBar {
    return SliverAppBar(
      snap: true,
      floating: true,
      leading: leadingWidget,
      iconTheme: IconThemeData(color: actionBarContentColor),
      backgroundColor: Colors.transparent,
      systemOverlayStyle: SystemUiOverlayStyle.dark
          .copyWith(statusBarColor: Colors.transparent),
      elevation: 0,
      titleSpacing: 0,
      centerTitle: centerTitle,
      toolbarHeight: toolbarHeight ?? kToolbarHeight,
      title: titleWidget ?? defaultTitleWidget,
      /*actions: actions
          ?.map((e) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4), child: e))
          .toList(),*/
    );
  }

  List<Widget> get slivers => [];

  @override
  Widget build(BuildContext context) {
    Widget content = Scaffold(
      body: CustomScrollView(slivers: [sliverAppBar, ...slivers]),
      floatingActionButton: jinie,
    );

    return WillPopScope(child: content, onWillPop: onWillPop);
  }
}
