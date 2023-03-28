class SignUpRespModel {
  SignUpRespModel({
    required this.message,
    required this.accessToken,
  });

  String message;
  String accessToken;

  factory SignUpRespModel.fromJson(Map<String, dynamic> json) => SignUpRespModel(
        message: json["message"],
        accessToken: json["access_token"],
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "access_token": accessToken,
      };
}