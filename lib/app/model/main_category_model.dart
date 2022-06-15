class MainCategoryModel {
  String? title, image;

  MainCategoryModel({required this.image, required this.title});

  factory MainCategoryModel.fromJson(Map<String, dynamic> json) {
    return MainCategoryModel(image: json["image"], title: json["title"]);
  }
}
