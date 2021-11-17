import 'package:get/get.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:herovired/ui/usefull/palette.dart';
import 'package:herovired/ui/usefull/styles/card_styles.dart';

// This file is supposed to contain all customized popup related stuff like showBottomSheet, showSnackbar etc.,

/// Show custom Bottom sheet with Rounded Shape and Drag Pick automatically embedded
///
/// Set [maxHeight] to control the height of the Bottom Sheet. Defaults to 0.8 of screen height
///
/// Set a [background] Decoration Image for the entire Bottom Sheet
///
/// Set a [dragPickColor] which will be used to fill the dragPick container
Future<T?> showAppBottomSheet<T>({
  required Widget child,
  double? maxHeight,
  DecorationImage? background,
  Color? dragPickColor,
  bool dragDismissible=true,
  double initialChildSize=0.7
}) async {
  return await showModalBottomSheet<T>(
    isScrollControlled: true,
    isDismissible: false,
    barrierColor: Palette.greyScaleDark0.withOpacity(0.91),
    context: Get.context!,
    builder: (_) => BottomSheetContainer(
      child: child,
      maxHeight: maxHeight,
      background: background,
      dragPickColor: dragPickColor,
        dragDismissible:dragDismissible,
        initialChildSize:initialChildSize
    ),
  );
}

class BottomSheetContainer extends StatelessWidget {
  final Widget child;
  final double? maxHeight;
  final double initialChildSize;
  final DecorationImage? background;
  final Color? dragPickColor;
  final bool dragDismissible;

  BottomSheetContainer({
    required this.child,
    this.maxHeight,
    required this.initialChildSize,
    this.background,
    this.dragPickColor,
    required this.dragDismissible,
  });

  double get calculatedMaxHeight => maxHeight ?? Get.height * 0.8;

  Widget shape({required Widget child}) {
    return DraggableScrollableSheet(
      initialChildSize: initialChildSize,
      maxChildSize: 0.9,
      minChildSize: dragDismissible?0.3:0.0,
      builder: (BuildContext context, ScrollController scrollController) {
        return Container(
          constraints: BoxConstraints(maxHeight: calculatedMaxHeight),
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
            image: background,
            color: Colors.white,
            boxShadow: CardStyles.basicShadows,
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(12), topRight: Radius.circular(12)),
          ),
          child: ListView(
            shrinkWrap: true,
            controller: scrollController,
            children: [
              child
            ],
          ),
        );
      },
      /*child: ,*/
    );
  }

  Widget get dragPick {
    return Container(
      width: 46,
      height: 6,
      margin: EdgeInsets.all(9),
      decoration: BoxDecoration(
        color: dragPickColor ?? Palette.dividerColor,
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return shape(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          dragPick,
          ConstrainedBox(
            // The 24 here is the height of the drag pick and this constraint was necessary to restrict the content from overflowing and let the scroll get activated in cases of a scrollable content
            // We could not use an Expanded in order to trigger the scroll since that meant that even when the scrollable content is not much, the bottom sheet will still be taking up the full max height.
            constraints: BoxConstraints(maxHeight: calculatedMaxHeight - 24),
            child: child,
          ),
          // child,
        ],
      ),
    );
  }
}
