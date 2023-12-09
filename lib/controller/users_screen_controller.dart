import 'package:Probulon/Api/repository/get_users_repo.dart';
import 'package:get/get.dart';

class UserCntrl extends GetxController {
  List<bool> switchValues = List.generate(10, (index) => false);

  @override
  void onInit() {
    // TODO: implement onInit
    getUserRepo().getUsers();
    super.onInit();
  }
}
