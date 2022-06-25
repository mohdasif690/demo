import 'package:flutter_application_7/HomePage/home_page_model.dart';
import 'package:flutter_application_7/HomePage/home_page_provider.dart';
import 'package:flutter_application_7/api_client.dart';
import 'package:get/get.dart';

class HomePageController extends GetxController with StateMixin<HomePgaeModel> {
  AllUsers() async {
    Client client = Client();
    HomePageProvider homePageProvider = HomePageProvider(client: client.init());
    try {
      homePageProvider.getAllUsers().then((value) {
        change(value, status: RxStatus.success());
      }, onError: (err) {
        change(null, status: RxStatus.error(err.toString()));
      });
    } catch (e) {
      change(null, status: RxStatus.error(e.toString()));
    }
  }

  @override
  void onInit() {
    AllUsers();
    super.onInit();
  }
}
