class FavouriteModel {
  num? id;
  String? title;
  num? price;
  String? description;
  String? category;
  String? image;
  Rating? rating;
  int? quantity;
  bool? isExist;
  bool? favourite;
  String? time;

  FavouriteModel({
    this.id,
    this.title,
    this.price,
    this.description,
    this.category,
    this.image,
    this.rating,
    this.isExist,
    this.quantity,
    this.time,
    this.favourite = false,
  });

  // FavouriteModel.fromJson(Map<String, dynamic> json) {
  //   id = json["id"];
  //   title = json["title"];
  //   price = json["price"];
  //   description = json["description"];
  //   category = json["category"];
  //   image = json["image"];
  //   isExist = json["isExist"];
  //   quantity = json["quantity"];
  //   time = json["time"];
  //   favourite = json["favourite"];
  // }

  factory FavouriteModel.fromJson(Map<String, dynamic> json) {
    return FavouriteModel(
      id: json['id'],
      title: json['title'],
      price: json['price'],
      description: json['description'],
      category: json['category'],
      image: json['image'],
      rating:
          json['rating'] != null ? new Rating.fromJson(json['rating']) : null,
      isExist: json["isExist"],
      quantity: json["quantity"],
      time: json["time"],
      favourite: json["favourite"],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['id'] = this.id;
    data['title'] = this.title;
    data['price'] = this.price;
    data['description'] = this.description;
    data['category'] = this.category;
    data['image'] = this.image;
    if (this.rating != null) {
      data['rating'] = this.rating!.toJson();
    }
    data["favourite"] = this.favourite;
    data["isExist"] = this.isExist;
    data["quantity"] = this.quantity;
    data["time"] = this.time;
    return data;
  }
}

class Rating {
  num? rate;
  num? count;

  Rating({this.rate, this.count});

  Rating.fromJson(Map<String, dynamic> json) {
    rate = json['rate'] ?? 0;
    count = json['count'] ?? 0;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['rate'] = this.rate;
    data['count'] = this.count;
    return data;
  }
}
