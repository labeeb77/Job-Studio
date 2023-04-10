class GetAppliedPeopleModel {
    GetAppliedPeopleModel({
        required this.id,
        required this.appliedBy,
        required this.jobId,
        required this.resume,
        required this.status,
        required this.v,
        required this.profile,
    });

    String id;
    AppliedBy appliedBy;
    String jobId;
    String resume;
    String status;
    int v;
    List<dynamic> profile;

    factory GetAppliedPeopleModel.fromJson(Map<String, dynamic> json) => GetAppliedPeopleModel(
        id: json["_id"],
        appliedBy: AppliedBy.fromJson(json["applied_by"]),
        jobId: json["job_id"],
        resume: json["resume"],
        status: json["status"],
        v: json["__v"],
        profile: List<dynamic>.from(json["profile"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "applied_by": appliedBy.toJson(),
        "job_id": jobId,
        "resume": resume,
        "status": status,
        "__v": v,
        "profile": List<dynamic>.from(profile.map((x) => x)),
    };
}

class AppliedBy {
    AppliedBy({
        required this.id,
        required this.username,
        required this.email,
        required this.verified,
        required this.role,
        required this.v,
    });

    String id;
    String username;
    String email;
    bool verified;
    String role;
    int v;

    factory AppliedBy.fromJson(Map<String, dynamic> json) => AppliedBy(
        id: json["_id"],
        username: json["username"],
        email: json["email"],
        verified: json["verified"],
        role: json["role"],
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "username": username,
        "email": email,
        "verified": verified,
        "role": role,
        "__v": v,
    };
}