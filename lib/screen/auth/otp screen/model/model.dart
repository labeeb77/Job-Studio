
class OtpModel {
    OtpModel({
        required this.email,
        required this.otp,
    });

    String email;
    int otp;

    factory OtpModel.fromJson(Map<String, dynamic> json) => OtpModel(
        email: json["email"],
        otp: json["otp"],
    );

    Map<String, dynamic> toJson() => {
        "email": email,
        "otp": otp,
    };
}
