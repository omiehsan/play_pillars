import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../../repository/auth_repo/auth_repo.dart';
import '../../../repository/user_repo/user_repo.dart';
import '../models/users_model.dart';

class SignUpController extends GetxController {
  static SignUpController get instance => Get.find();

  final userRepo = Get.put(UserRepo());

  // TextFormField Controllers To Get Form Data

  final fullName = TextEditingController();
  final email = TextEditingController();
  final phoneNum = TextEditingController();
  final password = TextEditingController();

  void registerUser(String email, String password) {
    AuthRepo.instance.createUserEmailPass(email, password);
  }

  Future<void> createUser(UserModel userData) async {
    registerUser(userData.email, userData.password);
    userRepo.createUserDoc(userData);
  }
}
