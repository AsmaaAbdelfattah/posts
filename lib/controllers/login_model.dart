import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:posts/helpers/endpoints.dart';
import 'package:posts/services/networking_service.dart';

class LoginModel extends GetxController {
  String? email;
  String? password;
  NetworkingService networkingService = NetworkingService();

  bool validateEmail() {
    final emailRegex = RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    );

    if (email == null || email!.isEmpty) {
      return false;
    } else if (!emailRegex.hasMatch(email!)) {
      return false;
    }
    // Add more email validation logic if needed
    return true;
  }

  bool validatePassword() {
    if (password == null || password!.isEmpty) {
      return false;
    } else if (password!.length < 6) {
      return false;
    }
    // Add more password validation logic if needed
    return true;
  }

  Future<bool> login() async {
    networkingService
        .request(
          path: Endpoints.login,
          method: HttpMethod.post,
          body: {'email': email, 'password': password},
          fromJsonT: (data) =>
              data, // Assuming the response is a simple JSON object
        )
        .then((response) {
          if (response.data != null) {
           
            return true;
          } else {
           
            return false;
          }
        })
        .catchError((error) {
     
          return false;
        });
    return false; 
  }
}
