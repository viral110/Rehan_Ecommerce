class LoginModel {
  bool? status;
  String? token;
  UserLoginModel? user;

  LoginModel({this.status, this.token, this.user});

  LoginModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    token = json['token'];
    user = json['user'] != null ? UserLoginModel.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['token'] = token;
    if (user != null) {
      data['user'] = user!.toJson();
    }
    return data;
  }
}

class UserLoginModel {
  int? id;
  String? name;
  String? email;
  String? phone;
  String? role;
  String? address;
  String? createdAt;
  String? updatedAt;
  int? isBlock;

  UserLoginModel(
      {this.id,
        this.name,
        this.email,
        this.phone,
        this.role,
        this.address,
        this.createdAt,
        this.updatedAt,
        this.isBlock});

  UserLoginModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    role = json['role'];
    address = json['address'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    isBlock = json['isBlock'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    data['phone'] = phone;
    data['role'] = role;
    data['address'] = address;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['isBlock'] = isBlock;
    return data;
  }
}
