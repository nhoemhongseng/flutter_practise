// ignore_for_file: public_member_api_docs, sort_constructors_first

class UserModel {
  String? name;
  String? email;
  UserModel({
    this.name,
    this.email,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      name: json["name"],
      email: json["email"],
    );
  }

  Map toJson() {
    return {
      'name': name,
      'email': email,
    };
  }

  @override
  String toString() {
    return "name: $name" ";email: $email";
  }
}
