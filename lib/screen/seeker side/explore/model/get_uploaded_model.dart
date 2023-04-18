class GetUploadedModel {
    GetUploadedModel({
        required this.id,
        required this.description,
        required this.user,
        required this.image,
        required this.createdAt,
        required this.updatedAt,
        required this.v,
        required this.comments,
        required this.likes,
    });

    String id;
    String description;
    User user;
    String image;
    DateTime createdAt;
    DateTime updatedAt;
    int v;
    List<Comment> comments;
    List<User> likes;

    factory GetUploadedModel.fromJson(Map<String, dynamic> json) => GetUploadedModel(
        id: json["_id"],
        description: json["description"],
        user: User.fromJson(json["user"]),
        image: json["image"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
        comments: List<Comment>.from(json["comments"].map((x) => Comment.fromJson(x))),
        likes: List<User>.from(json["likes"].map((x) => User.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "description": description,
        "user": user.toJson(),
        "image": image,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
        "comments": List<dynamic>.from(comments.map((x) => x.toJson())),
        "likes": List<dynamic>.from(likes.map((x) => x.toJson())),
    };
}

class Comment {
    Comment({
        required this.user,
        required this.comment,
        required this.id,
    });

    User user;
    String comment;
    String id;

    factory Comment.fromJson(Map<String, dynamic> json) => Comment(
        user: User.fromJson(json["user"]),
        comment: json["comment"],
        id: json["_id"],
    );

    Map<String, dynamic> toJson() => {
        "user": user.toJson(),
        "comment": comment,
        "_id": id,
    };
}

class User {
    User({
        required this.id,
        required this.username,
        required this.email,
        required this.password,
        required this.otp,
        required this.verified,
        required this.role,
        required this.v,
        required this.profile,
    });

    String id;
    String username;
    String email;
    String password;
    int otp;
    bool verified;
    Role role;
    int v;
    Profile profile;

    factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["_id"],
        username: json["username"],
        email: json["email"],
        password: json["password"],
        otp: json["otp"],
        verified: json["verified"],
        role: roleValues.map[json["role"]]!,
        v: json["__v"],
        profile: Profile.fromJson(json["profile"]),
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "username": username,
        "email": email,
        "password": password,
        "otp": otp,
        "verified": verified,
        "role": roleValues.reverse[role],
        "__v": v,
        "profile": profile.toJson(),
    };
}

class Profile {
    Profile({
        required this.dateOfBirth,
        required this.address,
        required this.profileImage,
    });

    DateTime dateOfBirth;
    String address;
    String profileImage;

    factory Profile.fromJson(Map<String, dynamic> json) => Profile(
        dateOfBirth: DateTime.parse(json["date_of_birth"]),
        address: json["address"],
        profileImage: json["profile_image"],
    );

    Map<String, dynamic> toJson() => {
        "date_of_birth": dateOfBirth.toIso8601String(),
        "address": address,
        "profile_image": profileImage,
    };
}
enum Role { seeker }

final roleValues = EnumValues({
    "seeker": Role.seeker
});

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        reverseMap = map.map((k, v) => MapEntry(v, k));
        return reverseMap;
    }
}