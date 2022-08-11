class SignUpModel {
  String? username;
  String? email;
  String? password;

  SignUpModel({this.username, this.email, this.password});

  SignUpModel.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    email = json['email'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['username'] = username;
    data['email'] = email;
    data['password'] = password;

    return data;
  }
}
