class LoginRespModel {
  LoginRespModel({
    required this.accessToken,required this.role
  });

  String accessToken;
  String role;

  factory LoginRespModel.fromJson(Map<String, dynamic> json) => LoginRespModel(
        accessToken: json["access_token"],role: json["role"]
      );

  Map<String, dynamic> toJson() => {
        "access_token": accessToken, "role":role
      };
}
