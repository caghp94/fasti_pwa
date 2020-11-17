class SignUpResponse {
  int status;
  SignUpData data;

  SignUpResponse({this.status, this.data});

  SignUpResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null
        ? new SignUpData.fromJson(json['signUpData'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.data != null) {
      data['signUpData'] = this.data.toJson();
    }
    return data;
  }
}

class SignUpData {
  String id;

  SignUpData({this.id});

  SignUpData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    return data;
  }
}