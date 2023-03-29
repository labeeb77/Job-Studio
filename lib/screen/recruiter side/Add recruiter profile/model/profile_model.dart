class RecruiterProfileModel {
    RecruiterProfileModel({
        required this.companyName,
        required this.establishedDate,
        required this.companyEmail,
        required this.country,
        required this.address,
    });

    String companyName;
    EstablishedDate establishedDate;
    String companyEmail;
    String country;
    String address;

    factory RecruiterProfileModel.fromJson(Map<String, dynamic> json) => RecruiterProfileModel(
        companyName: json["company_name"],
        establishedDate: EstablishedDate.fromJson(json["established_date"]),
        companyEmail: json["company_email"],
        country: json["country"],
        address: json["address"],
    );

    Map<String, dynamic> toJson() => {
        "company_name": companyName,
        "established_date": establishedDate.toJson(),
        "company_email": companyEmail,
        "country": country,
        "address": address,
    };
}

class EstablishedDate {
    EstablishedDate();

    factory EstablishedDate.fromJson(Map<String, dynamic> json) => EstablishedDate(
    );

    Map<String, dynamic> toJson() => {
    };
}
