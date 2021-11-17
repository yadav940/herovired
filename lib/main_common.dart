import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import 'package:herovired/routes.dart';
import 'package:herovired/ui/usefull/palette.dart';
import 'package:herovired/ui/views/first_screen.dart';
import 'package:herovired/utils/common.dart';

Future<void> mainCommon() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(_getMaterialApp);
}

GetMaterialApp get _getMaterialApp => GetMaterialApp(
      title: 'Herovired',
      debugShowCheckedModeBanner: false,
      locale: Get.deviceLocale,
      fallbackLocale: Locale.fromSubtags(languageCode: 'en', countryCode: 'US'),
      theme: _themeData,
      getPages: Routes.get(),
      defaultTransition: Transition.rightToLeftWithFade,
      initialRoute: FirstPage.routeName,
    );

ThemeData get _themeData => ThemeData(
      visualDensity: VisualDensity.adaptivePlatformDensity,
      primarySwatch: Common.createMaterialColor(Palette.colorPrimary),
      canvasColor: Colors.transparent,
      fontFamily: 'Inter',
      scaffoldBackgroundColor: Colors.white,
      inputDecorationTheme: inputDecorationTheme,
      iconTheme: IconThemeData(color: Palette.psMain),
      textTheme: textTheme,
    );

InputDecorationTheme get inputDecorationTheme => InputDecorationTheme(
      enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          color: Palette.greyScaleLight0.withOpacity(1),
          width: 1,
        ),
      ),
      border: UnderlineInputBorder(
        borderSide: BorderSide(color: Palette.colorBorders, width: 1),
      ),
      errorBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: Colors.red, width: 1),
      ),
      focusedErrorBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: Colors.red, width: 1),
      ),
      errorStyle: TextStyle(
        color: Palette.colorError,
        fontSize: 11,
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.normal,
        letterSpacing: 0.8,
      ),
      disabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: Palette.colorBorders, width: 1),
      ),
      counterStyle: TextStyle(
        height: 1,
        fontSize: 10,
        color: Palette.greyScaleDark2.withOpacity(0.5),
      ),
    );

/// [caption] for form label,
/// [bodyText1] for form text, i.e. inputText, dropdown text etc,
TextTheme get textTheme => TextTheme(
      // Used for Form Labels
      caption: TextStyle(
        height: 1.1,
        fontSize: 10,
        letterSpacing: 0.5,
        fontWeight: FontWeight.w600,
        color: Palette.greyScaleDark3,
      ),

      // Used for emphasizing text which would otherwise be bodyText2
      bodyText1: TextStyle(
        fontSize: 14,
        height: 17 / 14,
        color: Palette.greyScaleDark0,
        fontWeight: FontWeight.bold,
      ),

      // General Default Text (Used for Form Answers)
      bodyText2: TextStyle(
        fontSize: 14,
        height: 17 / 14,
        color: Palette.greyScaleDark0,
        fontWeight: FontWeight.w400,
      ),
    );
