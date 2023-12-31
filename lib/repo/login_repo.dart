// import 'package:demo_project/models/login_model%20.dart';
import 'package:demo_project/services/login_services.dart';

class LoginRepo {
  final loginServices = LoginServices();
  Future<bool> login(
      {required String phone,
      required String password,
      required String code}) async {
    final response =
        await loginServices.login(phone: phone, password: password, code: code);
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
}
