class RegisterModel {
  bool? status;
  String? message;
  RegisterData? data;

  RegisterModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? RegisterData.fromJson(json['data']) : null;
  }
}

class RegisterData {
  String? name;
  String? email;
  String? phone;
  int? id;
  String? image;
  String? token;

  RegisterData({
    this.id,
    this.name,
    this.email,
    this.phone,
    this.image,
    this.token,
  });

  RegisterData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    image = json['image'];
    token = json['token'];
  }
}
