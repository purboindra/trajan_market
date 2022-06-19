import 'package:trajan_market/app/model/all_products_model.dart';

class CartModel {
  num? id;
  String? title;
  num? price;
  String? description;
  String? category;
  String? image;
  Rating? rating;
  int? quantity;
  bool? isExist;
  String? time;
  int? paymentMethod;
  AllProductsModel? allProductsModel;

  CartModel({
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
    this.allProductsModel,
    this.paymentMethod,
  });

  // factory CartModel.fromJson(Map<String, dynamic> json) {
  //   return CartModel(
  //     id: json['id'],
  //     title: json['title'],
  //     price: json['price'],
  //     description: json['description'],
  //     category: json['category'],
  //     image: json['image'],
  //     rating:
  //         json['rating'] != null ? new Rating.fromJson(json['rating']) : null,
  //     isExist: json["isExist"],
  //     quantity: json["quantity"],
  //     time: json["time"],
  //     allProductsModel: AllProductsModel.fromJson(json["allProductsModel"]),
  //   );
  // }

  CartModel.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    title = json["title"];
    price = json["price"];
    description = json["description"];
    category = json["category"];
    image = json["image"];
    isExist = json["isExist"];
    quantity = json["quantity"];
    time = json["time"];
    rating = json["rating"] != null ? Rating.fromJson(json["rating"]) : null;
    allProductsModel = json["allProductsModel"] != null
        ? AllProductsModel.fromJson(json["allProductsModel"])
        : null;
    paymentMethod = json["paymentMethod"];
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
    data["isExist"] = this.isExist;
    data["quantity"] = this.quantity;
    data["time"] = this.time;
    data['allProductsModel'] = this.allProductsModel;
    data["paymentMethod"] = this.paymentMethod;
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
