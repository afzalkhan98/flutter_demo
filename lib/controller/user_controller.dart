import 'package:get/get.dart';

import '../model/user.dart';
import '../service/api_service.dart';


class UserController extends GetxController {
  var users = [].obs;
  var isLoading = true.obs;
  var isYesChecked = false.obs;
  var isNoChecked = false.obs;
  void toggleYes() {
    isYesChecked.value = !isYesChecked.value;
    if (isYesChecked.value) {
      isNoChecked.value = false;
    }
  }

  // Method to toggle the No checkbox
  void toggleNo() {
    isNoChecked.value = !isNoChecked.value;
    if (isNoChecked.value) {
      isYesChecked.value = false;
    }
  }

  @override
  void onInit() {
    fetchUsers();
    super.onInit();
  }

  void fetchUsers() async {
    Future.delayed(Duration(seconds: 1), () async {
      try {
        isLoading(true);
        var usersResult = await ApiService().fetchUsers();
        users.assignAll(usersResult);
      } finally {
        isLoading(false);
      }
    });
  }
}