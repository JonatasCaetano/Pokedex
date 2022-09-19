// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class User {
  late String name;
  late String email;
  late String image;
  User({
    required this.name,
    required this.email,
    required this.image,
  });

  User copyWith({
    String? name,
    String? email,
    String? image,
  }) {
    return User(
      name: name ?? this.name,
      email: email ?? this.email,
      image: image ?? this.image,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'email': email,
      'image': image,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      name: map['name'],
      email: map['email'],
      image: map['image'],
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) =>
      User.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'User(name: $name, email: $email, image: $image)';

  @override
  bool operator ==(covariant User other) {
    if (identical(this, other)) return true;

    return other.name == name && other.email == email && other.image == image;
  }

  @override
  int get hashCode => name.hashCode ^ email.hashCode ^ image.hashCode;
}
