import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:icav_tech/app/constants/app_strings.dart';

Rx<String> USER_TOKEN = ''.obs;
Rx<String> USER_NAME = AppStrings.addName.obs;
Rx<String> USER_IMAGE = ''.obs;
Rx<String> USER_EMAIL = ''.obs;

class SessionManager {
  static final userStorage = GetStorage();
  static final String userToken = 'User Token';
  static final String userName = 'User Name';
  static final String userImage = 'User Image';
  static final String userEmail = 'User Email';

  static Future<void> saveUserToken(String token) async {
    USER_TOKEN.value = token;
    userStorage.write(userToken, token);
    print("User Token Saved ==> $token.");
  }

  static Future<String> getUserToken() async {
    String token = await userStorage.read(userToken) ?? '';
    USER_TOKEN.value = token;
    print("User Token ==> $token.");
    return token;
  }

  static Future<void> saveUserName(String name) async {
    USER_NAME.value = name;
    userStorage.write(userName, name);
    print("User Name Saved ==> $name.");
  }

  static Future<String> getUserName() async {
    String name = await userStorage.read(userName) ?? '';
    USER_NAME.value = name;
    print("User Name ==> $name.");
    return name;
  }

  static Future<void> saveUserImage(String image) async {
    USER_IMAGE.value = image;
    userStorage.write(userImage, image);
    print("User Image Saved ==> $image.");
  }

  static Future<String> getUserImage() async {
    String image = await userStorage.read(userImage) ?? '';
    USER_IMAGE.value = image;
    print("User Image ==> $image.");
    return image;
  }

  static Future<void> saveUserEmail(String email) async {
    USER_EMAIL.value = email;
    userStorage.write(userEmail, email);
    print("User Eamil Saved ==> $email.");
  }

  static Future<String> getUserEmail() async {
    String email = await userStorage.read(userEmail) ?? '';
    USER_EMAIL.value = email;
    print("User Email ==> $email.");
    return email;
  }

  static void clearSession() {
    userStorage.erase();
    USER_TOKEN.value = '';
    USER_NAME.value = AppStrings.addName;
    USER_IMAGE.value = '';
    USER_EMAIL.value = '';
    print("Session Cleared.");
  }
}
