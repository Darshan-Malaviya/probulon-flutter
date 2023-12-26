import 'package:Probulon/Api/api_response.dart';
import 'package:Probulon/Api/repository/login_repository.dart';
import 'package:Probulon/Api/response_model/log_in_response_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class LoginScreenController extends GetxController {
  bool obSecure = false;
  final formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  ApiResponse _apiResponseLogin =
      ApiResponse.initial(message: 'Initialization');

  ApiResponse get apiResponseLogin => _apiResponseLogin;

  Future<void> logInViewModel(Map<String, dynamic> body) async {
    _apiResponseLogin = ApiResponse.loading(message: 'Loading');
    update();

    LogInResponseModel response = await LogInRepo.logInRepo(body: body);
    _apiResponseLogin = ApiResponse.complete(response);

    update();
  }
}
