class LoginResponse {
  int status;
  String message;
  LoginData data;

  LoginResponse({this.status, this.message, this.data});

  LoginResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['LoginData'] != null
        ? new LoginData.fromJson(json['LoginData'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['LoginData'] = this.data.toJson();
    }
    return data;
  }
}

class LoginData {
  String id;
  int phoneNumber;
  int iV;
  String name;
  String password;

  LoginData({this.id, this.phoneNumber, this.iV, this.name, this.password});

  LoginData.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    phoneNumber = json['phoneNumber'];
    iV = json['__v'];
    name = json['name'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.id;
    data['phoneNumber'] = this.phoneNumber;
    data['__v'] = this.iV;
    data['name'] = this.name;
    data['password'] = this.password;
    return data;
  }
}