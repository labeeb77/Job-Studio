class LoginRespModel {
  LoginRespModel({
    required this.accessToken,
  });

  String accessToken;

  factory LoginRespModel.fromJson(Map<String, dynamic> json) => LoginRespModel(
        accessToken: json["access_token"],
      );

  Map<String, dynamic> toJson() => {
        "access_token": accessToken,
      };
}
