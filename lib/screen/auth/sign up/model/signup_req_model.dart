class SignupReqModel {
    SignupReqModel({
        required this.email,
        required this.password,
        required this.username,
    });

    String email;
    String password;
    String username;

    factory SignupReqModel.fromJson(Map<String, dynamic> json) => SignupReqModel(
        email: json["email"],
        password: json["password"],
        username: json["username"],
    );

    Map<String, dynamic> toJson() => {
        "email": email,
        "password": password,
        "username": username,
    };
}