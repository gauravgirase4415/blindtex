import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

import '../../constants/app_url.dart';
import 'login_response_model.dart';

class LoginViewModel extends ChangeNotifier {
  ValueNotifier<LoginResponseModel> viewModelNotifier =
      ValueNotifier(LoginResponseModel());
  Future<LoginResponseModel> Login({
    required BuildContext context,
    required String username,
    required String password,
  }) async {
    viewModelNotifier.value = LoginResponseModel();
    const String loginUrl = AppUrl.loginApi;///api URl
    try {
      var request = http.MultipartRequest(
        'POST',
        Uri.parse(loginUrl),
      );
      ///headers of API call
      request.headers['Access-Token'] = AppUrl.token;
      request.headers['Content-Type'] = 'multipart/form-data';

      ///Body is in form-data need to use the multipart request
      request.fields['username'] = username;
      request.fields['password'] = password;

      ///Send the request to Server
      final response = await request.send();
      if (response.statusCode == 200) {
        String data = await response.stream.bytesToString();
        LoginResponseModel loginResponseModel =
            LoginResponseModel.fromJson(json.decode(data));
        viewModelNotifier.value = loginResponseModel;
        return viewModelNotifier.value;
      } else {
        return viewModelNotifier.value;
      }
    } catch (error) {
      Fluttertoast.showToast(
        msg: 'Failed to fetch data try again',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        fontSize: 16.0,
      );
      return viewModelNotifier.value;
    }
  }
}
