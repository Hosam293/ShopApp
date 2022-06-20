class LoginData {
  String? message;
  bool? status;
  Data? data;

  LoginData.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ?  Data.fromJson(json['data']) : null;
  }}

class Data {
  String? token;
  String? image;
  String? phone;
  String? email;
  String? name;
  int? id;



  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    image = json['image'];
    token = json['token'];
  }
}
