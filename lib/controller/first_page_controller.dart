import 'dart:async';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:herovired/model/first_page_model.dart';
import 'package:herovired/utils/network_status.dart';

class FirstPageController extends GetxController {
  late FirstPageModel firstPageModel;
  late  Rx<NetworkStatus> networkStatus=NetworkStatus.LOADING.obs;
  @override
  void onInit() {
    super.onInit();
    getData();
  }

  void getData() async {
    try {
      networkStatus.value = NetworkStatus.LOADING;
      var response = await Dio().get(
          'https://vlearn.herovired.com/webservice/rest/server.php?wstoken=8ea3569f9bfad5da4000873a4d7d560d&wsfunction=block_courses_get_courses&moodlewsrestformat=json&start=0&limit=0&userid=761');
      print(response);
      firstPageModel = FirstPageModel.fromJson(response.data);
      if(firstPageModel!=null){
        networkStatus.value = NetworkStatus.SUCCESS;
      }else{
        networkStatus.value = NetworkStatus.ERROR;
      }
    } catch (e) {
      print('--------exception');
      networkStatus.value = NetworkStatus.ERROR;
      print(e);
    }
  }

  @override
  void onReady() {
    super.onReady();
  }
}
