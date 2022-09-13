// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Pokemon {
  late String id;
  late String name;
  late String image;
  late String description;
  late String type;
  late double life;
  late double defense;
  late double attack;
  
  Pokemon({
    required this.id,
    required this.name,
    required this.image,
    required this.description,
    required this.type,
    required this.life,
    required this.defense,
    required this.attack,
  });

  

  Pokemon copyWith({
    String? id,
    String? name,
    String? image,
    String? description,
    String? type,
    double? life,
    double? defense,
    double? attack,
  }) {
    return Pokemon(
      id: id ?? this.id,
      name: name ?? this.name,
      image: image ?? this.image,
      description: description ?? this.description,
      type: type ?? this.type,
      life: life ?? this.life,
      defense: defense ?? this.defense,
      attack: attack ?? this.attack,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'image': image,
      'description': description,
      'type': type,
      'life': life,
      'defense': defense,
      'attack': attack,
    };
  }

  factory Pokemon.fromMap(Map<String, dynamic> map) {
    return Pokemon(
      id: map['id'],
      name: map['name'],
      image: map['image'],
      description: map['description'],
      type: map['type'],
      life: map['life'],
      defense: map['defense'],
      attack: map['attack'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Pokemon.fromJson(String source) => Pokemon.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Pokemon(id: $id, name: $name, image: $image, description: $description, type: $type, life: $life, defense: $defense, attack: $attack)';
  }

  @override
  bool operator ==(covariant Pokemon other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.name == name &&
      other.image == image &&
      other.description == description &&
      other.type == type &&
      other.life == life &&
      other.defense == defense &&
      other.attack == attack;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      name.hashCode ^
      image.hashCode ^
      description.hashCode ^
      type.hashCode ^
      life.hashCode ^
      defense.hashCode ^
      attack.hashCode;
  }
}
