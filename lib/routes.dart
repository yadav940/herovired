/*import 'package:flutter_super_app/routes/attendance_routes.dart';
import 'package:flutter_super_app/routes/directory_routes.dart';
import 'package:flutter_super_app/routes/helpdesk_routes.dart';
import 'package:flutter_super_app/routes/initial_routes.dart';
import 'package:flutter_super_app/routes/learning_routes.dart';
import 'package:flutter_super_app/routes/leave_routes.dart';
import 'package:flutter_super_app/routes/payroll_routes.dart';
import 'package:flutter_super_app/routes/profile_routes.dart';
import 'package:flutter_super_app/routes/toolbar_routes.dart';
import 'package:flutter_super_app/routes/setting_routes.dart';*/
import 'package:get/get.dart';
import 'package:herovired/routes/initial_routes.dart';

class Routes {
  Routes._();

  static List<GetPage> get() {
    final moduleRoutes = <GetPage>[];
    moduleRoutes.addAll(InitialRoutes.routes);
    return moduleRoutes;
  }
}
