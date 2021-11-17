import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// Use this to navigate instead of Get.to
///
/// [route] is the Route name constant that you would have defined somewhere
///
/// [currentPageTitle] is necessary since, on the next page, this value will be read in order to
/// show this string on the AppBar, indicating that by navigating Back, user will be redirected
/// to the page mentioned
///
/// [arguments] are the data that you want to pass on to the next page.
/// If you are using [AppPageWithAppBar] or [AppPageWithSliverAppBar], you will receive these arguments
/// directly through the `arguements` getter in those Widgets rather than from `Get.arguments`
///
/// We can't directly use toNamed<T> because there is a known issue
/// https://github.com/flutter/flutter/issues/57186
Future<T?> navigateTo<T>(
  String route, {
  String? currentPageTitle,
  dynamic arguments,
}) async {
  var result = await Get.toNamed(route, arguments: {
    'title': currentPageTitle,
    'arguments': arguments,
  });
  try {
    return result as T;
  } catch (e) {
    return null;
  }
}

Future<T?> navigateOffAndTo<T>(
  String route, {
  String? currentPageTitle,
  dynamic arguments,
}) async {
  var result = await Get.offAndToNamed(route, arguments: {
    'title': currentPageTitle,
    'arguments': arguments,
  });
  try {
    return result as T;
  } catch (e) {
    return null;
  }
}

Future<T?> navigateOffAll<T>(
  String route, {
  String? currentPageTitle,
  dynamic arguments,
}) async {
  var result = await Get.offAllNamed(route, arguments: {
    'title': currentPageTitle,
    'arguments': arguments,
  }, );
  try {
    return result as T;
  } catch (e) {
    return null;
  }
}

Future<T?> navigateOffNamedUntil<T>(
  String route, {
  String? currentPageTitle,
  dynamic arguments,
}) async {
  var result = await Get.offNamedUntil(
    route,
    (route) => true,
    arguments: {
      'title': currentPageTitle,
      'arguments': arguments,
    },
  );
  try {
    return result as T;
  } catch (e) {
    return null;
  }
}

bool popUntil(String routeName) {
  final context = Get.context;
  if (context == null) return false;
  Navigator.of(context).popUntil(ModalRoute.withName(routeName));
  return true;
}
