class ApplyJobModel {
    ApplyJobModel({
        required this.resume,
    });

    String resume;

    factory ApplyJobModel.fromJson(Map<String, dynamic> json) => ApplyJobModel(
        resume: json["resume"],
    );

    Map<String, dynamic> toJson() => {
        "resume": resume,
    };
}
