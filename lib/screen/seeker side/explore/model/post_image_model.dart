class PostImageModel {
    PostImageModel({
        required this.image,
        required this.description,
    });

    String image;
    String description;

    factory PostImageModel.fromJson(Map<String, dynamic> json) => PostImageModel(
        image: json["image"],
        description: json["description"],
    );

    Map<String, dynamic> toJson() => {
        "image": image,
        "description": description,
    };
}
