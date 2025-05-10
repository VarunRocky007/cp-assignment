import 'package:cross_platform_assignment/app_constants.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';

class UserRemoteDataSource {
  Future<bool> login({
    required String username,
    required String password,
  }) async {
    final ParseUser response = ParseUser(
      username,
      password,
      null,
    );
    final loginResponse = await response.login();
    if(loginResponse.success) {
      AppConstants.loggedInUser = loginResponse.result;
      return true;
    }
    return false;

  }

  Future<bool> signUp({
    required String username,
    required String password,
    required String emailAddress,
  }) async {
    final ParseUser response = ParseUser.createUser(
      username,
      password,
      null,
    );
    final signUpResponse = await response.signUp(allowWithoutEmail: true);
    if(signUpResponse.success) {
      return true;
    }
    return false;
  }

  Future<void> logout() async {
    AppConstants.loggedInUser?.logout();
    AppConstants.loggedInUser = null;
  }
}
