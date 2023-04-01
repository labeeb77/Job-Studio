class GetJobModel {
    GetJobModel({
        required this.id,
        required this.position,
        required this.companyId,
        required this.locationType,
        required this.salary,
        required this.type,
        required this.description,
        required this.v,
    });

    String id;
    String position;
    String companyId;
    String locationType;
    int salary;
    String type;
    String description;
    int v;

    factory GetJobModel.fromJson(Map<String, dynamic> json) => GetJobModel(
        id: json["_id"],
        position: json["position"],
        companyId: json["company_id"],
        locationType: json["location_type"],
        salary: json["salary"],
        type: json["type"],
        description: json["description"],
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "position": position,
        "company_id": companyId,
        "location_type": locationType,
        "salary": salary,
        "type": type,
        "description": description,
        "__v": v,
    };
}
