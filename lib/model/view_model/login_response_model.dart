
import 'package:blindtex/constants/app_url.dart';

class LoginResponseModel {
  String? status;
  String? errorCode;
  String? name;

  LoginResponseModel({this.status, this.errorCode, this.name,});

  LoginResponseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    errorCode = json['error_code'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['error_code'] = this.errorCode;
    data['name'] = this.name;
    return data;
  }
}