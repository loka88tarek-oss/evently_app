class UserModel {
  String? name;
  String? id;
  String? password;
  String email;
  UserModel({required this.email, this.name,  this.password, this.id});
  Map<String, dynamic> toJson() {
    return {"name": name, "email": email, "id": id};
  }

  static UserModel fromJson(Map<String, dynamic> json) {
    return UserModel(
      email: json['email'],
      password: json['password'],
      id: json['id'],
      name: json['name'],
    );
  }
}
