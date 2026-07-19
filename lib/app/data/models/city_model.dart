/// ===============================================================
/// CITY MODEL
/// ---------------------------------------------------------------
/// Model representing a city where services are available.
/// ===============================================================

class CityModel {
  const CityModel({
    required this.id,
    required this.name,
    required this.image,
    required this.description,
  });

  factory CityModel.fromMap(Map<String, dynamic> map) {
    return CityModel(
      id: map['id'] as int,
      name: map['name'] as String,
      image: map['image'] as String,
      description: map['description'] as String,
    );
  }

  final String description;
  final int id;
  final String image;
  final String name;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        other is CityModel &&
            other.id == id &&
            other.name == name &&
            other.image == image &&
            other.description == description;
  }

  @override
  int get hashCode => Object.hash(id, name, image, description);

  @override
  String toString() {
    return 'CityModel(id: $id, name: $name)';
  }

  CityModel copyWith({
    int? id,
    String? name,
    String? image,
    String? description,
  }) {
    return CityModel(
      id: id ?? this.id,
      name: name ?? this.name,
      image: image ?? this.image,
      description: description ?? this.description,
    );
  }

  Map<String, dynamic> toMap() {
    return {'id': id, 'name': name, 'image': image, 'description': description};
  }
}
