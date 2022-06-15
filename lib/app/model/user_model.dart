class UserModel {
  String? uid;
  String? email;
  String? firstName;
  String? lastName;
  String? password;
  String? address;
  String? photoUrl;

  UserModel({
    this.uid,
    this.email,
    this.firstName,
    this.lastName,
    this.password,
    this.address,
    this.photoUrl,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    uid = json["uid"];
    email = json["email"];
    firstName = json["firstName"];
    lastName = json["lastName"];
    password = json["password"];
    address = json["address"];
    photoUrl = json["photoUrl"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["uid"] = this.uid;
    data["email"] = this.email;
    data["firstName"] = this.firstName;
    data["lastName"] = this.lastName;
    data["password"] = this.password;
    data["address"] = this.address;
    data["photoUrl"] = this.photoUrl;
    return data;
  }
}
