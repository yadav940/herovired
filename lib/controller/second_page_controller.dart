import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:herovired/model/second_page_model.dart';
import 'package:herovired/utils/network_status.dart';

class SecondPageController extends GetxController {
  late SecondPageModel secondPageModel;
  late Rx<NetworkStatus> networkStatus = NetworkStatus.LOADING.obs;
  var data = Get.arguments;
  var courseid = Get.arguments["arguments"];
  var title = Get.arguments["title"];
  var progress = Get.arguments["progress"];

  @override
  void onInit() {
    super.onInit();
    getData(courseid);
  }

  void getData(String courseid) async {
    try {
      networkStatus.value = NetworkStatus.LOADING;
      var response = await Dio().get(
          'https://vlearn.herovired.com/webservice/rest/server.php?moodlewsrestformat=json&wsfunction=core_course_get_contents&wstoken=8ea3569f9bfad5da4000873a4d7d560d&courseid=$courseid');
      print(response);
      secondPageModel = SecondPageModel.fromJson(response.data);
      if (secondPageModel != null) {
        networkStatus.value = NetworkStatus.SUCCESS;
      } else {
        networkStatus.value = NetworkStatus.ERROR;
      }
    } catch (e) {
      print('--------exception');
      networkStatus.value = NetworkStatus.ERROR;
      print(e);
    }
  }
}
