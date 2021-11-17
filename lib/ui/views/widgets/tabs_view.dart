import 'package:flutter/material.dart';
import 'package:herovired/ui/usefull/palette.dart';
import 'package:herovired/ui/usefull/styles/text_styles.dart';
import 'package:herovired/ui/views/base/base_stateless_widget.dart';

/// Custom Tabs Widget
///
/// Most of what this widget does is that it creates a Tab highlight that conforms to
/// the designs provided to us
///
/// IMPORTANT - MAKE SURE TO WRAP THIS INSIDE AN EXPANDED IF USING INSIDE A COLUMN
class TabsView extends BaseStatelessWidget {
  /// The number of tabs/pages you intend to put inside this Widget
  ///
  /// See [DefaultTabController.length] for more info
  final int length;

  /// First Tab to be be auto selected
  ///
  /// See [DefaultTabController.initialIndex] for more info
  final int initialIndex;

  /// The List of [Tab]s Widget to be displayed
  ///
  /// See [TabBar.tabs] for more info
  final List<Tab> tabs;

  /// The List of [Widget]s to be used as the content for the [tabs]
  ///
  /// Each widget in [pages] corresponds to each entry in the [tabs]
  final List<Widget> pages;

  ///Set TabHolder margin
  final EdgeInsets? tabsHolderMargin;

  TabsView({
    required this.length,
    this.initialIndex = 0,
    required this.tabs,
    required this.pages,
    this.tabsHolderMargin = const EdgeInsets.symmetric(horizontal: 16, vertical: 12)
  });

  Widget get tabsHolder {
    return Container(
      //margin: tabsHolderMargin,
      height: 32,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Palette.colorCardBg,
        //boxShadow: CardStyles.basicShadows
      ),
      child: TabBar(
        indicator: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Palette.colorBottomNavBar,
        ),
        unselectedLabelStyle: TextStyles.sp14(),
        labelStyle: TextStyles.sp14(fontWeight: FontWeight.w700),
        unselectedLabelColor: Palette.colorPrimaryText,
        labelColor: Colors.white,
        tabs: tabs,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: length,
      initialIndex: initialIndex,
      child: Column(
        children: [
          tabsHolder,
          Expanded(child: TabBarView(children: pages)),
        ],
      ),
    );
  }
}

class AppTabBar extends StatefulWidget {
  final List<Tab> tabs;
  final Function(int) onTabClicked;
  final EdgeInsets padding;
  final int initialTabIndex;
  final Color background;
  final Color indicatorColor;
  final BoxBorder? border;
  final EdgeInsets? labelPadding;

  const AppTabBar({
    Key? key,
    required this.tabs,
    required this.onTabClicked,
    this.padding = const EdgeInsets.symmetric(
      horizontal: 15,
    ),
    this.initialTabIndex = 0,
    this.background = Palette.greyScaleLight3,
    this.border,
    this.labelPadding,
    this.indicatorColor=Colors.transparent,
  }) : super(key: key);

  @override
  _AppTabBarState createState() => _AppTabBarState();
}

/// Used to create only tabs
class _AppTabBarState extends State<AppTabBar>
    with SingleTickerProviderStateMixin {
  late final TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = new TabController(length: widget.tabs.length, vsync: this);
    tabController.index = widget.initialTabIndex;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: widget.padding,
      child: TabBar(
        controller: tabController,
        indicatorColor: widget.indicatorColor,
        unselectedLabelColor: Palette.colorTextLabel,
        labelColor: Palette.colorUserBackgroundPink,
        tabs: widget.tabs,
        onTap: widget.onTabClicked,
        labelPadding: widget.labelPadding,
      ),
    );
  }
}
